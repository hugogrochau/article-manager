local lapis = require("lapis")
local app = lapis.Application()
local Person = require("models.person")
local Conference = require("models.conference")
--local db = require("lapis.db")

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
    -- return self.conferences[1].date
end)

app:get("administrator", "/administrator", function(self)
    self.administrator = Person:select()
    return { render = "administrator" }
    -- return self.conferences[1].date
end)

-- POST routes

app:post("conference", "/conference", function(self)
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
