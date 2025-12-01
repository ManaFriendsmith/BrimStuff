local util = require("util")
local item_sounds = require("__base__/prototypes/item_sounds")

if not (settings.startup["brimstuff-greenhouse"].value or mods["space-age"]) then
  return
end

local gh = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])

gh.name = "brimstuff-greenhouse"
gh.order = "ca"
gh.icon = "__BrimStuffMk2__/graphics/icons/brimstuff-greenhouse.png"
gh.icon_size = 64
gh.icon_mipmaps = 4
gh.remnants = "lab_remnants"
gh.next_upgrade = nil
gh.fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = {{ flow_direction="input", position = {0, -1}, direction = defines.direction.north }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = {{ flow_direction="output", position = {0, 1}, direction = defines.direction.south }},
    secondary_draw_orders = { north = -1 }
  }
}

if mods["space-age"] then
  gh.surface_conditions = {
    {
      property = "pressure",
      min = 1
    }
  }
end

if not (mods["LunarLandings"] or mods["space-age"]) then
  gh.fixed_recipe="brimstuff-wood-growth"
end

gh.minable.result="brimstuff-greenhouse"
gh.crafting_categories={"brimstuff-botany"}
gh.graphics_set.animation = {
      layers =
      {
        {
          filename = "__BrimStuffMk2__/graphics/entity/greenhouse2.png",
          width = 194,
          height = 174,
          frame_count = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 242,
          height = 162,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 15.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 242,
          height = 136,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(13, 11),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }

local blah = {
  fadeout = true,
  animation = {
    filename = "__BrimStuffMk2__/graphics/entity/greenhouse2.png",
    width = 194,
    height = 174,
    frame_count = 33,
    line_length = 11,
    animation_speed = 1 / 3,
    shift = util.by_pixel(0, 1.5),
    scale = 0.5
  }
}

gh.graphics_set.working_visualisations = {
  {
    fadeout = true,
    apply_recipe_tint = "primary",
    animation = {
      filename = "__BrimStuffMk2__/graphics/entity/greenhouse-light2.png",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 216,
      height = 194,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    }
  }
}

gh.working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/particles/tree-leaves-1.ogg",
          volume = 0.7
        },
        {
          filename = "__base__/sound/particles/tree-leaves-2.ogg",
          volume = 0.7
        },
        {
          filename = "__base__/sound/particles/tree-leaves-3.ogg",
          volume = 0.7
        },
        {
          filename = "__base__/sound/particles/tree-leaves-4.ogg",
          volume = 0.7
        }
      },
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }

gh.crafting_speed = 1
gh.module_slots = 2
gh.allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
gh.energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution=-1}
    }
gh.energy_usage = "30kW"

if mods["space-age"] then
  gh.energy_source.emissions_per_minute["spores"] = 1
end

data:extend({
  {
    type = "recipe-category",
    name = "brimstuff-botany",
    can_recycle = false
  },
  gh,
  {
    type = "fluid",
    name = "fertilizer-slurry",
    icon = "__BrimStuffMk2__/graphics/icons/fertilizer-slurry.png",
    icon_size = 64,
    subgroup = "fluid",
    order = "q",
    default_temperature = 25,
    max_temperature = 25,
    base_color = {r=0, g=0.6, b=0.2, a=1},
    flow_color = {r=0, g=1, b=0, a=1}
  },
  {
    type = "item",
    name = "brimstuff-greenhouse",
    icon = "__BrimStuffMk2__/graphics/icons/brimstuff-greenhouse.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = mods["space-age"] and "agriculture" or "production-machine",
    place_result = "brimstuff-greenhouse",
    order = mods["space-age"] and "a" or "cz",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 50,
    weight = 20 * kg
  },
  {
    type = "recipe",
    name = "brimstuff-greenhouse",
    category = mods["Age-of-Production"] and "woodworking-or-crafting" or (mods["space-age"] and "organic-or-hand-crafting" or "crafting"),
    subgroup = "production-machine",
    energy_required = 1,
    results = {
      {type="item", name="brimstuff-greenhouse", amount=1}
    },
    enabled = false,
    ingredients = {
      {type="item", name="stone-brick", amount=5},
      {type="item", name="pipe", amount=5},
      {type="item", name="iron-stick", amount=16},
    }
  },
  {
    type = "item-subgroup",
    name = "brimstuff-botany",
    group = "intermediate-products",
    order = "ca"
  },
  {
    type = "recipe",
    name = "brimstuff-wood-growth",
    category = "brimstuff-botany",
    subgroup = "brimstuff-botany",
    order = "b",
    energy_required = 2,
    results = {
      {type="item", name="wood", amount=1}
    },
    ingredients = {
      {type="fluid", name="fertilizer-slurry", amount=5}
    },
    enabled = false,
    allow_productivity = true,
    surface_conditions = mods["space-age"] and {
      {
        property = "pressure",
        min = 1000,
        max = 2000
      } or nil
    },
    crafting_machine_tint = {
      primary = {0, 1, 0, 1}
    }
  },
  {
    type = "recipe",
    name = "fertilizer-slurry",
    subgroup = "brimstuff-botany",
    order = "a",
    category = mods["space-age"] and "organic-or-basic-chemistry" or "basic-chemistry",
    energy_required = 1,
    results = {
      {type="fluid", name="fertilizer-slurry", amount=100}
    },
    ingredients = {
      {type="fluid", name="nitric-acid", amount=25},
      {type="item", name="wood", amount=1},
      {type="item", name="potassium-nitrate", amount=1}
    },
    enabled = false,
    allow_productivity = true,
    crafting_machine_tint = {
      primary = {0, 0.6, 0.2, 1},
      secondary = {0, 1, 0, 1},
      tertiary = {0, 0.6, 0.2, 1},
      quaternary = {0, 1, 0, 1}
    }
  },
  {
      type = "technology",
      name = "brimstuff-greenhouse",
      icons = {
        {
          icon = "__BrimStuffMk2__/graphics/icons/brimstuff-greenhouse.png",
          icon_size = 64,
          icon_mipmaps = 4
        }
       },
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "brimstuff-greenhouse"
        },
        {
          type = "unlock-recipe",
          recipe = "fertilizer-slurry"
        },
        {
          type = "unlock-recipe",
          recipe = "brimstuff-wood-growth"
        }
      },
      prerequisites = {"automation", "basic-chemistry"},
      unit = {
        count = 30,
        ingredients = {
          { "automation-science-pack", 1 }
        },
        time = 15,
      }
  }
})

if mods["LunarLandings"] then
  data:extend({
    {
      type = "recipe",
      name = "brimstuff-oxygen",
      category = "brimstuff-botany",
      subgroup = "brimstuff-botany",
      order = "ab",
      energy_required = 2,
      results = {
        {type="fluid", name="ll-oxygen", amount=30}
      },
      enabled = false,
      ingredients = {{type="fluid", name="fertilizer-slurry", amount=5}},
    },
  })
end