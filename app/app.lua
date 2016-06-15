local lapis = require("lapis")
local app = lapis.Application()
local Person = require("models.person")
local db = require("lapis.db")

app:enable("etlua")
app.layout = require("views.layout")

app:get("/", function(self)
    return { render = "index" }
end)

app:match("/person", function(self)
    person = Person:create({
        email = self.params.email,
        name = self.params.name
    })
    return "Created person called " .. person.name .. " with the email " .. person.email
end)

return app
