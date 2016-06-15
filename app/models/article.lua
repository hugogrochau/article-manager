local Model = require("lapis.db.model").Model

local Article = Model:extend("article", {
    relations = {
        {"conference", belongs_to = "Conference"},
        {"author_article", has_many = "AuthorArticle"}
    }
})

return Article
