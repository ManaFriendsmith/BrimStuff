local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")

if mods["Paracelsin"] then
    if misc.difficulty == 1 then
        data:extend({
            {
                type = "recipe",
                name = "paracelsian-synthetic-rubber",
                category = "organic-or-basic-chemistry",
                additional_categories = {"electrochemistry"},
                ingredients = {
                    {type="item", name="solid-fuel", amount=5},
                    {type="item", name="sulfur", amount=1},
                    {type="fluid", name="nitric-acid", amount=10}
                },
                results = {
                    {type="item", name="rubber", amount=1},
                    {type="fluid", name="chemical-waste", amount=15}
                },
                main_product = "rubber",
                auto_recycle = false,
                energy_required = 1,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {1, 0.55, 0.55, 1},
                    secondary = {0.8, 0.4, 0.1, 1},
                    tertiary = {0, 0, 0, 0.5},
                    quaternary = {1, 1, 1, 1}
                }
            }
        })
    else
        data:extend({
            {
                type = "recipe",
                name = "paracelsian-synthetic-toluene",
                icons = {
                    {
                        icon = "__BrimStuffMk2__/graphics/icons/toluene.png",
                        icon_size = 64
                    },
                    {
                        icon = "__space-age__/graphics/icons/carbon.png",
                        icon_size = 64,
                        scale = 0.25,
                        shift = {-8, -8}
                    }
                },
                category = "organic-or-basic-chemistry",
                additional_categories = {"electrochemistry"},
                ingredients = {
                    {type="item", name="carbon", amount=2},
                    {type="item", name="vaterite", amount=2},
                    {type="fluid", name="nitric-acid", amount=10},
                },
                results = {
                    {type="item", name="toluene", amount=1},
                    {type="fluid", name="chemical-waste", amount=15}
                },
                main_product = "toluene",
                auto_recycle = false,
                energy_required = 2,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {0.15, 0.15, 0.15, 1},
                    secondary = {1, 1, 1, 1},
                    tertiary = {1, 1, 0.7, 1},
                    quaternary = {1, 1, 1, 1}
                }
            }
        })
    end
end

