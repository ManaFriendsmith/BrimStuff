if not mods["space-age"] then return end

--the ability to make spoilage from asteroids makes it possible to power biochambers without dependency on gleba. probably not too scalably given the throughput limits of cargo landing pads but in the late game if you have legendary efficiency and speed modules you can likely get away with relatively little actual nutrient production.
--this is intended gameplay for space platforms but trivializes fueling bioprocessing on fulgora and vulcanus where it's really quite good
--therefore there needs to be a surface property preventing the normal spoilage-to-nutrient recipe. there is a new bioflux + spoilage recipe to bootstrap production of nutrients from bioflux.
--spoilage to nutrients can still be used on nauvis even with just an orbital miner because a) you need to import bioflux anyway for eggs and b) biochambers on nauvis are mediocre and arguably an active detriment for oil processing when playing with LasingAround. (they are needed for eggs->nutrients->spoilage->ore setups but that already requires bioflux; toluene, saltpeter and nitric acid are very nice to have boosted but fussing with nutrients over that is pathetic next to the EM plant and foundry)
data:extend({
  {
    type = "surface-property",
    name = "atmospheric-toxins",
    default_value = 24,
    order = "z"
  }
})

data.raw.surface["space-platform"].surface_properties["atmospheric-toxins"] = 0
data.raw.planet["nauvis"].surface_properties["atmospheric-toxins"] = 1
data.raw.planet["gleba"].surface_properties["atmospheric-toxins"] = 6
data.raw.planet["vulcanus"].surface_properties["atmospheric-toxins"] = 162
data.raw.planet["fulgora"].surface_properties["atmospheric-toxins"] = 78
data.raw.planet["aquilo"].surface_properties["atmospheric-toxins"] = 29

if mods["maraxsis"] then
    data.raw.planet["maraxsis"].surface_properties["atmospheric-toxins"] = 5
end
if mods["LunarLandings"] then
    data.raw.planet["luna"].surface_properties["atmospheric-toxins"] = 0
end
if mods["castra"] then
    data.raw.planet["castra"].surface_properties["atmospheric-toxins"] = 6135
end
if mods["paracelsin"] then
    data.raw.planet["castra"].surface_properties["atmospheric-toxins"] = 21
end