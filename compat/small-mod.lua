local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["deadlock-beltboxes-loaders"] then
    rm.AddIngredient("fast-transport-belt-loader", "rubber")
    if misc.difficulty > 1 then
        rm.AddIngredient("express-transport-belt-loader", "drive-belt", 20)
        rm.AddIngredient("express-transport-belt-beltbox", "drive-belt", 20)
        rm.RemoveIngredient("express-transport-belt-loader", "iron-gear-wheel", 99999)
        rm.RemoveIngredient("express-transport-belt-beltbox", "iron-gear-wheel", 99999)
        if misc.difficulty == 3 and mods["space-age"] then
            rm.AddIngredient("turbo-transport-belt-loader", "differential-girdlespring", 10)
            rm.AddIngredient("turbo-transport-belt-beltbox", "differential-girdlespring", 10)
            rm.RemoveIngredient("turbo-transport-belt-beltbox", "iron-gear-wheel", 99999)
        end
    end
end