local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

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
    if not mods["ThemTharHills"] then
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