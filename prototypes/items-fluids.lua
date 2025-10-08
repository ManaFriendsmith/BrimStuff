local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")
local item_sounds = require("__base__/prototypes/item_sounds")
local space_age_item_sounds = "foo"

data:extend({
    {
        type = "fluid",
        name = "nitric-acid",
        icon = "__BrimStuff__/graphics/icons/nitric-acid.png",
        icon_size = 64,
        subgroup = "fluid",
        order = "a[fluid]-b[oil]-g",
        default_temperature = 15,
        canonical_cost = 0.15,
        base_color = {0.7, 0.7, 1, 1},
        flow_color = {0.8, 0.9, 0.9, 1},
        visualization_color = {0.7, 0.7, 1, 1}
    },
    {
        type = "fluid",
        name = "chemical-waste",
        icon = "__BrimStuff__/graphics/icons/chemical-waste.png",
        icon_size = 64,
        subgroup = "fluid",
        order = "a[fluid]-b[oil]-ga",
        default_temperature = 15,
        canonical_cost = 0.001,
        base_color = {0.5, 0, 0.8, 1},
        flow_color = {1, 0, 1, 1},
        visualization_color = {0.5, 0, 0.8, 1}
    },
    {
        type = "item",
        name = "rubber",
        icon = "__BrimStuff__/graphics/icons/rubber.png",
        subgroup = (data.raw.item["brimstuff-greenhouse"] and not mods["space-age"]) and "brimstuff-botany" or "raw-material",
        order = (data.raw.item["brimstuff-greenhouse"] and not mods["space-age"]) and "z" or "b[chemistry]-a2",
        color_hint = { text = "R" },
        inventory_move_sound = item_sounds.plastic_inventory_move,
        pick_sound = item_sounds.plastic_inventory_pickup,
        drop_sound = item_sounds.plastic_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        weight = 0.5*kg
    },
    {
        type = "item",
        name = "potassium-nitrate",
        icon = "__BrimStuff__/graphics/icons/potassium-nitrate.png",
        subgroup = (data.raw.item["brimstuff-greenhouse"] and not mods["space-age"]) and "brimstuff-botany" or "raw-material",
        order = (data.raw.item["brimstuff-greenhouse"] and not mods["space-age"]) and "0" or "b[chemistry]-a1",
        color_hint = { text = "R" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        default_import_location = "nauvis",
        weight = 1*kg
    }
})

if mods["space-age"] then
    data:extend({
        {
            type = "item",
            name = "panspermia-asteroid-chunk",
            icon = "__pf-sa-compat__/graphics/icons/panspermia-asteroid-chunk.png",
            icon_size = 64,
            mipmap_count = 4,
            subgroup = "space-material",
            order = "cb",
            color_hint = { text = "B" },
            inventory_move_sound = item_sounds.resource_inventory_move,
            pick_sound = item_sounds.resource_inventory_pickup,
            drop_sound = item_sounds.resource_inventory_move,
            stack_size = 1,
            default_import_location = "nauvis",
            weight = 100*kg
        },
        {
            type = "item",
            name = "carbofungus-spore",
            icon = "__BrimStuff__/graphics/icons/carbofungus-spore.png",
            subgroup = "brimstuff-botany",
            order = "f",
            color_hint = { text = "R" },
            inventory_move_sound = item_sounds.wood_inventory_move,
            pick_sound = item_sounds.wood_inventory_pickup,
            drop_sound = item_sounds.wood_inventory_move,
            stack_size = 200,
            default_import_location = "vulcanus",
            weight = 1*kg
        },
        {
            type = "item",
            name = "metalcelium-spore",
            icon = "__BrimStuff__/graphics/icons/metalcelium-spore.png",
            subgroup = "brimstuff-botany",
            order = "g",
            color_hint = { text = "R" },
            inventory_move_sound = item_sounds.wood_inventory_move,
            pick_sound = item_sounds.wood_inventory_pickup,
            drop_sound = item_sounds.wood_inventory_move,
            stack_size = 200,
            default_import_location = "gleba",
            weight = 0.25*kg
        }
    })

    data.raw.item["carbofungus-spore"].spoil_ticks = 2 * minute
    data.raw.item["carbofungus-spore"].spoil_result = "carbon"
end

if misc.difficulty == 1 then
    return
end

data:extend({
    {
        type = "item",
        name = "gunpowder",
        icon = "__BrimStuff__/graphics/icons/gunpowder.png",
        subgroup = "raw-material",
        order = "b[chemistry]-a3",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.explosive_inventory_move,
        pick_sound = item_sounds.explosive_inventory_pickup,
        drop_sound = item_sounds.explosive_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        weight = 5*kg
    },
    {
        type = "item",
        name = "drive-belt",
        icon = "__BrimStuff__/graphics/icons/drive-belt.png",
        subgroup = "intermediate-product",
        order = "c[advanced-intermediates]-1a2",
        inventory_move_sound = item_sounds.plastic_inventory_move,
        pick_sound = item_sounds.plastic_inventory_pickup,
        drop_sound = item_sounds.plastic_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        weight = 1.666*kg
    },
    {
        type = "item",
        name = "airtight-seal",
        icon = "__BrimStuff__/graphics/icons/airtight-seal.png",
        subgroup = "intermediate-product",
        order = "a[basic-intermediates]-db",
        inventory_move_sound = item_sounds.plastic_inventory_move,
        pick_sound = item_sounds.plastic_inventory_pickup,
        drop_sound = item_sounds.plastic_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        weight = 3*kg
    },
    {
        type = "item",
        name = "toluene",
        icon = "__BrimStuff__/graphics/icons/toluene.png",
        subgroup = "raw-material",
        order = "b[chemistry]-a4",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 100,
        fuel_category = "chemical",
        fuel_value = "1MJ",
        default_import_location = "nauvis",
        weight = 1*kg
    }
})

if mods["bzgas"] then
    data:extend({
        {
            type = "item",
            name = "tnt",
            icon = "__BrimStuff__/graphics/icons/tnt.png",
            subgroup = "raw-material",
            order = "b[chemistry]-e",
            inventory_move_sound = item_sounds.explosives_inventory_move,
            pick_sound = item_sounds.explosives_inventory_pickup,
            drop_sound = item_sounds.explosives_inventory_move,
            stack_size = 50,
            default_import_location = "nauvis",
            weight = 1*kg
        }
    })
end

if misc.difficulty == 2 then
    return
end

data:extend({
    {
        type = "item",
        name = "spring",
        icon = "__BrimStuff__/graphics/icons/spring.png",
        subgroup = "raw-material",
        order = "a[basic-intermediates]-bb",
        inventory_move_sound = item_sounds.coin_inventory_move,
        pick_sound = item_sounds.coin_inventory_pickup,
        drop_sound = item_sounds.coin_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        weight = 1*kg
    }
})

if mods["space-age"] then
    data:extend({
        {
            type = "item",
            name = "differential-girdlespring",
            icon = "__BrimStuff__/graphics/icons/differential-girdlespring.png",
            subgroup = "raw-material",
            order = "c[advanced-intermediates]-1f",
            inventory_move_sound = item_sounds.mechanical_inventory_move,
            pick_sound = item_sounds.mechanical_inventory_pickup,
            drop_sound = item_sounds.mechanical_inventory_move,
            stack_size = 50,
            default_import_location = "nauvis",
            weight = 2*kg
        },
        {
            type = "fluid",
            name = "growth-serum",
            icon = "__BrimStuff__/graphics/icons/growth-serum.png",
            icon_size = 64,
            subgroup = "fluid",
            order = "qa",
            default_temperature = 15,
            base_color = {0.6, 0.2, 1, 1},
            flow_color = {1, 0.5, 1, 1},
            visualization_color = {0.6, 0.2, 1, 1}
        }
    })
end