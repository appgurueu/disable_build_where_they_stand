return {
    type = "table",
    entries = {
        entities = {
            type = "boolean",
            description = "Also check for entities standing there",
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