data:extend({
    {
        type = "recipe-category",
        name = "basic-chemistry",
    },
    {
        type = "recipe",
        name = "potassium-nitrate",
        category = mods["space-age"] and "organic-or-basic-chemistry" or "basic-chemistry",
        ingredients = {
            {type="item", name="stone", amount=1},
            {type="fluid", name="water", amount=20}
        },
        results = {
            {type="item", name="potassium-nitrate", amount=1},
            {type="fluid", name="chemical-waste", amount=10}
        },
        main_product = "potassium-nitrate",
        auto_recycle = false,
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.9, 0.6, 0.3, 1},
            secondary = {1, 1, 0.5, 1},
            tertiary = {0.25, 0.25, 0.25, 0.25},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "rubber",
        category = mods["space-age"] and "organic-or-basic-chemistry" or "basic-chemistry",
        ingredients = {
            {type="item", name="wood", amount=3},
            {type="item", name="sulfur", amount=1},
            {type="fluid", name="water", amount=60},
        },
        results = {
            {type="item", name="rubber", amount=2},
            {type="fluid", name="chemical-waste", amount=30}
        },
        main_product = "rubber",
        auto_recycle = false,
        energy_required = 2,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {1, 0.55, 0.55, 1},
            secondary = {0.8, 0.4, 0.1, 1},
            tertiary = {0, 0, 0, 0.5},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "pf-nitric-acid",
        category = mods["space-age"] and "organic-or-chemistry" or "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        ingredients = {
            {type="item", name="copper-plate", amount=1},
            {type="item", name="potassium-nitrate", amount=2},
            {type="fluid", name="sulfuric-acid", amount=10},
            {type="fluid", name="water", amount=100}
        },
        results = {
            {type="fluid", name="nitric-acid", amount=100},
            {type="fluid", name="chemical-waste", amount=25}
        },
        main_product = "nitric-acid",
        auto_recycle = false,
        energy_required = 1,
        enabled = false,
        allow_productivity = true,
        crafting_machine_tint = {
            primary = {0.5, 0.75, 1, 1},
            secondary = {1, 1, 1, 1},
            tertiary = {0.25, 0.5, 1, 1},
            quaternary = {1, 1, 1, 1}
          }
    },
    {
        type = "recipe",
        name = "simple-nitric-acid",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/nitric-acid.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__BrimStuffMk2__/graphics/icons/potassium-nitrate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          }
        },
        category = mods["space-age"] and "organic-or-basic-chemistry" or "basic-chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 1,
        auto_recycle = false,
        ingredients = {
            {type="item", name="potassium-nitrate", amount=1},
            {type="fluid", name="water", amount=mods["space-age"] and 10 or 30}
        },
        results = {
            {type="fluid", name="nitric-acid", amount=5}
        },
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
          primary = {0.75, 0.75, 1, 1},
          secondary = {1, 1, 1, 1},
          tertiary = {0.5, 0.5, 1, 1},
          quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "chemical-waste-incineration",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          }
        },
        category = "basic-chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 1,
        auto_recycle = false,
        ingredients = {
            {type="fluid", name="chemical-waste", amount=200}
        },
        results = {
            {type="fluid", name="steam", amount=20, temperature=165}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
          primary = {0.5, 0, 1, 1},
          secondary = {1, 0, 1, 1},
          tertiary = {0.5, 0, 1, 1},
          quaternary = {0.8, 0.8, 0.8, 0.8}
        }
    },
    {
        type = "recipe",
        name = "chemical-waste-reprocessing",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 0.25,
            shift = {8, 8}
          }
        },
        auto_recycle = false,
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 2,
        ingredients = {
            {type="fluid", name="chemical-waste", amount=600},
            {type="fluid", name="sulfuric-acid", amount=5}
        },
        results = {
            {type="fluid", name="steam", amount=5, temperature=165},
            {type="item", name="coal", amount=1},
            {type="item", name="stone", amount=1}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
          primary = {0.5, 0, 1, 1},
          secondary = {1, 0, 1, 1},
          tertiary = {0.5, 0, 1, 1},
          quaternary = {0.8, 0.8, 0.8, 0.8}
        }
    },
    {
        type = "recipe",
        name = "potassium-nitrate-disposal",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__BrimStuffMk2__/graphics/icons/potassium-nitrate.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 0.33
          }
        },
        auto_recycle = false,
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 2,
        ingredients = {
            {type="fluid", name="nitric-acid", amount=5},
            {type="fluid", name="water", amount=10},
            {type="item", name="potassium-nitrate", amount=8}
        },
        results = {
            {type="fluid", name="chemical-waste", amount=50}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
            primary = {0.5, 0, 1, 1},
            secondary = {0.9, 0.9, 0.9, 1},
            tertiary = {0.5, 0, 1, 1},
            quaternary = {0.9, 0.9, 0.9, 1}
        }
    },
    {
        type = "recipe",
        name = data.raw.item["carbon-black"] and "carbon-black-disposal" or "coal-disposal",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = data.raw.item["carbon-black"] and "__bzcarbon__/graphics/icons/carbon-black.png" or "__base__/graphics/icons/coal.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 0.33
          }
        },
        auto_recycle = false,
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 1,
        ingredients = {
            {type="fluid", name="nitric-acid", amount=5},
            {type="fluid", name="water", amount=10},
            {type="item", name=data.raw.item["carbon-black"] and "carbon-black" or "coal", amount=10}
        },
        results = {
            {type="fluid", name="chemical-waste", amount=50}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
            primary = {0.5, 0, 1, 1},
            secondary = {0.1, 0, 0.2, 1},
            tertiary = {0.5, 0, 1, 1},
            quaternary = {0.1, 0, 0.2, 1}
        }
    },
    {
        type = "recipe",
        name = "sulfur-disposal",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__base__/graphics/icons/sulfur.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 0.33
          }
        },
        auto_recycle = false,
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        energy_required = 1,
        ingredients = {
            {type="fluid", name="sulfuric-acid", amount=5},
            {type="fluid", name="water", amount=10},
            {type="item", name="sulfur", amount=10}
        },
        results = {
            {type="fluid", name="chemical-waste", amount=50}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
            primary = {0.5, 0, 1, 1},
            secondary = {1, 1, 0, 1},
            tertiary = {0.5, 0, 1, 1},
            quaternary = {1, 1, 0, 1}
        }
    }
})

