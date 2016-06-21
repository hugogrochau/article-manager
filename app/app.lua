local lapis = require("lapis")
local app = lapis.Application()
local Person = require("models.person")
--local db = require("lapis.db")

app:enable("etlua")
app.layout = require("views.layout")

app:get("/", function(self)
    return { render = "index" }
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
    return "Created person called " .. person.name .. " with the email " .. person.email
end)

return app
