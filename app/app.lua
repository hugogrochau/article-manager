local lapis = require("lapis")
local app = lapis.Application()
local Person = require("models.person")
local Conference = require("models.conference")
local Article = require("models.article")

app:enable("etlua")
app.layout = require("views.layout")

-- GET Routes

app:get("index", "/", function(self)
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


return app
