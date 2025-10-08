local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if misc.difficulty > 1 then
    local better_plastic_recipe = table.deepcopy(data.raw.recipe["plastic-bar"])
    rm.MultiplyRecipe(better_plastic_recipe, {input=2, output=2.5, time=2})
    better_plastic_recipe.name = "plastic-from-toluene"
    better_plastic_recipe.icon = nil
    better_plastic_recipe.icon_size = nil
    better_plastic_recipe.icons = {
        {
            icon = "__base__/graphics/icons/plastic-bar.png",
            icon_size = 64
        },
        {
            icon = "__BrimStuff__/graphics/icons/toluene.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
        }
    }
    local carbon_amount = rm.GetIngredientCount(better_plastic_recipe, "coal")
    rm.ReplaceIngredientProportional(better_plastic_recipe, "coal", "toluene", 1, carbon_amount / 2)
    local carbon_amount = rm.GetIngredientCount(better_plastic_recipe, "carbon-black")
    rm.ReplaceIngredientProportional(better_plastic_recipe, "carbon-black", "toluene", 1, carbon_amount / 2)
    data:extend({better_plastic_recipe})
end