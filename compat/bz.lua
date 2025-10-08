local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["bzcarbon"] then
    rm.ReplaceIngredientProportional("airtight-seal", "rubber", "graphite", 1, 1)
    rm.RemoveIngredient("pump", "graphite", 99999)
end

if mods["bztin"] then
    if data.raw.item["bronze-plate"] and misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("spring", "copper-plate", "bronze-plate", 1)
        rm.ReplaceIngredientProportional("differential-girdlespring", "steel-plate", "bronze-plate", 5)
        rm.RemoveIngredient("recycler", "bronze-plate", 99999)
        rm.RemoveIngredient("fast-inserter", "bronze-plate", 99999)
    end
end