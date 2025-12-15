local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["Age-of-Production"] then
    require("compat.age-of-production")
end

--SPACE PLATFORM

if mods["planet-muluna"] then
    tm.AddUnlock("carbonic-asteroid-crushing", "panspermia-asteroid-crushing")
    tm.AddUnlock("carbonic-asteroid-crushing", "spoilage-dessiccation")
    tm.AddUnlock("asteroid-collector", "gunpowder-in-space")
else
    tm.AddUnlock("space-platform-thruster", "panspermia-asteroid-crushing")
    tm.AddUnlock("space-platform-thruster", "spoilage-dessiccation")
    tm.AddUnlock("space-platform-thruster", "gunpowder-in-space")
end

rm.ReplaceIngredientProportional("thruster-oxidizer", "water", "nitric-acid", 0.5)
rm.ReplaceIngredientProportional("advanced-thruster-oxidizer", "water", "nitric-acid", 1)

tm.AddUnlock("advanced-asteroid-processing", "advanced-panspermia-asteroid-crushing", "-advanced-thruster-fuel")

tm.AddUnlock("asteroid-reprocessing", "panspermia-asteroid-reprocessing")

tm.AddUnlock("asteroid-productivity", {type="change-recipe-productivity", recipe="panspermia-asteroid-crushing", change=0.1}, "-advanced-carbonic-asteroid-crushing")
tm.AddUnlock("asteroid-productivity", {type="change-recipe-productivity", recipe="advanced-panspermia-asteroid-crushing", change=0.1})

rm.AddIngredient("crusher", "drive-belt", 10)

data.raw.recipe["ice-melting"].category = "cryogenics-or-basic-chemistry"

rm.AddProduct("advanced-thruster-fuel", "chemical-waste", 60)
rm.AddProduct("advanced-thruster-oxidizer", "chemical-waste", 60)

if misc.difficulty == 3 then
    rm.AddIngredient("cargo-bay", "differential-girdlespring", 1)
    rm.AddIngredient("crusher", "differential-girdlespring", 1)
    rm.AddIngredient("asteroid-collector", "differential-girdlespring", 10)
    rm.RemoveIngredient("asteroid-collector", "nitinol-plate", 10)

    rm.AddIngredient("orbital-transfer-provider", "differential-girdlespring", 1)
    rm.AddIngredient("orbital-transfer-requester", "differential-girdlespring", 1)
end


--VULCANUS

tm.AddUnlock("calcite-processing", "synthetic-rubber")

rm.AddProduct("simple-coal-liquefaction", {type="item", name="sulfur", amount=1, probability=0.5})

if misc.difficulty > 1 then
    rm.AddProduct("carbon", {type="item", name="toluene", probability=0.04, amount=1})

    rm.AddIngredient("concrete-from-molten-iron", "toluene")
    rm.RemoveIngredient("concrete-from-molten-iron", "molten-iron", 10)
end

data.raw.recipe["carbon"].category = "cryogenics-or-basic-chemistry"

if misc.difficulty == 3 then
    --you want belts? make rubber on the planet that hates rubber.
    rm.AddIngredient("turbo-transport-belt", "differential-girdlespring", 1)
    rm.AddIngredient("turbo-underground-belt", "differential-girdlespring", 8)
    rm.AddIngredient("turbo-splitter", "differential-girdlespring", 2)
    rm.AddIngredient("big-mining-drill", "differential-girdlespring", 10)
end

rm.AddProduct("simple-coal-liquefaction", "chemical-waste", 80)

--FULGORA

table.insert(data.raw["simple-entity"]["fulgoran-ruin-small"].minable.results, {type="item", name="rubber", amount=3})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-medium"].minable.results, {type="item", name="rubber", amount=5})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-stonehenge"].minable.results, {type="item", name="rubber", amount=9})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-big"].minable.results, {type="item", name="rubber", amount=11})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-colossal"].minable.results, {type="item", name="rubber", amount=37})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-huge"].minable.results, {type="item", name="rubber", amount=26})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="rubber", amount=111})
table.insert(data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].minable.results, {type="item", name="rubber", amount=4})

rm.AddIngredient("lightning-rod", "rubber", 4)
tm.SetTechnologyTrigger("byproduct-disposal", "recycler")

if misc.difficulty > 1 then
    rm.AddProduct("scrap-recycling", {type="item", name="drive-belt", amount=1, probability=0.06})
    if misc.difficulty == 3 and mods["LasingAroundMk2"] then
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="differential-girdlespring", amount=1, probability=0.01})
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="spring", amount=1, probability=0.1})
        rm.AddIngredient("cardinal-grammeter", "differential-girdlespring", 1)
    end
