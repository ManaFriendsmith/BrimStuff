local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

--INTERMEDIATE PRODUCTS

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("explosives", "coal", "toluene", 1)
    tm.AddPrerequisite("explosives", "toluene-production")
end
rm.ReplaceIngredientProportional("explosives", "sulfur", "sulfuric-acid", 10)
rm.ReplaceIngredientProportional("explosives", "water", "nitric-acid", 2)
data.raw.item["explosives"].localised_name = {"item-name.tnt"}
rm.ReplaceIngredientProportional("chemical-science-pack", "sulfur", "explosives", 3)
rm.AddProduct("explosives", "chemical-waste", 30)

rm.MultiplyRecipe("sulfur", {input=2, time=2})
rm.AddProduct("sulfur", "chemical-waste", 20)
tm.RemoveUnlock("sulfur-processing", "sulfur")
tm.AddUnlock("advanced-oil-processing", "sulfur")

if mods["IfNickel"] then
    tm.AddPrerequisite("high-pressure-valve", "rubber")
    if misc.difficulty == 1 then
        rm.AddIngredient("high-pressure-valve", "rubber", 2)
    else
        rm.ReplaceIngredientProportional("high-pressure-valve", "copper-plate", "airtight-seal", 0.5)
        if misc.difficulty == 3 then
            rm.AddIngredient("high-pressure-valve", "spring", 1)
        end
    end
else
    tm.AddPrerequisite("engine", "rubber")
end

rm.AddProduct("plastic-bar", "chemical-waste", 20)

rm.AddProduct("basic-oil-processing", {type="item", name="sulfur", amount=1, probability=0.5})
rm.AddProduct("advanced-oil-processing", {type="item", name="sulfur", amount=1, probability=0.5})
rm.AddProduct("coal-liquefaction", {type="item", name="sulfur", amount=1, probability=0.5})

rm.AddProduct("solid-fuel-from-light-oil", "chemical-waste", 5)
rm.AddProduct("solid-fuel-from-heavy-oil", "chemical-waste", 10)

if misc.difficulty > 1 then
    rm.MultiplyRecipe("solid-fuel-from-petroleum-gas", 6)
    rm.MultiplyRecipe("solid-fuel-from-light-oil", 6)
    rm.MultiplyRecipe("solid-fuel-from-heavy-oil", 6)

    rm.ReplaceIngredientProportional("solid-fuel-from-petroleum-gas", "petroleum-gas", "toluene", 0.05, 20)
    rm.ReplaceIngredientProportional("solid-fuel-from-light-oil", "light-oil", "toluene", 0.1, 10)
    rm.ReplaceIngredientProportional("solid-fuel-from-heavy-oil", "heavy-oil", "toluene", 0.05, 20)

    tm.RemoveUnlock("oil-processing", "solid-fuel-from-petroleum-gas")
    tm.AddUnlock("flammables", "solid-fuel-from-petroleum-gas")
    tm.AddPrerequisite("flammables", "toluene-production")

    rm.ReplaceIngredientProportional("concrete", "iron-ore", "toluene")
    if rm.GetIngredientCount("concrete", "toluene") == 0 then
        rm.AddIngredient("concrete", "toluene", 1)
    end
    tm.AddPrerequisite("concrete", "toluene-production")
end

rm.ReplaceIngredientProportional("rocket-fuel", "light-oil", "nitric-acid", 2)
if misc.difficulty > 1 then
    if mods["space-age"] or not mods["LunarLandings"] then
        rm.AddIngredient("rocket-fuel", "airtight-seal", 1)
    end
    rm.AddIngredient("rocket-fuel-from-jelly", "airtight-seal", 1)
    rm.AddIngredient("ammonia-rocket-fuel", "airtight-seal", 1)
    rm.AddIngredient("maraxsis-hydrolox-rocket-fuel", "airtight-seal", 1)
    rm.AddIngredient("nitric-acid-rocket-fuel", "airtight-seal", 1)
end

if mods["BrassTacks"] and misc.difficulty == 3 then
    rm.AddProduct("depleted-zinc-salt-reprocessing", "chemical-waste", 25)
end

