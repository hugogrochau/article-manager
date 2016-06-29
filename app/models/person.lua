local Model = require("lapis.db.model").Model

local Person = Model:extend("person", {
    relations = {
        {"author_articles", has_many = "AuthorArticle"},
        {"editor_conferences", has_many = "EditorConference"}
    }
})

return Person