if mods["space-age"] then
    if mods["Age-of-Production"] then
        data:extend({
            {
                type = "recipe-category",
                name = "petrochemistry-or-basic-chemistry",
                can_recycle = false
            }
        })
    end
    data:extend({
        {
            type = "recipe-category",
            name = "organic-or-basic-chemistry",
            can_recycle = false
        },    
        {
            type = "recipe-category",
            name = "cryogenics-or-basic-chemistry",
            can_recycle = false
        },
        {
            type = "recipe",
            name = "panspermia-asteroid-crushing",
            icon = "__pf-sa-compat__/graphics/icons/panspermia-asteroid-crushing.png",
            icon_size = 64,
            subgroup = "space-crushing",
            order = "b-a-d",
            category = "crushing",
            ingredients = {
                {type="item", name="panspermia-asteroid-chunk", amount=1},
            },
            results = {
                {type="item", name="spoilage", amount=20},
                {type="item", name="panspermia-asteroid-chunk", amount=1, probability=0.2}
            },
            auto_recycle = false,
            energy_required = 2,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "advanced-panspermia-asteroid-crushing",
            icon = "__pf-sa-compat__/graphics/icons/advanced-panspermia-asteroid-crushing.png",
            icon_size = 64,
            subgroup = "space-crushing",
            order = "fa",
            category = "crushing",
            ingredients = {
                {type="item", name="panspermia-asteroid-chunk", amount=1},
            },
            results = {
                {type="item", name="spoilage", amount=10},
                {type="item", name="wood", amount=4},
                {type="item", name="panspermia-asteroid-chunk", amount=1, probability=0.05}
            },
            auto_recycle = false,
            energy_required = 5,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "panspermia-asteroid-reprocessing",
            icon = "__pf-sa-compat__/graphics/icons/panspermia-asteroid-reprocessing.png",
            icon_size = 64,
            subgroup = "space-crushing",
            order = "b-b-d",
            category = "crushing",
            ingredients = {
                {type="item", name="panspermia-asteroid-chunk", amount=1},
            },
            results = {
                --to be computed in pf-sa-compat
            },
            auto_recycle = false,
            energy_required = 2,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "toxic-environment-nutrients-bootstrap",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/nutrients-from-spoilage.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__space-age__/graphics/icons/bioflux.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25
                }
            },
            auto_recycle = false,
            subgroup = "agriculture-processes",
            order = "c[nutrients]-c[nutrients-from-spoilage]-alt",
            category = "crafting",
            ingredients = {
                {type="item", name="spoilage", amount=10},
                {type="item", name="bioflux", amount=1},
            },
            results = {
                {type="item", name="nutrients", amount=5, percent_spoiled = 0.25},
            },
            energy_required = 5,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "spoilage-dessiccation",
            category = "organic-or-basic-chemistry",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/spoilage.png",
                    icon_size = 64
                },
                {
                    icon = "__BrimStuffMk2__/graphics/icons/potassium-nitrate.png",
                    icon_size = 64,
                    scale = 0.5
                }
            },
            auto_recycle = false,
            ingredients = {
                {type="item", name="spoilage", amount=5}
            },
            results = {
                {type="item", name="potassium-nitrate", amount=1},
                {type="fluid", name="chemical-waste", amount=15}
            },
            main_product = "potassium-nitrate",
            energy_required = 2,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.32, 0.56, 0.39, 1},
                secondary = {0.45, 0.75, 0.6, 1},
                tertiary = {0.2, 0.33, 0.25, 1},
                quaternary = {0.32, 0.56, 0.39, 1}
            }
        },
        {
            type = "recipe",
            name = "spoilage-liquefaction",
            subgroup = "agriculture-processes",
            order = "z",
            category = "organic",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/spoilage.png",
                    icon_size = 64
                },
                {
                    icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-6, 6}
                },
                {
                    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {6, 6}
                }
            },
            ingredients = {
                {type="item", name="spoilage", amount=30}
            },
            results = {
                {type="fluid", name="chemical-waste", amount=200, fluidbox_multiplier=10},
                {type="fluid", name="heavy-oil", amount=20},
            },
            auto_recycle = false,
            energy_required = 10,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.5, 0, 1, 1},
                secondary = {0.5, 0, 1, 1}
            }
        },
        {
            type = "recipe",
            name = "synthetic-rubber",
            category = "organic-or-basic-chemistry",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/rubber.png",
                    icon_size = 64
                },
                {
                    icon = "__space-age__/graphics/icons/carbon.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-8, -8}
                }
            },
            ingredients = {
                {type="item", name="carbon", amount=3},
                {type="item", name="sulfur", amount=1},
                {type="fluid", name="petroleum-gas", amount=20},
            },
            results = {
                {type="item", name="rubber", amount=3},
                {type="fluid", name="chemical-waste", amount=45}
            },
            main_product = "rubber",
            auto_recycle = false,
            energy_required = 2,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.55, 0.55, 1},
                secondary = {1, 1, 1, 1},
                tertiary = {0, 0, 0, 0.5},
                quaternary = {1, 1, 1, 1}
            }
        },
        {
            type = "recipe",
            name = "chemical-waste-leaching",
            category = "chemistry",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__BrimStuffMk2__/graphics/icons/nitric-acid.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = {8, 8}
                }
            },
            ingredients = {
                {type="fluid", name="nitric-acid", amount=100},
                {type="fluid", name="chemical-waste", amount=6000},
            },
            results = {
                {type="item", name="coal", amount=6},
                {type="item", name="iron-ore", amount=6},
                {type="item", name="copper-ore", amount=6}
            },
            auto_recycle = false,
            energy_required = 20,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.55, 0.55, 1},
                secondary = {1, 1, 1, 1},
                tertiary = {0, 0, 0, 0.5},
                quaternary = {1, 1, 1, 1}
            }
        },
        {
            type = "recipe",
            name = "fertilizer-slurry-from-nutrients",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/fertilizer-slurry.png",
                    icon_size = 64
                },
                {
                    icon = "__space-age__/graphics/icons/nutrients.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-8, -8}
                }

            },
            category = "organic-or-basic-chemistry",
            subgroup = "brimstuff-botany",
            order = "aa",
            ingredients = {
                {type="fluid", name="water", amount=80},
                {type="item", name="potassium-nitrate", amount=1},
                {type="item", name="nutrients", amount=5}
                --with spoilage to nutrients this is worse than spoilage dessiccation -> simple nitric acid
                --once you have bioflux in bulk nutrients are close to free
            },
            results = {
                {type="fluid", name="fertilizer-slurry", amount=100}
            },
            auto_recycle = false,
            energy_required = 1,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "yumako-hydroponics",
            icon = "__space-age__/graphics/icons/yumako-tree.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "d",
            ingredients = {
                {type="item", name="yumako-seed", amount=1},
                {type="fluid", name="fertilizer-slurry", amount=20}
            },
            results = {
                {type="item", name="yumako", amount=15}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 2000,
                    max = 2000
                }
            },
            auto_recycle = false,
            energy_required = 20,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.1, 0.1, 1}
              }
        },
        {
            type = "recipe",
            name = "jellynut-hydroponics",
            icon = "__space-age__/graphics/icons/jellystem.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "e",
            ingredients = {
                {type="item", name="jellynut-seed", amount=1},
                {type="fluid", name="fertilizer-slurry", amount=20}
            },
            results = {
                {type="item", name="jellynut", amount=15}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 2000,
                    max = 2000
                }
            },
            auto_recycle = false,
            energy_required = 20,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.5, 0.7, 1}
            }
        },
        {
            type = "recipe",
            name = "carbofungus-spore",
            category = "organic",
            subgroup = "brimstuff-botany",
            order = "f",
            ingredients = {
                {type="item", name="nutrients", amount=3},
                {type="fluid", name="sulfuric-acid", amount=30}
            },
            results = {
                {type="item", name="spoilage", amount=1, ignored_by_productivity=1},
                {type="item", name="carbofungus-spore", amount_min=1, amount_max=3}
            },
            main_product = "carbofungus-spore",
            surface_conditions = {
                {
                    property = "pressure",
                    min = 4000,
                    max = 4000
                }
            },
            energy_required = 1,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "carbofungus-pyroponics",
            icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "fa",
            ingredients = {
                {type="item", name="carbofungus-spore", amount=1},
                {type="fluid", name="fertilizer-slurry", amount=10}
            },
            results = {
                {type="item", name="coal", amount=1},
                {type="item", name="carbofungus-spore", amount=1, probability=0.25}
                --probability can be low - since this is post-gleba it is reasonable to expect players to have good prodmods.
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 4000,
                    max = 4000
                }
            },
            auto_recycle = false,
            energy_required = 6,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.1, 0, 0.3, 1}
            }
        },
        {
            type = "recipe",
            name = "tungstool-crossbreeding",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
                    icon_size = 64,        
                },
                {
                    icon = "__space-age__/graphics/icons/tungsten-ore.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-8, -8}
                }
            },
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "fb",
            ingredients = {
                {type="item", name="metalcelium-spore", amount=4},
                {type="item", name="carbofungus-spore", amount=4},
                {type="fluid", name="fertilizer-slurry", amount=30}
            },
            results = {
                {type="item", name="tungsten-ore", amount=1}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 4000,
                    max = 4000
                }
            },
            auto_recycle = false,
            energy_required = 5,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.5, 0, 1, 1}
            }
        },
        {
            type = "recipe",
            name = "metalcelium-spore",
            category = "organic",
            subgroup = "brimstuff-botany",
            order = "g",
            ingredients = {
                {type="fluid", name="fertilizer-slurry", amount=60},
                {type="item", name="bioflux", amount=1},
                {type="item", name="copper-bacteria", amount=1},
                {type="item", name="iron-bacteria", amount=1}
            },
            results = {
                {type="item", name="metalcelium-spore", amount=10},
                {type="fluid", name="chemical-waste", amount=20}
            },
            main_product = "metalcelium-spore",
            surface_conditions = {
                {
                    property = "pressure",
                    min = 2000,
                    max = 2000
                }
            },
            auto_recycle = false,
            energy_required = 5,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "metalcelium-electroponics",
            icon = "__space-age__/graphics/icons/fulgurite.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "ga",
            ingredients = {
                {type="item", name="metalcelium-spore", amount=10},
                {type="fluid", name="fertilizer-slurry", amount=30}
            },
            results = {
                {type="item", name="holmium-ore", amount=1}
            },
            surface_conditions = {
                {
                    property = "magnetic-field",
                    min = 99
                }
            },
            auto_recycle = false,
            energy_required = 50,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.9, 0.4, 0.4, 1}
            }
        },
        {
            type = "recipe",
            name = "metalcelium-electroponics-with-scrap",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/fulgurite.png",
                    icon_size = 64,        
                },
                {
                    icon = "__space-age__/graphics/icons/scrap.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-8, -8}
                }
            },
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "gb",
            ingredients = {
                {type="item", name="metalcelium-spore", amount=1},
                {type="item", name="scrap", amount=10},
                {type="fluid", name="fertilizer-slurry", amount=10}
            },
            results = {
                {type="item", name="holmium-ore", amount=1},
                {type="item", name="metalcelium-spore", amount=1, ignored_by_stats=1, probability=0.2},
                {type="item", name="stone", amount=1, probability=0.4},
                {type="item", name="ice", amount=1, probability=0.5},
                {type="item", name="concrete", amount=1, probability=0.6},
                {type="fluid", name="chemical-waste", amount=80}
            },
            surface_conditions = {
                {
                    property = "magnetic-field",
                    min = 99
                }
            },
            auto_recycle = false,
            energy_required = 5,
            allow_productivity = false,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.8, 0.35, 0.35, 1}
            }
        },
        {
            type = "recipe",
            name = "metalcelium-cryoponics",
            icon = "__space-age__/graphics/icons/lithium-iceberg-huge.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "gd",
            ingredients = {
                {type="item", name="metalcelium-spore", amount=1},
                {type="fluid", name="ammoniacal-solution", amount=200}
            },
            results = {
                {type="item", name="spoilage", amount=1},
                {type="fluid", name="lithium-brine", amount=1}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 300,
                    max = 300
                }
            },
            auto_recycle = false,
            energy_required = 5,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.9, 0.9, 0.9, 1}
            }
        },
        {
            type = "recipe",
            name = "solid-fuel-disposal",
            icons = {
              {
                icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                icon_size = 64,
                icon_mipmaps = 4,
              },
              {
                icon = "__base__/graphics/icons/solid-fuel.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.33
              }
            },
            category = "chemistry",
            subgroup = "fluid-recipes",
            order = "c[oil-products]-ca",
            energy_required = 1,
            ingredients = {
                {type="fluid", name="nitric-acid", amount=5},
                {type="fluid", name="light-oil", amount=5},
                {type="item", name="solid-fuel", amount=10}
            },
            results = {
                {type="fluid", name="chemical-waste", amount=75}
            },
            auto_recycle = false,
            energy_required = 1,
            allow_productivity = true,
            enabled = false,
            emissions_multiplier = 5,
            crafting_machine_tint = {
                primary = {0.5, 0, 1, 1},
                secondary = {1, 0.5, 0, 1},
                tertiary = {0.5, 0, 1, 1},
                quaternary = {1, 0.5, 0, 1}
            }
        }
    })

    if mods["IfNickelMk2"] then
        data:extend({
            {
                type = "recipe",
                name = "metalcelium-pyroponics",
                category = "brimstuff-botany",
                subgroup = "brimstuff-botany",
                order = "gc",
                ingredients = {
                    {type="item", name="metalcelium-spore", amount=1},
                    {type="item", name="stone", amount=20},
                    {type="fluid", name="fertilizer-slurry", amount=10}
                },
                results = {
                    {type="item", name="malachite", amount=4}
                },
                surface_conditions = {
                    {
                        property = "pressure",
                        min = 4000,
                        max = 4000
                    }
                },
                auto_recycle = false,
                energy_required = 10,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {0, 0.5, 0.5, 1}
                }
            }
        })

        rm.AddIngredient("metalcelium-spore", "nickel-bacteria", 1)
        rm.AddProduct("metalcelium-spore", "metalcelium-spore", 6)

        rm.RemoveProduct("chemical-waste-leaching", "iron-ore", 1)
        rm.RemoveProduct("chemical-waste-leaching", "copper-ore", 1)
        rm.AddProduct("chemical-waste-leaching", "nickel-ore", 2)
    end


    if mods["BrassTacksMk2"] then
        rm.AddIngredient("metalcelium-spore", "zinc-bacteria", 1)
        rm.AddProduct("metalcelium-spore", "metalcelium-spore", mods["IfNickelMk2"] and 9 or 6)

        rm.RemoveProduct("chemical-waste-leaching", "coal", 2)
        rm.AddProduct("chemical-waste-leaching", "zinc-ore", 2)
    end

    if mods["castra"] then
        data:extend({
            {
                type = "recipe",
                name = "rubber-gunpowder",
                icons = {
                    {
                        icon = "__BrimStuffMk2__/graphics/icons/rubber.png",
                        icon_size = 64
                    },
                    {
                        icon = "__castra__/graphics/icons/fluid/hydrogen-sulfide.png",
                        icon_size = 64,
                        shift = {-8, -8},
                        scale = 0.25
                    }
                },
                category = "organic-or-basic-chemistry",
                subgroup = "castra-processes",
                order = "gc",
                ingredients = {
                    {type="fluid", name="hydrogen-sulfide", amount=30},
                    {type="item", name="gunpowder", amount=2},
                    {type="item", name="carbon", amount=1}
                },
                results = {
                    {type="item", name="rubber", amount=2},
                    {type="fluid", name="chemical-waste", amount=35}
                },
                main_product = "rubber",
                surface_conditions = {
                    {
                        property = "pressure",
                        min = 1254,
                        max = 1254
                    }
                },
                auto_recycle = false,
                energy_required = 1,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {1, 0.55, 0.55, 1},
                    secondary = {1, 1, 1, 1},
                    tertiary = {0, 0, 0, 0.5},
                    quaternary = {1, 1, 1, 1}
                }
            },
            {
                type = "recipe",
                name = "gunpowder-disposal",
                icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                {
                    icon = misc.difficulty == 1 and "__castra__/graphics/icons/gunpowder.png" or "__BrimStuffMk2__/graphics/icons/gunpowder.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.33
                }
                },
                category = "chemistry",
                subgroup = "fluid-recipes",
                order = "c[oil-products]-ca",
                energy_required = 1,
                ingredients = {
                    {type="fluid", name="sulfuric-acid", amount=5},
                    {type="fluid", name="petroleum-gas", amount=5},
                    {type="item", name="gunpowder", amount=10}
                },
                results = {
                    {type="fluid", name="chemical-waste", amount=75}
                },
                auto_recycle = false,
                energy_required = 1,
                allow_productivity = true,
                enabled = false,
                emissions_multiplier = 5,
                crafting_machine_tint = {
                    primary = {0.5, 0, 1, 1},
                    secondary = {1, 0.5, 0, 1},
                    tertiary = {0.5, 0, 1, 1},
                    quaternary = {1, 0.5, 0, 1}
                }
            }
        })
    end
