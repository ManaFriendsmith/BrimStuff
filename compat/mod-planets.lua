local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["maraxsis"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("maraxsis-wyrm-confinement-cell", "airtight-seal", 1)
        rm.AddRecipeCategory("airtight-seal", "maraxsis-hydro-plant")
    end
end