if mods["ThemTharHills"] and misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("heavy-cable", "plastic-bar", "rubber")
end

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("engine-unit", "iron-gear-wheel", "drive-belt")
    rm.AddIngredient("motorized-arm", "drive-belt", 1)
    if (rm.GetIngredientCount("motorized-arm", "bronze-plate") > 0) or (misc.difficulty == 3) then
        rm.RemoveIngredient("motorized-arm", "electronic-circuit")
        if misc.difficulty == 3 then
            rm.AddIngredient("motorized-arm", "spring", 2)
        end
    end
end

if misc.difficulty == 3 then
    rm.AddProduct("heavy-oil-cracking", {type="item", name="toluene", amount=1, probability=0.05})
    rm.AddProduct("light-oil-cracking", {type="item", name="toluene", amount=1, probability=0.05})
end

tm.AddUnlock("sulfur-processing", "nitric-acid")
tm.AddUnlock("sulfur-processing", "chemical-waste-reprocessing")
tm.RemoveUnlock("gold-processing", "nitric-acid")
tm.RemovePrerequisite("sulfur-processing", "oil-processing")
tm.AddPrerequisite("sulfur-processing", "electric-chemical-plant")
if misc.starting_planet ~= "vulcanus" then
    tm.AddPrerequisite("oil-gathering", "electric-chemical-plant")
end
tm.RemovePrerequisite("oil-gathering", "fluid-handling")
tm.RemoveUnlock("oil-processing", "chemical-plant")

tm.RemovePrerequisite("chemical-science-pack", "sulfur-processing")
tm.AddPrerequisite("chemical-science-pack", "explosives")

if data.raw.item["differential-girdlespring"] then
    if data.raw.item["nitinol-plate"] then
        tm.AddUnlock("nitinol-processing", "differential-girdlespring")
    else
        tm.AddUnlock("electric-engine", "differential-girdlespring")
        if not data.raw.technology["mechanical-engineering"] then
            data.raw.technology["electric-engine"].icon = "__BrimStuff__/graphics/technology/mechanical-engineering.png"
            data.raw.technology["electric-engine"].localised_name = {"technology-name.mechanical-engineering"}
            data.raw.technology["electric-engine"].localised_description = {"technology-description.mechanical-engineering"}
        end
    end

    if data.raw.item["skyseeker-armature"] then
        rm.AddIngredient("skyseeker-armature", "differential-girdlespring", 2)
    end
end

if misc.difficulty == 3 and mods["BrassTacks"] then
    --nitinol takes priority
    rm.ReplaceIngredientProportional("complex-joint", "galvanized-rod", "spring", 0.5)
end

if misc.difficulty > 1 and mods["IfNickel"] then
    --complex joint takes priority
    rm.ReplaceIngredientProportional("gimbaled-rocket-engine", "iron-gear-wheel", "spring", 1)
    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("grabber", "iron-gear-wheel", "spring", 1)
    end
end

if mods["ThemTharHills"] then
    rm.AddProduct("depleted-acid-reprocessing", "chemical-waste", 40)
    rm.AddProduct("depleted-acid-reprocessing-with-calcite", "chemical-waste", 500)
end

--LOGISTICS

--BELTS

tm.AddPrerequisite("logistics-2", "rubber")

rm.AddIngredient("fast-transport-belt", "rubber", 1)
rm.AddIngredient("fast-underground-belt", "rubber", 8)
rm.AddIngredient("fast-splitter", "rubber", 2)

if misc.difficulty > 1 then
    rm.AddIngredient("express-transport-belt", "drive-belt", 1)
    rm.AddIngredient("express-underground-belt", "drive-belt", 8)
    rm.AddIngredient("express-splitter", "drive-belt", 2)
end

if misc.difficulty == 3 and (not mods["IfNickel"]) then
    rm.AddIngredient("fast-splitter", "spring", 4)
    if mods["quality"] then
        rm.AddIngredient("recycler", "spring", 20)
    end
end

if misc.difficulty == 3 and (not mods["BrassTacks"]) then
    rm.AddIngredient("express-splitter", "spring", 8)
end

--STORAGE