end

if mods["LunarLandings"] then
    data:extend({
        {
        type = "recipe",
        name = "astral-waste-treatment",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__LunarLandings__/graphics/fluid/astroflux.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          }
        },
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        main_product = "",
        enabled = false,
        auto_recycle = false,
        energy_required = 2,
        allow_decomposition = false,
        allow_productivity = true,
        ingredients = {
            {type="fluid", name="chemical-waste", amount=600},
            {type="fluid", name="ll-astroflux", amount=10},
            {type="item", name="coal", amount=1}
        },
        results = {
            {type="fluid", name="petroleum-gas", amount=100}
        },
        crafting_machine_tint = {
          primary = {0.5, 0, 1, 1},
          secondary = {1, 0, 1, 1},
          tertiary = {0.75, 0.5, 1, 1},
          quaternary = {0.9, 0.8, 1, 1}
        }
      }
    })
end

if tune_up_data then
   tune_up_data.recipes["potassium-nitrate"] = {
    category = "purification",
    count = 2,
    energy_required = 1,
    ingredients = {{{"nitric-acid", 20}, {"stone", 1}}}
  }

   tune_up_data.recipes["rubber"] = {
    category = "purification",
    count = 5,
    energy_required = 1,
    ingredients = {{{"light-oil", 25}, {"toluene", 1}, {"sulfur", 1}}}
  }

   tune_up_data.recipes["gunpowder"] = {
    category = "purification",
    count = 3,
    energy_required = 1,
    ingredients = {{{"sulfuric-acid", 5}, {"carbon", 1}, {"potassium-nitrate", 1}}, {{"sulfuric-acid", 5}, {"coal", 1}, {"potassium-nitrate", 1}}}
  }

  tune_up_data.recipes["toluene"] = {
    category = "purification",
    count = 5,
    energy_required = 2,
    ingredients = {{{"nitric-acid", 50}, {"carbon", 1}, {"coal", 1}}, {{"nitric-acid", 50}, {"coal", 2}}}
  }

   tune_up_data.recipes["airtight-seal"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 2,
    ingredients = {{{"rubber", 1}, {"plastic-bar", 1}}}
  }

   tune_up_data.recipes["drive-belt"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 2,
    ingredients = {{{"rubber", 1}, {"bearing", 1}}, {{"rubber", 2}, {"spring", 1}}, {{"rubber", 2}, {"iron-gear-wheel", 1}}}
  }

   tune_up_data.recipes["spring"] = {
    category = "tuning-up",
    count = data.raw.item["nitinol-plate"] and 20 or 2,
    energy_required = data.raw.item["nitinol-plate"] and 20 or 1,
    ingredients = {{{"nitinol-plate", 1}}, {{"bronze-plate", 1}}, {{"brass-plate", 1}}, {{"copper-plate", 1}}}
  }

   tune_up_data.recipes["differential-girdlespring"] = {
    category = "tuning-up",
    count = 5,
    energy_required = 20,
    ingredients = {{{"nitinol-plate", 1}, {"complex-joint", 2}}, {{"nitinol-plate", 1}, {"spring", 20}}, {{"complex-joint", 1}, {"low-density-structure", 1}}, {{"low-density-structure", 1}}}
  }

   tune_up_data.recipes["carbofungus-spore"] = {
    category = "purification",
    count = 3,
    energy_required = 3,
    ingredients = {{{"growth-serum", 3}, {"nutrients", 1}, {"carbon", 1}}, {{"fertilizer-slurry", 15}, {"nutrients", 1}, {"carbon", 1}}}
  }
  
  tune_up_data.recipes["metalcelium-spore"] = {
    category = "purification",
    count = 5,
    energy_required = 5,
    ingredients = {{{"growth-serum", 5}, {"nutrients", 1}, {"holmium-ore", 1}}, {{"fertilizer-slurry", 25}, {"nutrients", 1}, {"holmium-ore", 1}}}
  }

