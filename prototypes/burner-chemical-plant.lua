local util = require("util")
local item_sounds = require("__base__/prototypes/item_sounds")

data:extend({
  {
    type = "recipe-category",
    name = "basic-chemistry",
    can_recycle = false
  }
})

if mods["bzgas"] and not settings.startup["brimstuff-clobber-bz-chemical-plant"].value then
  data.raw["assembling-machine"]["basic-chemical-plant"].crafting_categories = {"basic-chemistry"}
  return
end

local bcp_icon = {
  {
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 64, icon_mipmaps = 4,
    tint = {0.5, 0.5, 0.5, 1}
  },
  {
    icon = "__core__/graphics/arrows/heat-exchange-indication.png",
    icon_size = 48, icon_mipmaps = 4,
    scale = 0.5,
    shift = {6, 6}
  }
}

local bcp = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])

bcp.name = "basic-chemical-plant"
bcp.order = "dz"
bcp.icon = nil
bcp.icons = bcp_icon
bcp.fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = assembler3pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = {{ flow_direction="input", position = {0, -1}, direction = defines.direction.north }},
    secondary_draw_orders = { north = -1, west = -1 }
  },
  {
    production_type = "output",
    pipe_picture = assembler3pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = {{ flow_direction="output", position = {0, 1}, direction = defines.direction.south }},
    secondary_draw_orders = { north = -1, west = -1 }
  }
}

bcp.minable.result="basic-chemical-plant"
bcp.crafting_categories={"basic-chemistry"}

bcp.graphics_set.animation = {
  layers =
  {
    {
      filename = "__BrimStuffMk2__/graphics/entity/burnerchem.png",
      priority = "high",
      width = 116,
      height = 93,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(10.5, 3)
    },
    {
      filename = "__BrimStuffMk2__/graphics/entity/burnerchem_shadow.png",
      priority = "high",
      width = 116,
      height = 93,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(10.5, 3),
      draw_as_shadow = true
    },
    {
      filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
      priority="high",
      x = 62,
      y = 112,
      width = 54,
      height = 28,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(-1.5, 12.9),
      tint = {0.5,0.5,0.5,1},
      scale = 0.5
    }
  }
}

local wv = util.table.deepcopy(data.raw.furnace["steel-furnace"].graphics_set.working_visualisations)
--lua y u no have plus equals
wv[1].animation.shift[1] = wv[1].animation.shift[1] - 1/16
wv[1].animation.shift[2] = wv[1].animation.shift[2] - 1/4
wv[1].animation.animation_speed = 2

wv[2].animation.shift[1] = wv[2].animation.shift[1] - 1/16
wv[2].animation.shift[2] = wv[2].animation.shift[2] - 1/4

wv[4].animation.shift[1] = wv[4].animation.shift[1] - 1/16
wv[4].animation.shift[2] = wv[4].animation.shift[2] - 1/4

wv[5] = {
      apply_recipe_tint = "tertiary",
      fadeout = true,
      constant_speed = true,
      render_layer = "wires",
      animation =
      {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -75),
          scale = 0.5
      }
    }

wv[6] = {
        apply_recipe_tint = "quaternary",
        fadeout = true,
        constant_speed = true,
        render_layer = "wires",
        animation =
        {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -49),
            scale = 0.5
        }
      }

table.remove(wv, 3)

bcp.graphics_set.working_visualisations = wv

bcp.crafting_speed = 0.5
bcp.module_slots = 0
bcp.allowed_effects = nil
bcp.energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      emissions_per_minute = { pollution = 5 },
      fuel_inventory_size = 1,
      light_flicker = {color = {0,0,0}},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 9,
          position = {0, 0.2}
        }
      }
    }
bcp.energy_usage = "180kW"
bcp.ll_surface_conditions = {nauvis=true, luna={plain=false, lowland=false, mountain=false, foundation=true}}

if mods["space-age"] then
  bcp.surface_conditions = {
    {
      property = "pressure",
      min = 1
    }
  }
end

--razorgrass ash
if mods["bzsilicon"] and mods["space-age"] then
  bcp.energy_source.burnt_inventory_size = 1
end

data:extend({
  bcp,
  {
    type = "item",
    name = "basic-chemical-plant",
    icons = bcp_icon,
    subgroup = "production-machine",
    place_result = "basic-chemical-plant",
    order = "dz",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    stack_size = 10,
    weight = 20 * kg
  },
  {
    type = "recipe",
    name = "basic-chemical-plant",
    category = "crafting",
    energy_required = 1,
    results = {
      {type="item", name="basic-chemical-plant", amount=1}
    },
    enabled = false,
    ingredients = {
      {type="item", name="iron-plate", amount=5},
      {type="item", name="iron-gear-wheel", amount=5},
      {type="item", name="pipe", amount=5}
    }
  }
})