else
    rm.AddProduct("scrap-recycling", {type="item", name="rubber", amount=1, probability=0.04})
end

tm.AddUnlock("scrap-recycling-productivity", {type="change-recipe-productivity", recipe="metalcelium-electroponics-with-scrap", change=0.1})
if misc.starting_planet == "fulgora" then
    tm.AddUnlock("scrap-recycling-productivity-1", {type="change-recipe-productivity", recipe="metalcelium-electroponics-with-scrap", change=0.1})
    tm.AddUnlock("scrap-recycling-productivity-2", {type="change-recipe-productivity", recipe="metalcelium-electroponics-with-scrap", change=0.1})
    tm.AddUnlock("scrap-recycling-productivity-3", {type="change-recipe-productivity", recipe="metalcelium-electroponics-with-scrap", change=0.1})
    tm.AddUnlock("scrap-recycling-productivity-4", {type="change-recipe-productivity", recipe="metalcelium-electroponics-with-scrap", change=0.1})
end

rm.AddProduct("holmium-solution", "chemical-waste", 20)

if misc.starting_planet == "fulgora" then
    data.raw.technology["rubber"].prerequisites = {"recycling"}
    tm.SetTechnologyTrigger("rubber", "rubber", 5)

    data.raw.technology["basic-chemistry"].prerequisites = {"recycling"}
    tm.SetTechnologyTrigger("basic-chemistry", "iron-plate", 5)
    if data.raw.item["pipe-flange"] then
        tm.AddUnlock("basic-chemistry", "pipe-flange")
    end
    tm.AddUnlock("basic-chemistry", "pipe")
    tm.AddUnlock("basic-chemistry", "pipe-to-ground")
    tm.AddUnlock("basic-chemistry", "offshore-pump")
    tm.AddUnlock("basic-chemistry", "ice-melting")
    tm.RemoveUnlock("automation-2", "ice-melting")

    data.raw.recipe["brimstuff-wood-growth"].surface_conditions[1].min = 800
end

if misc.difficulty == 3 then
    --is this realistic? no
    --is this obnoxious? yes
    rm.MultiplyRecipe("holmium-solution", 2)
    rm.AddIngredient("holmium-solution", "toluene", 1)

    rm.MultiplyRecipe("spectroscopic-holmium-processing", 2)
    rm.AddIngredient("spectroscopic-holmium-processing", "toluene", 1)
    rm.RemoveIngredient("spectroscopic-holmium-processing", "spectroscope", 1)
    rm.RemoveProduct("spectroscopic-holmium-processing", {type="item", name="spectroscope", amount=1, probability=0.99})

    data.raw.recipe["stone-brick"].force_auto_recycle = true

    --it turns out that doing this without imports requires a lot of water. okay. i'm not going to change it. i'm going to give you more water.
    rm.AddProduct("ice-melting", "water", 5)
    rm.AddProduct("advanced-water-melting-atmosphere", "water", 5)
    rm.AddProduct("advanced-water-melting-oxygen", "water", 5)
end

--GLEBA

data.raw.recipe["nutrients-from-spoilage"].surface_conditions = {
    {
        property = "atmospheric-toxins",
        max = 20
    }
}
tm.AddUnlock("agricultural-science-pack", "toxic-environment-nutrients-bootstrap")

if misc.difficulty > 1 then
    tm.AddUnlock("plastic-bar-productivity", {type="change-recipe-productivity", recipe="plastic-from-toluene", change=0.1})
    tm.AddPrerequisite("plastic-bar-productivity", "advanced-polymer-synthesis")
    tm.RemovePrerequisite("plastic-bar-productivity", "agricultural-science-pack")
end

table.insert(data.raw["assembling-machine"]["biochamber"].crafting_categories, "organic-or-basic-chemistry")

tm.AddPrerequisite("planet-discovery-gleba", "brimstuff-greenhouse")
tm.AddPrerequisite("advanced-polymer-synthesis", "agricultural-science-pack")

rm.ReplaceIngredientProportional("rocket-fuel-from-jelly", "water", "nitric-acid")

tm.AddUnlock("agriculture", "fertilizer-slurry-from-nutrients")
if misc.difficulty > 1 then
    table.insert(data.raw["tree"]["boompuff"].minable.results, {type="item", name="gunpowder", amount=10})
    tm.AddUnlock("agriculture", "boompuff-cultivation")

    rm.AddProduct("burnt-spoilage", {type="item", name="toluene", amount=1, probability=0.04})