end

if misc.difficulty == 1 then
    return
end

data:extend({
    {
        type = "recipe",
        name = "gunpowder",
        category = "basic-chemistry",
        ingredients = {
            {type="item", name="sulfur", amount=2},
            {type="item", name="coal", amount=1},
            {type="item", name="potassium-nitrate", amount=2},
            {type="fluid", name="water", amount=60},
        },
        results = {
            {type="item", name="gunpowder", amount=3},
            {type="fluid", name="chemical-waste", amount=60}
        },
        surface_conditions = mods["space-age"] and {
            {
                property = "pressure",
                min = 1
            }
        } or nil,
        main_product = "gunpowder",
        auto_recycle = false,
        energy_required = 3,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.5, 0.5, 0.5, 1},
            secondary = {1, 1, 0, 1},
            tertiary = {0, 0, 0, 1},
            quaternary = {1, 1, 0, 1}
        }
    },
    {
        type = "recipe",
        name = "toluene-from-wood",
        icons = {
            {
                icon = "__BrimStuffMk2__/graphics/icons/toluene.png",
                icon_size = 64
            },
            {
                icon = "__base__/graphics/icons/wood.png",
                icon_size = 64,
                scale = 0.25,
                shift = {-8, -8}
            }
        },
        category = mods["space-age"] and "organic-or-basic-chemistry" or "chemistry",
        ingredients = {
            {type="item", name="wood", amount=10},
            {type="fluid", name="steam", amount=10},
        },
        results = {
            {type="item", name="toluene", amount=1},
            {type="fluid", name="chemical-waste", amount=30}
        },
        main_product = "toluene",
        auto_recycle = false,
        energy_required = 2,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.75, 0.375, 0, 1},
            secondary = {1, 1, 1, 1},
            tertiary = {1, 1, 0.7, 1},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "toluene-from-coal",
        icons = {
            {
                icon = "__BrimStuffMk2__/graphics/icons/toluene.png",
                icon_size = 64
            },
            {
                icon = "__base__/graphics/icons/coal.png",
                icon_size = 64,
                scale = 0.25,
                shift = {-8, -8}
            }
        },
        category = mods["space-age"] and "organic-or-basic-chemistry" or "chemistry",
        ingredients = {
            {type="item", name="coal", amount=1},
            {type="fluid", name="steam", amount=5},
        },
        results = {
            {type="item", name="toluene", amount=1},
            {type="fluid", name="chemical-waste", amount=15}
        },
        main_product = "toluene",
        auto_recycle = false,
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.15, 0.15, 0.15, 1},
            secondary = {1, 1, 1, 1},
            tertiary = {1, 1, 0.7, 1},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "drive-belt",
        category = "crafting",
        ingredients = {
            {type="item", name="rubber", amount=3},
            {type="item", name="iron-gear-wheel", amount=2},
            {type="item", name="iron-stick", amount=1}
        },
        results = {
            {type="item", name="drive-belt", amount=1}
        },
        energy_required = 2,
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "airtight-seal",
        category = "crafting",
        ingredients = {
            {type="item", name="rubber", amount=2},
            {type="item", name="copper-plate", amount=2},
        },
        results = {
            {type="item", name="airtight-seal", amount=1}
        },
        energy_required = 2.5,
        lasermill_vanilla = {helium = -1},
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "toluene-disposal",
        icons = {
          {
            icon = "__BrimStuffMk2__/graphics/icons/chemical-waste.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__BrimStuffMk2__/graphics/icons/toluene.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 0.33
          }
        },
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-ca",
        auto_recycle = false,
        energy_required = 1,
        ingredients = {
            {type="fluid", name="nitric-acid", amount=5},
            {type="fluid", name="water", amount=10},
            {type="item", name="toluene", amount=10}
        },
        results = {
            {type="fluid", name="chemical-waste", amount=75}
        },
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        emissions_multiplier = 5,
        crafting_machine_tint = {
            primary = {0.5, 0, 1, 1},
            secondary = {1, 1, 0.7, 1},
            tertiary = {0.5, 0, 1, 1},
            quaternary = {1, 1, 0.7, 1}
        }
    }
})

