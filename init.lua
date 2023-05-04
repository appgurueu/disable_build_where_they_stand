local modname = minetest.get_current_modname()
local dbwts = {}
rawset(_G, modname, dbwts)
local conf = modlib.mod.configuration()
dbwts.conf = conf
local visualize_box = loadfile(minetest.get_modpath(modname) .. "/test.lua")()
assert(modlib.minetest.get_node_collisionboxes, "upgrade modlib")

minetest.register_on_placenode(function(pos, newnode, _player, oldnode)
    if (minetest.registered_nodes[newnode.name] or {}).walkable == false then
        return
    end
    local entities, search_radius = conf.entities, conf.search_radius
    local objects = entities and minetest.get_objects_inside_radius(pos, search_radius) or minetest.get_connected_players()
    for index, object in pairs(objects) do
        if entities then
            if not (object:is_player() or object:get_properties().physical) then
                objects[index] = nil
            end
        else
            if vector.distance(object:get_pos(), pos) > search_radius then
                objects[index] = nil
            end
        end
    end
    for _, object in pairs(objects) do
        local collisionbox_player = object:get_properties().collisionbox
        -- Make the collisionbox slightly smaller to address literal edge cases such as scaffolding
        local epsilon = 1e-6
        for i = 1, 3 do
            collisionbox_player[i] = collisionbox_player[i] + epsilon
            collisionbox_player[i+3] = collisionbox_player[i+3] - epsilon
        end
        local diff = modlib.vector.from_minetest(vector.subtract(object:get_pos(), pos))
        for _, collisionbox in pairs(modlib.minetest.get_node_collisionboxes(pos)) do
            if conf.test then visualize_box(pos, collisionbox) end
            if modlib.vector.box_box_collision(diff, collisionbox_player, collisionbox) then
                -- TODO tell player why they can't build
                minetest.set_node(pos, oldnode)
                return true
            end
        end
    end
end)