if misc.difficulty == 3 then
    rm.AddIngredient("steel-chest", "spring", 2)
end

--INSERTERS

if misc.difficulty == 3 then
    if mods["BrassTacks"] then
        rm.ReplaceIngredientProportional("fast-inserter", "iron-gear-wheel", "spring", 1, 1)
    else
        rm.ReplaceIngredientProportional("fast-inserter", "iron-plate", "spring")
    end
    tm.AddPrerequisite("fast-inserter", "rubber")

    if not mods["space-age"] then
        rm.AddIngredient("stack-inserter", "differential-girdlespring")
    end

    if not mods["IfNickel"] then
        if rm.GetIngredientCount("bulk-inserter", "iron-gear-wheel") == 0 then
            rm.AddIngredient("bulk-inserter", "spring", 5)
        else
            rm.ReplaceIngredientProportional("bulk-inserter", "iron-gear-wheel", "spring", 1, 5)
        end
    end
end

--PIPES

if misc.difficulty > 1 then
    rm.AddIngredient("pump", "airtight-seal", 2)
    if difficulty == 3 and not mods["IfNickel"] then
        rm.AddIngredient("pump", "spring", 2)
    end
else
    rm.AddIngredient("pump", "rubber", 3)
end

--ELECTRIC POLES

if not data.raw.technology["electroplating"] then
    tm.AddPrerequisite("electric-energy-distribution-1", "rubber")
end

if misc.starting_planet ~= "vulcanus" then
    rm.AddIngredient("medium-electric-pole", "rubber", 1)
end
rm.AddIngredient("big-electric-pole", "rubber", 2)

if not data.raw.item["heavy-cable"] then
    rm.AddIngredient("substation", "rubber", 5)
end

--RAILWAY

if not mods["IfNickel"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("fluid-wagon", "airtight-seal", 3)
    else
        rm.AddIngredient("fluid-wagon", "rubber", 5)
    end
end

if misc.difficulty == 3 and mods["elevated-rails"] then
    if data.raw.item["differential-girdlespring"] then
        rm.AddIngredient("rail-support", "differential-girdlespring", 1)
        rm.AddIngredient("rail-ramp", "differential-girdlespring", 1)
        if data.raw.item["nitinol-plate"] then
            tm.AddPrerequisite("elevated-rails", "nitinol-processing")
        else
            tm.AddPrerequisite("elevated-rails", "electric-engine")
        end
    else
        rm.AddIngredient("rail-support", "spring", 8)
        rm.AddIngredient("rail-ramp", "spring", 8)
    end
end

--PRODUCTION

--CRAFTING MACHINES

table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "basic-chemistry")
if mods["space-age"] then
    table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "organic-or-basic-chemistry")
    table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "cryogenics-or-basic-chemistry")
    table.insert(data.raw["assembling-machine"]["basic-chemical-plant"].crafting_categories, "organic-or-basic-chemistry")
    table.insert(data.raw["assembling-machine"]["basic-chemical-plant"].crafting_categories, "cryogenics-or-basic-chemistry")
end

tm.AddPrerequisite("automation-2", "rubber")

rm.ReplaceIngredientProportional("chemical-plant", "pipe", "basic-chemical-plant", 0.2)
rm.ReplaceIngredientProportional("oil-refinery", "pipe", "basic-chemical-plant", 0.2)

if not mods["IfNickel"] then
    if misc.difficulty == 1 then
        rm.ReplaceIngredientProportional("chemical-plant", "iron-gear-wheel", "rubber", 2)
        rm.ReplaceIngredientProportional("oil-refinery", "iron-gear-wheel", "rubber", 2)
        rm.ReplaceIngredientProportional("pumpjack", "iron-gear-wheel", "rubber", 2, 5)
    else
        rm.ReplaceIngredientProportional("chemical-plant", "iron-gear-wheel", "airtight-seal", 1)
        rm.ReplaceIngredientProportional("oil-refinery", "iron-gear-wheel", "airtight-seal", 1)
        rm.ReplaceIngredientProportional("pumpjack", "iron-gear-wheel", "airtight-seal", 1, 5)
        rm.ReplaceIngredientProportional("pumpjack", "iron-gear-wheel", "drive-belt", 1, 5) --in case no flywheels
    end
