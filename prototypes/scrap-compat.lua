local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if not mods["scrap-industry"] then
    return
end

local item_sounds = require("__base__/prototypes/item_sounds")

if settings.startup["scrap-industry-plastic"].value then
   data:extend({
      {
        type = "item",
        name = "rubber-bits",
        icon = "__BrimStuffMk2__/graphics/icons/rubber-bits.png",
        icon_size = 64,
        subgroup = "production-scrap",
        order = "c[product]-ba[rubber]",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.low_density_inventory_move,
        pick_sound = item_sounds.low_density_inventory_pickup,
        drop_sound = item_sounds.low_density_inventory_move,
        stack_size = 50,
        default_import_location = "nauvis",
        canonical_cost = 1,
        weight = 2*kg
      },
      {
        type = "recipe",
        name = "rubber-from-bits",
        icons = {
            {
                icon = "__BrimStuffMk2__/graphics/icons/rubber-bits.png",
                icon_size = 64,
                shift = {-4, -4}
            },
            {
                icon = "__BrimStuffMk2__/graphics/icons/rubber.png",
                icon_size = 64,
                shift = {4, 4}
            }
        },
        hide_from_player_crafting = true,
        subgroup = "production-scrap",
        order = "d[crafting]-da[rubber]",
        category = mods["space-age"] and "organic-or-basic-chemistry" or "basic-chemistry",
        energy_required = 5,
        allow_productivity = true,
        enabled = false,
        ingredients = {
            {type="item", name="rubber-bits", amount=10},
            {type="item", name="sulfur", amount=1},
            {type="fluid", name="water", amount=15}
        },
        results = {
            {type="item", name="rubber", amount=3},
            {type="fluid", name="chemical-waste", amount=10}
        },
        crafting_machine_tint = {
            primary = {1, 0.55, 0.55, 1},
            secondary = {1, 0.7, 0.7, 1},
            tertiary = {0.5, 0, 1, 1},
            quaternary = {1, 0.7, 0.7, 1}
        }
      }
    }) 
end

if misc.difficulty > 1 then
    data:extend({
        {
            type = "recipe",
            name = "rubber-bits-disposal",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__BrimStuffMk2__/graphics/icons/rubber-bits.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.33
                }
            },
            auto_recycle = false,
            category = "basic-chemistry",
            subgroup = "fluid-recipes",
            order = "c[oil-products]-ca",
            energy_required = 4,
            ingredients = {
                {type="fluid", name="nitric-acid", amount=5},
                {type="item", name="rubber-bits", amount=20}
            },
            results = {
                {type="fluid", name="chemical-waste", amount=50}
            },
            energy_required = 1,
            allow_productivity = true,
            enabled = false,
            emissions_multiplier = 5,
            crafting_machine_tint = {
                primary = {0.5, 0, 1, 1},
                secondary = {0.9, 0.55, 0.55, 1},
                tertiary = {0.5, 0, 1, 1},
                quaternary = {0.9, 0.55, 0.55, 1}
            }
        },
        {
            type = "recipe",
            name = "plastic-bits-disposal",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__scrap-industry__/graphics/icons/plastic-bits.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.33
                }
            },
            auto_recycle = false,
            category = "chemistry",
            subgroup = "fluid-recipes",
            order = "c[oil-products]-ca",
            energy_required = 4,
            ingredients = {
                {type="fluid", name="nitric-acid", amount=5},
                {type="fluid", name="water", amount=10},
                {type="item", name="plastic-bits", amount=20}
            },
            results = {
                {type="fluid", name="chemical-waste", amount=50}
            },
            energy_required = 1,
            allow_productivity = true,
            enabled = false,
            emissions_multiplier = 5,
            crafting_machine_tint = {
                primary = {0.5, 0, 1, 1},
                secondary = {0.9, 0.9, 0.9, 1},
                tertiary = {0.5, 0, 1, 1},
                quaternary = {0.9, 0.9, 0.9, 1}
            }
        }
    })

    rm.MultiplyRecipe("rubber-from-bits", 4)
    rm.ReplaceIngredientProportional("rubber-from-bits", "sulfur", "toluene", 0.25)
    rm.ReplaceIngredientProportional("rubber-from-bits", "water", "petroleum-gas", 0.25)

    data.raw.recipe["rubber-from-bits"].category = mods["space-age"] and "organic-or-chemistry" or "chemistry"
end
