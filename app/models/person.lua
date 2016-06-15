local Model = require("lapis.db.model").Model

local Person = Model:extend("person", {
    relations = {
        {"author_article", has_many = "AuthorArticle"},
        {"editor_conference", has_many = "EditorConference"}
    }
})

return Person
