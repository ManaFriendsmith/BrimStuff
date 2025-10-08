local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

table.insert(data.raw["assembling-machine"]["basic-chemical-plant"].crafting_categories, "ammunition-or-basic-chemistry")
table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "ammunition-or-basic-chemistry")
table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "ammunition-or-chemistry")
table.insert(data.raw["assembling-machine"]["aop-armory"].crafting_categories, "ammunition-or-basic-chemistry")
table.insert(data.raw["assembling-machine"]["aop-armory"].crafting_categories, "ammunition-or-chemistry")

table.insert(data.raw["assembling-machine"]["aop-biochemical-facility"].crafting_categories, "organic-or-basic-chemistry")
if not data.raw["assembling-machine"]["aop-biochemical-facility"].fluid_boxes then
    data.raw["assembling-machine"]["aop-biochemical-facility"].fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="input", position = {-2, -3}, direction = defines.direction.north}},
            secondary_draw_orders = { north = -1,}
        },
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="input", position = {2, -3}, direction = defines.direction.north}},
            secondary_draw_orders = { north = -1,}
        },
        {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="input", position = {-2, 3}, direction = defines.direction.south}},
            secondary_draw_orders = { north = -1,}
        },
        {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="input", position = {2, 3}, direction = defines.direction.south}},
            secondary_draw_orders = { north = -1,}
        }
    }
end

table.insert(data.raw["assembling-machine"]["aop-greenhouse"].crafting_categories, "brimstuff-botany")
rm.ReplaceIngredientProportional("aop-greenhouse", "landfill", "brimstuff-greenhouse", 0.5)
data.raw.item["aop-greenhouse"].localised_name = {"item-name.advanced-greenhouse"}
data.raw.recipe["aop-greenhouse"].localised_name = {"item-name.advanced-greenhouse"}
data.raw.technology["aop-greenhouse"].localised_name = {"item-name.advanced-greenhouse"}
data.raw["assembling-machine"]["aop-greenhouse"].localised_name = {"item-name.advanced-greenhouse"}

table.insert(data.raw["assembling-machine"]["aop-petrochemical-facility"].crafting_categories, "petrochemistry-or-basic-chemistry")
table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "petrochemistry-or-basic-chemistry")
table.insert(data.raw["assembling-machine"]["basic-chemical-plant"].crafting_categories, "petrochemistry-or-basic-chemistry")

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("aop-greenhouse", "iron-gear-wheel", "airtight-seal")
    rm.ReplaceIngredientProportional("aop-smeltery", "iron-gear-wheel", "drive-belt")
    rm.ReplaceIngredientProportional("aop-lumber-mill", "iron-gear-wheel", "drive-belt", 25, 0.4)
end

rm.AddRecipeCategory("gunpowder", "ammunition")
rm.AddRecipeCategory("gunpowder-in-space", "ammunition")
rm.AddRecipeCategory("toluene-from-coal", "petrochemistry")