if mods["space-age"] then
    data:extend({
        {
            type = "recipe",
            name = "gunpowder-in-space",
            category = "chemistry",
            ingredients = {
                {type="item", name="carbon", amount=1},
                {type="item", name="potassium-nitrate", amount=1},
                {type="fluid", name="thruster-fuel", amount=5},
                {type="fluid", name="thruster-oxidizer", amount=5},
            },
            results = {
                {type="item", name="gunpowder", amount=3},
                {type="fluid", name="chemical-waste", amount=30}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    max = 0
                }
            },
            main_product = "gunpowder",
            auto_recycle = false,
            energy_required = 3,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.5, 0.5, 0.5, 1},
                secondary = {1, 1, 0, 1},
                tertiary = {0, 0, 0, 1},
                quaternary = {1, 1, 0, 1}
            }
        },
        {
            type = "recipe",
            name = "boompuff-cultivation",
            icon = "__space-age__/graphics/icons/boompuff.png",
            icon_size = 64,
            category = "brimstuff-botany",
            subgroup = "brimstuff-botany",
            order = "c",
            ingredients = {
                {type="item", name="spoilage", amount=10},
                {type="fluid", name="fertilizer-slurry", amount=50}
            },
            results = {
                {type="item", name="gunpowder", amount=3}
            },
            surface_conditions = {
                {
                    property = "pressure",
                    min = 2000,
                    max = 2000
                }
            },
            main_product = "gunpowder",
            auto_recycle = false,
            energy_required = 10,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.5, 0, 1}
            }
        }
    })

    rm.ReplaceIngredientProportional("synthetic-rubber", "carbon", "toluene", 0.33)
    data.raw.recipe["synthetic-rubber"].icons[2].icon = "__BrimStuffMk2__/graphics/icons/toluene.png"
