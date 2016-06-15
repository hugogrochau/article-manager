local Model = require("lapis.db.model").Model

local EditorConference = Model:extend("editor_conference", {
    relations = {
        {"conference", belongs_to = "Conference"},
        {"person", belogs_to = "Person"}
    }
})

return EditorConference
