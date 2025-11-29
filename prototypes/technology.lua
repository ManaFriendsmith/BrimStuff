local misc = require("__pf-functions__/misc")
local tm = require("__pf-functions__/technology-manipulation")

data:extend({
    {
        type = "technology",
        name = "rubber",
        icon = "__BrimStuff__/graphics/technology/rubber.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "rubber"
            }
        },
        prerequisites = {"basic-chemistry"},
        unit = {
            count = 30,
            time = 10,
            ingredients = {
                {"automation-science-pack", 1}
            }
        }
    },
    {
        type = "technology",
        name = "electric-chemical-plant",
        icon = "__BrimStuff__/graphics/technology/electric-chemical-plant.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "chemical-plant"
            }
        },
        prerequisites = {"fluid-handling"},
        unit = {
            count = 100,
            time = 15,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            }
        }
    },
    {
        type = "technology",
        name = "byproduct-disposal",
        icon = "__BrimStuff__/graphics/technology/byproduct-disposal.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "potassium-nitrate-disposal"
            },
            {
                type = "unlock-recipe",
                recipe = data.raw.item["carbon-black"] and "carbon-black-disposal" or "coal-disposal"
            },
            {
                type = "unlock-recipe",
                recipe = "sulfur-disposal"
            }
        },
        prerequisites = mods["space-age"] and {"recycling"} or {"utility-science-pack"},
        unit = mods["space-age"] and {} or {
            count = 100,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"utility-science-pack", 1}
            }
        }
    }
})

if mods["space-age"] then
    tm.AddUnlock("byproduct-disposal", "solid-fuel-disposal")
end

if mods["bzgas"] then
    tm.AddUnlock("basic-chemistry", "chemical-waste-incineration")
    tm.AddUnlock("basic-chemistry", "potassium-nitrate")
    tm.AddUnlock("basic-chemistry", "simple-nitric-acid")
else
    data:extend({
        {
            type = "technology",
            name = "basic-chemistry",
            icon = "__BrimStuff__/graphics/technology/basic-chemistry.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "basic-chemical-plant"
                },
                {
                    type = "unlock-recipe",
                    recipe = "chemical-waste-incineration"
                },
                {
                    type = "unlock-recipe",
                    recipe = "potassium-nitrate"
                },
                {
                    type = "unlock-recipe",
                    recipe = "simple-nitric-acid"
                }
            },
            prerequisites = {"automation"},
            ignore_tech_cost_multiplier = true,
            unit = {
                count = 10,
                time = 10,
                ingredients = {
                    {"automation-science-pack", 1}
                }
            }
        }
    })
end

if misc.difficulty > 1 then
    tm.AddUnlock("basic-chemistry", "gunpowder")
    tm.AddUnlock("rubber", "airtight-seal")
    tm.AddUnlock("rubber", "drive-belt")
    tm.AddUnlock("byproduct-disposal", "toluene-disposal")
    if misc.difficulty == 3 then
        tm.AddUnlock("rubber", "spring", "-drive-belt")
    end
end

