local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["LunarLandings"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("ll-oxygen-diffuser", "airtight-seal", 5)
    end

    local llrs = mods["space-age"] and "ll-rocket-silo-up" or "rocket-silo"
    if misc.difficulty == 3 then
        rm.AddIngredient("ll-landing-pad", "differential-girdlespring", 5)
        rm.AddIngredient("ll-telescope", "differential-girdlespring", 10)
        rm.AddIngredient("ll-telescope", "differential-girdlespring", 10)
        rm.AddIngredient("ll-moon-rail-ramp", "differential-girdlespring", 1)
        rm.AddIngredient("ll-moon-rail-support", "differential-girdlespring", 1)
        rm.AddIngredient(llrs, "differential-girdlespring", 50)
    end

    if mods["ThemTharHillsMk2"] then
        rm.AddProduct("astral-acid-recovery", "chemical-waste", 150)
    end

    if data.raw.recipe["brimstuff-oxygen"] then
        tm.AddUnlock("ll-luna-automation", "brimstuff-oxygen")
    end

    rm.AddProduct("ll-red-mud-recovery", "chemical-waste", 25)
    tm.AddUnlock("ll-quantum-resource-processing", "astral-waste-treatment")
end

if mods["maraxsis"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("maraxsis-wyrm-confinement-cell", "airtight-seal", 1)
        rm.AddRecipeCategory("airtight-seal", "maraxsis-hydro-plant")
    end
end

if mods["Paracelsin"] then
    rm.AddRecipeCategory("solid-fuel-from-nitrogen", "basic-chemistry")
    rm.AddRecipeCategory("vaterite-processing", "basic-chemistry")
    table.insert(data.raw["simple-entity"]["big-metallic-rock"].minable.results, {type="item", name="potassium-nitrate", amount_min=3, amount_max=9})
    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="rubber", amount_min=6, amount_max=18})

    if misc.difficulty > 1 then
        tm.AddUnlock("vaterite-processing", "paracelsian-synthetic-toluene")
    else
        tm.AddUnlock("nitric-acid-handling", "paracelsian-synthetic-rubber", "solid-fuel-from-nitrogen")
    end

    rm.AddProduct("sphalerite-processing", "chemical-waste", 30)
    rm.AddProduct("tetrahedrite-processing", "chemical-waste", 15)
    rm.AddProduct("zinc-purification", {type="item", name="potassium-nitrate", amount=1, probability=0.05})
    if not mods["ThemTharHillsMk2"] then
        rm.AddProduct("zinc-leaching", "chemical-waste", 10)
    end
    
    rm.AddRecipeCategory("drive-belt", "mechanics")
    rm.AddRecipeCategory("spring", "mechanics")
    rm.AddRecipeCategory("differential-girdlespring", "mechanics")

    rm.AddRecipeCategory("chemical-waste-incineration", "electrochemistry")
    rm.AddRecipeCategory("chemical-waste-reprocessing", "electrochemistry")
    rm.AddRecipeCategory("chemical-waste-leaching", "electrochemistry")
    rm.AddRecipeCategory("gunpowder", "electrochemistry")
    rm.AddRecipeCategory("gunpowder-in-space", "electrochemistry")
end

if mods["castra"] then
    if misc.difficulty > 1 and not data.raw.item["ambifacient-lunar-waneshaft"] then
        rm.ReplaceIngredientProportional("engine-unit-gunpowder", "iron-gear-wheel", "drive-belt")
    end

    if misc.difficulty == 3 then
        rm.AddIngredient("rocket-fuel-sulfur", "airtight-seal")
    end

    if not mods["ThemTharHillsMk2"] then
        rm.AddIngredient("nickel-sulfide-reduction", "nitric-acid", 25)
        rm.AddProduct("nickel-sulfide-reduction", "chemical-waste", 25)
    end

    if misc.difficulty > 1 then
        --gunpowder has already replaced coal in the default recipe, delete the duplicate
        tm.RemoveUnlock("gunpowder-processing", "grenade-gunpowder")
        tm.RemoveUnlock("explosive-ammo-productivity", {type="change-recipe-productivity", recipe="grenade-gunpowder"})
        data.raw.recipe["grenade-gunpowder"] = nil

        rm.AddIngredient("firearm-magazine-nickel", "gunpowder", 1)

        --this is arguably too mean. however it is weird to "tier up" explosives so easily.
        --nothing on castra needs TNT in bulk. if you want local cliff explosive production or something you can feed it off the toluene from oil cracking
        --plus explosives being harder to get here makes the explosives productivity research more compelling
        tm.RemoveUnlock("gunpowder-processing", "explosives-gunpowder")
        data.raw.recipe["explosives-gunpowder"] = nil
    else
        rm.AddProduct("explosives-gunpowder", "chemical-waste", 20)
    end

    tm.AddUnlock("gunpowder-processing", "rubber-gunpowder")
    tm.AddUnlock("gunpowder-processing", "gunpowder-disposal")

    if mods["BrassTacksMk2"] then
        rm.AddProduct("ancient-military-wreckage-recycling", {type="item", name="rubber", amount=1, probability=0.1})
    end

    if mods["BrassTacksMk2"] and misc.difficulty == 3 then
        --makes more sense to do electrolysis in an electroplating machine than a burner chem plant
        rm.AddRecipeCategory("hydrogen-sulfide-electrolysis", "electroplating")
    else
        rm.AddRecipeCategory("hydrogen-sulfide-electrolysis", "basic-chemistry")
    end

    rm.AddProduct("holmium-catalyzing", "chemical-waste", 5)
    rm.AddProduct("hydrogen-sulfide-carbon-extraction", "chemical-waste", 5)

    rm.AddProduct("gunpowder-carbon", "potassium-nitrate", 1)
end

if mods["planet-muluna"] then
    rm.ReplaceIngredientProportional("sealed-greenhouse", "steel-plate", "brimstuff-greenhouse", 0.5)
    if misc.difficulty > 1 then
        rm.ReplaceIngredientProportional("sealed-greenhouse", "pipe", "airtight-seal", 1)
    end

    rm.AddIngredient("muluna-tree-growth-greenhouse", {type="fluid", name="fertilizer-slurry", amount=50, fluidbox_index=3})
    rm.AddIngredient("muluna-tree-growth-greenhouse-water-saving", {type="fluid", name="fertilizer-slurry", amount=50, fluidbox_index=3})
    rm.AddIngredient("muluna-tree-growth-greenhouse-nutrients", {type="fluid", name="fertilizer-slurry", amount=50, fluidbox_index=3})
    rm.AddIngredient("muluna-tree-growth-greenhouse-water-saving-nutrients", {type="fluid", name="fertilizer-slurry", amount=50, fluidbox_index=3})

    rm.AddProduct("solid-fuel-from-tar", "chemical-waste", 8)

    if misc.difficulty == 3 then
        rm.AddIngredient("space-chest-muluna", "differential-girdlespring")
    end
end

if mods["Cerys-Moon-of-Fulgora"] then
    if misc.difficulty == 1 then
        --otherwise a decent amount of rubber from recycling centrifuges
        --synthetic rubber from vulcanus should still be helpful
        rm.AddProduct("cerys-nuclear-scrap-recycling", {type="item", name="rubber", amount=1, probability=0.04})
    end

    tm.RemovePrerequisite("byproduct-disposal", "recycling")
    tm.AddPrerequisite("byproduct-disposal", "planet-discovery-fulgora")
end