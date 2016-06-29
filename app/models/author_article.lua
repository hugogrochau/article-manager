local Model = require("lapis.db.model").Model

local AuthorArticle = Model:extend("author_article", {
    relations = {
        {"article", belongs_to = "Article"},
        {"person", belongs_to = "Person"}
    }
})

return AuthorArticle