else
    data:extend({
        {
            type = "recipe",
            name = "synthetic-rubber",
            category = "chemistry",
            icons = {
                {
                    icon = "__BrimStuffMk2__/graphics/icons/rubber.png",
                    icon_size = 64
                },
                {
                    icon = "__BrimStuffMk2__/graphics/icons/toluene.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {-8, -8}
                }
            },
            ingredients = {
                {type="item", name="toluene", amount=1},
                {type="item", name="sulfur", amount=2},
                {type="fluid", name="petroleum-gas", amount=20},
            },
            results = {
                {type="item", name="rubber", amount=3},
                {type="fluid", name="chemical-waste", amount=45}
            },
            main_product = "rubber",
            auto_recycle = false,
            energy_required = 2,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {1, 0.55, 0.55, 1},
                secondary = {1, 1, 1, 1},
                tertiary = {0, 0, 0, 0.5},
                quaternary = {1, 1, 1, 1}
            }
        }
    })
end

if misc.difficulty == 2 then
    return
end

data:extend({
    {
        type = "recipe",
        name = "spring",
        category = "crafting",
        subgroup = "intermediate-product",
        ingredients = {
            {type="item", name="iron-stick", amount=1},
            {type="item", name="copper-plate", amount=1},
            {type="item", name="rubber", amount=1}
        },
        results = {
            {type="item", name="spring", amount=1}
        },
        energy_required = 0.5,
        lasermill_vanilla = {helium = -1},
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    }
})

