local Model = require("lapis.db.model").Model

local Conference = Model:extend("conference", {
    relations = {
        {"articles", has_many = "Article"},
        {"editor_conference", has_many = "EditorConference"}
    }
})

return Conference
