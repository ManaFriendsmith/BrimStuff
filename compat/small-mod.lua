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

if mods["scrap-industry"] then
    if data.raw.item["plastic-bits"] then

        rm.AddProduct("plastic-bar-from-bits", "chemical-waste", 10)
        if misc.difficulty > 1 then
            tm.RemoveUnlock("plastics", "plastic-bar-from-bits")
            tm.AddUnlock("advanced-polymer-synthesis", "plastic-bar-from-bits")
            tm.AddUnlock("plastics", "plastic-bits-disposal")
            rm.MultiplyRecipe("plastic-bar-from-bits", 4)
            rm.AddIngredient("plastic-bar-from-bits", "toluene", 1)

            tm.AddUnlock("rubber", "rubber-bits-disposal")
            tm.AddUnlock("advanced-polymer-synthesis", "rubber-from-bits")
        else
            tm.AddUnlock("rubber", "rubber-from-bits")
        end

        if mods["IfNickelMk2"] then
            table.insert(ScrapIndustry.recipes["high-pressure-valve"].fake_ingredients, {type="item", name="rubber", amount=2})
            table.insert(ScrapIndustry.items["high-pressure-valve"].scrap, "rubber")
            if data.raw.item["motorized-arm"] then
                for k, v in pairs(ScrapIndustry.items["motorized-arm"].scrap) do
                    if v == "circuit-scrap" then
                        ScrapIndustry.items["motorized-arm"].scrap[k] = "rubber-bits"
                    end
                end
            end
        end

        ScrapIndustry.items["rubber"] = {scrap="rubber-bits", scale=ScrapIndustry.CHEAP, recycle=2, failrate=0.01}
        ScrapIndustry.items["airtight-seal"] = {scrap={"rubber-bits", mods["BrassTacksMk2"] and "brass-scrap" or "copper-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
        if data.raw.item["mech-scrap"] then
            ScrapIndustry.items["drive-belt"] = {scrap={"rubber-bits", "mech-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
            ScrapIndustry.items["differential-girdlespring"] = {scrap={"mech-scrap", data.raw.item["nitinol-plate"] and "nitinol-scrap" or "rubber-bits"}, scale=ScrapIndustry.RARE, failrate=0.04}
        else
            ScrapIndustry.items["drive-belt"] = {scrap={"rubber-bits", mods["BrassTacksMk2"] and "brass-scrap" or "iron-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
            ScrapIndustry.items["differential-girdlespring"] = {scrap={"iron-scrap", mods["BrassTacksMk2"] and "brass-scrap" or "copper-scrap", data.raw.item["nitinol-plate"] and "nitinol-scrap" or "rubber-bits"}, scale=ScrapIndustry.RARE, recycle=2, failrate=0.04}
        end
    else

        if data.raw.item["motorized-arm"] then
            for k, v in pairs(ScrapIndustry.items["motorized-arm"].scrap) do
                if v == "circuit-scrap" then
                    ScrapIndustry.items["motorized-arm"].scrap[k] = nil
                end
            end
        end

        ScrapIndustry.items["airtight-seal"] = {scrap={mods["BrassTacksMk2"] and "brass-scrap" or "copper-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
        if data.raw.item["mech-scrap"] then
            ScrapIndustry.items["drive-belt"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
            ScrapIndustry.items["differential-girdlespring"] = {scrap={"mech-scrap", data.raw.item["nitinol-plate"] and "nitinol-scrap" or (mods["BrassTacksmk2"] and "zinc-scrap" or "copper-scrap")}, scale=ScrapIndustry.RARE, failrate=0.04}
        else
            ScrapIndustry.items["drive-belt"] = {scrap=mods["BrassTacksMk2"] and {"brass-scrap", "iron-scrap"} or "iron-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.02}
            ScrapIndustry.items["differential-girdlespring"] = {scrap={mods["BrassTacksMk2"] and {"brass-scrap", "copper-scrap"}, data.raw.item["nitinol-plate"] and "nitinol-scrap" or "iron-scrap"}, scale=ScrapIndustry.RARE, failrate=0.04}
        end
    end

    if misc.difficulty == 3 then
        if data.raw.item["mech-scrap"] then
            rm.AddProduct("sort-mech-scrap", {type="item", name="spring", amount=1, probability=mods["BrassTacksMk2"] and 0.5 or 0.25})
            ScrapIndustry.items["spring"] = {scrap={"mech-scrap", data.raw.item["rubber-bits"] and "rubber-bits" or nil}, scale=ScrapIndustry.CHEAP, failrate=0.02}
        else
            if data.raw.item["rubber-bits"] then
                ScrapIndustry.items["spring"] = {scrap=mods["BrassTacksMk2"] and "brass-scrap" or "copper-scrap", scale=ScrapIndustry.COMMON, failrate=0.02}
            else
                ScrapIndustry.items["spring"] = {scrap={"rubber-bits", mods["BrassTacksMk2"] and "brass-scrap" or "copper-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.02}
            end
        end
    end
end