rm.ReplaceIngredientProportional("drive-belt", "iron-stick", "spring")

if mods["space-age"] or mods["LunarLandings"] then
    data:extend({
        {
            type = "recipe",
            name = "differential-girdlespring",
            category = "advanced-crafting",
            subgroup = "intermediate-product",
            ingredients = {
                {type="item", name="spring", amount=8},
                {type="item", name="rubber", amount=8},
                {type="item", name="iron-gear-wheel", amount=3},
                {type="item", name="steel-plate", amount=1}
            },
            results = {
                {type="item", name="differential-girdlespring", amount=1}
            },
            energy_required = 8,
            lasermill_dlc = {helium = -1},
            allow_productivity = true,
            enabled = false
        }
    })
end

if mods["space-age"] then
    data:extend({
        {
            type = "recipe",
            name = "growth-serum",
            category = "organic",
            subgroup = "brimstuff-botany",
            order = "az",
            ingredients = {
                {type="item", name="bioflux", amount=2},
                {type="item", name="toluene", amount=2},
                {type="item", name="nutrients", amount=20},
                {type="fluid", name="fertilizer-slurry", amount=200},
            },
            results = {
                {type="fluid", name="growth-serum", amount=100},
                {type="fluid", name="chemical-waste", amount=100}
            },
            auto_recycle = false,
            main_product = "growth-serum",
            energy_required = 3,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0.5, 0, 0.5, 1},
                secondary = {1, 0, 1, 1},
                tertiary = {0, 0, 0, 1},
                quaternary = {1, 0, 1, 1}
            }
        }
    })

    if data.raw.item["philosophers-hormone"] then
        rm.ReplaceIngredientProportional("growth-serum", "bioflux", "philosophers-hormone", 2)
        if data.raw.item["mutagenic-sludge"] then
            rm.AddProduct("growth-serum", {type="item", name="mutagenic-sludge", amount=1, probability=0.02})
            rm.AddProduct("metalcelium-spore", {type="item", name="mutagenic-sludge", amount=1, probability=0.02})
        end
    end

    rm.ReplaceIngredientProportional("yumako-hydroponics", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("jellynut-hydroponics", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("metalcelium-spore", "fertilizer-slurry", "growth-serum", 0.333)
    
    rm.ReplaceIngredientProportional("carbofungus-pyroponics", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("metalcelium-pyroponics", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("metalcelium-electroponics", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("metalcelium-electroponics-with-scrap", "fertilizer-slurry", "growth-serum", 0.1)
    rm.ReplaceIngredientProportional("tungstool-crossbreeding", "fertilizer-slurry", "growth-serum", 0.1)

    if mods["IfNickelMk2"] then
        data:extend({
            {
                type = "recipe",
                name = "sludge-synthesis",
                category = "organic",
                icon = "__BrimStuffMk2__/graphics/icons/sludge-synthesis.png",
                icon_size = 64,
                subgroup = "original-dint",
                order = "w",
                ingredients = {
                    {type="fluid", name="chemical-waste", amount=5000, fluidbox_multiplier=10},
                    {type="item", name="stem-cells", amount=10},
                    {type="fluid", name="growth-serum", amount=250}
                },
                results = {
                    {type="item", name="mutagenic-sludge", amount=1}
                },
                auto_recycle = false,
                energy_required = 8,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {0.5, 0, 1, 1},
                    secondary = {0.5, 0, 1, 1},
                    tertiary = {0, 0, 0, 1},
                    quaternary = {1, 0, 1, 1}
                }
            },
            {
                type = "recipe",
                name = "toxin-extraction",
                category = "organic",
                icon = "__BrimStuffMk2__/graphics/icons/toxin-extraction.png",
                icon_size = 64,
                subgroup = "original-dint",
                order = "x",
                ingredients = {
                    {type="item", name="mutagenic-sludge", amount=1, ignored_by_stats=1}
                },
                results = {
                    {type="item", name="mutagenic-sludge", amount=1, probability=0.66, ignored_by_stats=1, ignored_by_productivity=1},
                    {type="fluid", name="chemical-waste", amount=150},
                    {type="item", name="toluene", amount=1, probability=0.33},
                    {type="item", name="sulfur", amount=1, probability=0.33}
                },
                auto_recycle = false,
                energy_required = 8,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {0.5, 0, 1, 1},
                    secondary = {0.5, 0, 1, 1},
                    tertiary = {0, 0, 0, 1},
                    quaternary = {1, 0, 1, 1}
                }
            }
        })
    end
end