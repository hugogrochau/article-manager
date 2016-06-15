local Model = require("lapis.db.model").Model

local Conference = Model:extend("conference", {
    relations = {
        {"article", has_one = "Article"},
        {"editor_conference", has_many = "EditorConference"}
    }
})

return Conference
