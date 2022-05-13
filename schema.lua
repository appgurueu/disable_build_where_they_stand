return {
    type = "table",
    entries = {
        players = {
            type = "boolean",
            description = "Check for players",
            default = true
        },
        entities = {
            type = "boolean",
            description = "Check for entities",
            default = true
        },
        nodes = {
            type = "boolean",
            description = "Check for nodes",
            default = true
        },
        search_radius = {
            type = "number",
            description = "Search radius for entities & players",
            range = {min_exclusive = 0, max = 100},
            default = 10
        },
        test = {
            description = "Enable debug mode (visualization of boxes)",
            type = "boolean",
            default = false
        }
    }
}
