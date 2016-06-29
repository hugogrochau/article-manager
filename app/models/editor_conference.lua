local Model = require("lapis.db.model").Model

local EditorConference = Model:extend("editor_conference", {
    relations = {
        {"conference", has_one = "Conference"},
        {"person", has_one = "Person"}
    }
})

return EditorConference
