local Model = require("lapis.db.model").Model

local Article = Model:extend("article", {
    relations = {
        {"conference", has_one = "Conference"},
        {"author_articles", has_many = "AuthorArticle", key = "article_id"}
    }
})

return Article