end

if data.raw.item["mutagenic-sludge"] or (data.raw.item["philosophers-hormone"] and (misc.difficulty == 3)) then
    --good reason to centralize growth serum production on gleba rather than sending the ingredients to other planets
    --on the one hand it may be cool to be able to reuse a good sludge handling + killzone blueprint
    --on the other it probably makes the planets too similar + may make the planet-specific greenhouse recipes not worth the trouble
    --hormone has a shortish spoil timer on maximal and making a dedicated hauler for it to each planet is an excessive startup cost.
    data.raw.item["growth-serum-barrel"].weight = 5 * kg
end

rm.RemoveIngredient("wood-processing", "wood", 1)
data.raw.plant["tree-plant"].growth_ticks = 60 * 60 * 2

if misc.difficulty == 3 then
    if mods["IfNickelMk2"] then
        rm.AddIngredient("bacterium-extraction-from-sludge", "growth-serum", 5)
        tm.AddUnlock("tissue-cultivation", "growth-serum", "-bacterium-extraction-from-sludge")
    end

    tm.AddPrerequisite("overgrowth-soil", "hydroponics")
    tm.RemovePrerequisite("overgrowth-soil", "utility-science-pack")
    rm.ReplaceIngredientProportional("overgrowth-yumako-soil", "water", "growth-serum")
    rm.ReplaceIngredientProportional("overgrowth-jellynut-soil", "water", "growth-serum")

    rm.AddIngredient("bioflux", "fertilizer-slurry", 10)
    rm.AddProduct("bioflux", "chemical-waste", 10)
    rm.AddIngredient("spectroscopic-bioflux-processing", "fertilizer-slurry", 10)
    rm.AddProduct("spectroscopic-bioflux-processing", "chemical-waste", 5)

    rm.AddProduct("bioplastic", "chemical-waste", 20)    

    rm.AddProduct("nutrients-from-yumako-mash", "chemical-waste", 20)
    rm.AddProduct("nutrients-from-fish", "chemical-waste", 50)
    rm.AddProduct("nutrients-from-biter-egg", "chemical-waste", 20)
else
    rm.ReplaceIngredientProportional("overgrowth-yumako-soil", "water", "fertilizer-slurry")
    rm.ReplaceIngredientProportional("overgrowth-jellynut-soil", "water", "fertilizer-slurry")
end

rm.AddProduct("fish-breeding", "chemical-waste", 25)
rm.AddProduct("pentapod-egg", "chemical-waste", 25)
rm.AddProduct("biosulfur", "chemical-waste", 40)
rm.AddProduct("biolubricant", "chemical-waste", 10)
rm.AddProduct("carbon-fiber", "chemical-waste", 40)

if mods["IfNickelMk2"] and misc.difficulty > 1 then
    rm.AddProduct("stem-cells", "chemical-waste", 20)
end

if data.raw.item["philosophers-hormone"] and misc.difficulty == 3 then
    rm.AddProduct("philosophers-hormone-from-iron-bacteria", "chemical-waste", 15)
    rm.AddProduct("philosophers-hormone-from-copper-bacteria", "chemical-waste", 15)
end

--AQUILO

table.insert(data.raw["assembling-machine"]["cryogenic-plant"].crafting_categories, "cryogenics-or-basic-chemistry")

rm.AddProduct("lithium", "chemical-waste", 15)
rm.AddProduct("solid-fuel-from-ammonia", "chemical-waste", 5)

if misc.difficulty == 3 then
    if not data.raw.item["self-regulating-valve"] then
        rm.AddIngredient("cryogenic-plant", "differential-girdlespring", 10)
    end    
    rm.AddProduct("fluoroketone-cooling", "chemical-waste", mods["IfNickelMk2"] and 20 or 2)

    if data.raw.item["hydrocoptic-marzelvane"] and #data.raw.recipe["cryogenic-plant"].ingredients > 6 and rm.GetIngredientCount("cryogenic-plant", "lithium-plate") > 0 and not mods["maraxsis"] then
        rm.AddIngredient("hydrocoptic-marzelvane", "lithium-plate", 1)
        rm.RemoveIngredient("cryogenic-plant", "lithium-plate", 99999)
    end

    rm.AddIngredient("ai-girlfriend", "explosives", 1)
end

rm.AddProduct("fluoroketone", "chemical-waste", 30)