end

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("assembling-machine-2", "iron-gear-wheel", "drive-belt", 0.6)
    if rm.GetIngredientCount("assembling-machine-2", "drive-belt") == 0 and not data.raw.item["motorized-arm"] then
        rm.AddIngredient("assembling-machine-3", "drive-belt", 10)
    end
    rm.ReplaceIngredientProportional("centrifuge", "iron-gear-wheel", "drive-belt", 0.5)
    if data.raw.item["differential-girdlespring"] then
        if data.raw.item["nitinol-plate"] then
            tm.AddPrerequisite("uranium-mining", "nitinol-processing")
        else
            tm.AddPrerequisite("uranium-mining", "electric-engine")
        end
        rm.AddIngredient("centrifuge", "differential-girdlespring", 10)
        if (mods["space-age"] or not mods["LunarLandings"]) and not data.raw.item["skyseeker-armature"] then
            rm.AddIngredient("rocket-silo", "differential-girdlespring", 100)
        end
    end    
end

if misc.difficulty == 3 and (not mods["IfNickel"]) then
    rm.AddIngredient("assembling-machine-2", "spring", 8)
end

if misc.difficulty == 3 then
    if mods["BrassTacks"] then
        tm.AddPrerequisite("electroplating", "rubber")
        rm.ReplaceIngredientProportional("electroplating-machine", "pipe", "airtight-seal", 0.5)
    elseif data.raw.item["differential-girdlespring"] then
        if data.raw.item["nitinol-plate"] then
            tm.AddPrerequisite("automation-3", "nitinol-processing")
        else
            tm.AddPrerequisite("automation-3", "electric-engine")
        end
        rm.AddIngredient("assembling-machine-3", "differential-girdlespring", 2)
    end
end

--GENERATORS

rm.AddIngredient("accumulator", "rubber", 1)

--MILITARY

--AMMUNITION

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("firearm-magazine", "iron-plate", "gunpowder", 1, 1)
    rm.ReplaceIngredientProportional("firearm-magazine", "lead-plate", "gunpowder", 1, 1)
    rm.ReplaceIngredientProportional("shotgun-shell", "lead-plate", "gunpowder", 2, 1)
    rm.ReplaceIngredientProportional("shotgun-shell", "iron-plate", "gunpowder", 2, 1)
    rm.ReplaceIngredientProportional("grenade", "coal", "gunpowder")

    rm.AddIngredient("flamethrower-ammo", "airtight-seal", 1)
    if rm.GetIngredientCount("flamethrower-ammo", "steel-plate") >= 5 then
        rm.RemoveIngredient("flamethrower-ammo", "steel-plate", 4) --i still hold this stuff is too expensive.
    end
end

if not data.raw.fluid["organotins"] then
    data.raw.recipe["slowdown-capsule"].category = "crafting-with-fluid"
    rm.AddIngredient("slowdown-capsule", "chemical-waste", 50)

    data.raw.recipe["poison-capsule"].category = "crafting-with-fluid"
    rm.AddIngredient("poison-capsule", "chemical-waste", 100)
end

--TUNER
if tune_up_data then
    tune_up_data.ReplaceIngredientProportional("copper-ore", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("nickel-ore", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("copper-plate", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("nickel-plate", "sulfuric-acid", "nitric-acid", 1)

    tune_up_data.AddIngredient("iron-ore", "chemical-waste", 20, "byproduct")
    tune_up_data.AddIngredient("copper-ore", "chemical-waste", 20, "byproduct")
    tune_up_data.AddIngredient("zinc-ore", "chemical-waste", 20, "byproduct")
    tune_up_data.AddIngredient("nickel-ore", "chemical-waste", 20, "byproduct")
    tune_up_data.AddIngredient("gold-ore", "chemical-waste", 20, "byproduct")

    tune_up_data.AddIngredient("coal", "chemical-waste", 5, "byproduct")
    tune_up_data.AddIngredient("sulfur", "chemical-waste", 5, "byproduct")
    tune_up_data.AddIngredient("plastic-bar", "chemical-waste", 10, "byproduct")
end