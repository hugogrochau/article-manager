local lapis = require("lapis")
local db = require("lapis.db")
local Validate = require("lapis.validate")
local Person = require("models.person")
local Conference = require("models.conference")
local Article = require("models.article")
local app = lapis.Application()

app:enable("etlua")
app.layout = require("views.layout")

-- GET Routes

app:get("index", "/", function(self)
    self.top_articles = db.query("SELECT * FROM article ORDER BY download_count LIMIT 10;") or {}
    self.conferences = Conference:select()
    return { render = "index" }
end)

app:get("conferences", "/conferences", function(self)
    self.conferences = Conference:select()
    return { render = "conferences" }
end)

app:get("conference", "/conference/:id", function(self)
    self.conference = Conference:find(self.params.id)
    return { render = "conference" }
end)

app:get("administrator", "/administrator", function(self)
    self.administrator = Person:select()
    return { render = "administrator" }
end)

app:get("/articles", function(self)
    self.articles    = Article:select() or {}
    self.conferences = Conference:select() or {}

    --return tostring(self.conferences[1].id)
    return { render = "articles" }
end)

-- POST routes

app:post("add_conference", "/conference", function(self)
    conference = Conference:create({
        issm = self.params.issm,
        doi = self.params.doi,
        place = self.params.place,
        date = self.params.date,
        name = self.params.name
    })
    self.conferences = Conference:select()
    return { render = "conferences"}
end)

app:match("add_person","/person", function(self)
    person = Person:create({
        email = self.params.email,
        name = self.params.name,
        password = self.params.password
    })
    self.administrator = Person:select()
    return { render = "administrator"}
end)

app:post("/article", function(self)
    Validate.assert_valid(self.params, {
        { "conference", exists = true },
        { "file", is_file = true }
    })

    ---- solve this!
    --local persons = Person:find_all({1,2,3,4 ...})

    local article = Article:create({
        title = self.params.title,
        abstract = self.params.abstract,
        conference_id = self.params.conference,
        file_path = "static/articles/"..self.params.file,
        download_count = 0
    })
    return "Created an article " .. self.params.title
end)

return app
