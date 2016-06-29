local lapis = require("lapis")
local app = lapis.Application()
local Person = require("models.person")
local Conference = require("models.conference")
--local db = require("lapis.db")

app:enable("etlua")
app.layout = require("views.layout")

app:get("/", function(self)
    self.conferences = Conference:select()
    return { render = "index" }
end)

app:get("/conferences", function(self)
    self.conferences = Conference:select()
    return { render = "conferences" }
    -- return self.conferences[1].date
end)

app:get("/administrator", function(self)
    self.administrator = Person:select()
    return { render = "administrator" }
    -- return self.conferences[1].date
end)

app:match("/articles", function(self)
  local articles= {}

  articles[1] = {}
  articles[1].title = "article_a"
  articles[1].desc = "desc_article_a"

  articles[2] = {}
  articles[2].title = "article_b"
  articles[2].desc = "desc_article_b"

  articles[3] = {}
  articles[3].title = "article_c"
  articles[3].desc = "desc_article_c"

  self.articles = articles
  return { render = "articles" }
end)

app:match("/person", function(self)
    person = Person:create({
        email = self.params.email,
        name = self.params.name
    })
    --return "Created person called " .. person.name .. " with the email " .. person.email
    self.administrator = Person:select()
    return { render = "administrator"}
end)

app:post("/conference", function(self)
    conference = Conference:create({
        issm = self.params.issm,
        doi = self.params.doi,
        place = self.params.place,
        date = self.params.date,
        name = self.params.name
    })
    --return "Created conference called " .. conference.name .. " with the issm " .. conference.issm
    self.conferences = Conference:select()
    return { render = "conferences"}
end)


return app