if mods["space-age"] then
    data:extend({
        {
            type = "technology",
            name = "chemical-waste-leaching",
            icons = {
                {
                    icon = "__BrimStuff__/graphics/technology/chemical-waste-leaching.png",
                    icon_size = 256
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "chemical-waste-leaching"
                }
            },
            prerequisites = {"metallurgic-science-pack"},
            unit = {
                count = 500,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "spoilage-liquefaction",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/spoilage.png",
                    icon_size = 64
                },
                {
                    icon = "__BrimStuff__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    scale = 1,
                    shift = {-24, 24}
                },
                {
                    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
                    icon_size = 64,
                    scale = 1,
                    shift = {24, 24}
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "spoilage-liquefaction"
                }
            },
            prerequisites = {"agricultural-science-pack", "production-science-pack"},
            unit = {
                count = 500,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"agricultural-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "hydroponics",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/yumako-tree.png",
                    icon_size = 64
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "yumako-hydroponics"
                },
                {
                    type = "unlock-recipe",
                    recipe = "jellynut-hydroponics"
                }
            },
            prerequisites = {"agricultural-science-pack", "utility-science-pack"},
            unit = {
                count = 500,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"agricultural-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "pyroponics",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
                    icon_size = 64
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "carbofungus-spore"
                },
                {
                    type = "unlock-recipe",
                    recipe = "carbofungus-pyroponics"
                }
            },
            prerequisites = {"hydroponics", "metallurgic-science-pack", "production-science-pack"},
            unit = {
                count = 500,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"agricultural-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "pyroponics",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
                    icon_size = 64
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "carbofungus-spore"
                },
                {
                    type = "unlock-recipe",
                    recipe = "carbofungus-pyroponics"
                },
                {
                    type = "unlock-recipe",
                    recipe = "tungstool-crossbreeding"
                }
            },
            prerequisites = {"hydroponics", "metallurgic-science-pack", "production-science-pack"},
            unit = {
                count = 1000,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"metallurgic-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "electroponics",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/fulgurite.png",
                    icon_size = 64
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "metalcelium-spore"
                },
                {
                    type = "unlock-recipe",
                    recipe = "metalcelium-electroponics"
                },
                {
                    type = "unlock-recipe",
                    recipe = "metalcelium-electroponics-with-scrap"
                }
            },
            prerequisites = {"hydroponics", "electromagnetic-science-pack", "production-science-pack"},
            unit = {
                count = 1000,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"electromagnetic-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "etymology",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/lithium-iceberg-huge.png",
                    icon_size = 64
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "metalcelium-cryoponics"
                }
            },
            prerequisites = {"electroponics", "cryogenic-science-pack"},
            unit = {
                count = 1500,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"cryogenic-science-pack", 1}
                }
            }
        }
    })

    if mods["IfNickel"] then
        tm.AddUnlock("electroponics", "metalcelium-pyroponics")
    end

    if misc.difficulty == 3 then
        tm.AddUnlock("hydroponics", "growth-serum", "-yumako-hydroponics")
        if mods["IfNickel"] then
            tm.AddUnlock("hydroponics", "bacterium-extraction-from-sludge")
            tm.AddUnlock("hydroponics", "mutagenic-sludge-quelling")
        end
    end
end

if misc.difficulty > 1 then
    data:extend({
        {
            type = "technology",
            name = "advanced-polymer-synthesis",
            icon = "__base__/graphics/technology/plastics.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "plastic-from-toluene"
                }
            },
            prerequisites = {mods["space-age"] and "agricultural-science-pack" or "production-science-pack"},
            unit = {
                count = mods["space-age"] and 500 or 200,
                time = 30,
                ingredients = mods["space-age"] and {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"agricultural-science-pack", 1}
                } or {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "toluene-production",
            icon = "__BrimStuff__/graphics/technology/toluene-production.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "toluene-from-coal"
                },
                {
                    type = "unlock-recipe",
                    recipe = "toluene-from-wood"
                }
            },
            prerequisites = {"electric-chemical-plant"},
            unit = {
                count = 50,
                time = 15,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                }
            }
        }
    })

    if mods["space-age"] then
        data:extend({
            {
                type = "technology",
                name = "explosives-productivity",
                icons = {
                    {
                      icon = "__base__/graphics/technology/explosives.png",
                      icon_size = 256
                    },
                    {
                      icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
                      icon_size = 128,
                      scale = 0.5,
                      shift = {50, 50}
                    }
                  },
                effects =
                {
                  {
                    type = "change-recipe-productivity",
                    recipe = "gunpowder",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "gunpowder-in-space",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "boompuff-cultivation",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "explosives",
                    change = 0.1
                  }
                },
                prerequisites = {"agricultural-science-pack", "production-science-pack", "military-science-pack"},
                unit =
                {
                  count_formula = "1.5^L*500",
                  ingredients =
                  {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"agricultural-science-pack", 1}
                  },
                  time = 60
                },
                max_level = "infinite",
                upgrade = true
              }
        })
        data.raw.technology["advanced-polymer-synthesis"].localised_description = {"technology-description.advanced-polymer-synthesis-sa"}        
    else
        tm.AddUnlock("advanced-polymer-synthesis", "synthetic-rubber")
    end
end

if misc.difficulty == 3 and mods["IfNickel"] and mods["space-age"] then
    data:extend({
        {
            type = "technology",
            name = "advanced-sludge-handling",
            icon = "__BrimStuff__/graphics/technology/advanced-sludge-handling.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "sludge-synthesis"
                },
                {
                    type = "unlock-recipe",
                    recipe = "toxin-extraction"
                }
            },
            prerequisites = {"hydroponics", "tissue-cultivation", "production-science-pack"},
            unit = {
                count = 1000,
                time = 30,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"agricultural-science-pack", 1}
                }
            }
        }
    })
end