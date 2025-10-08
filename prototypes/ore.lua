local resource_autoplace = require("resource-autoplace")

local sulfur_sim = table.deepcopy(data.raw.resource["coal"].factoriopedia_simulation)
sulfur_sim.init = string.gsub(sulfur_sim.init, "coal", "sulfur")

data:extend({
  {
    type = "resource",
    name = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    order="a-b-y",
    tree_removal_probability = 0.9,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "sulfur-particle",
      mining_time = 1,
      result = "sulfur"
    },
    walking_sound = data.raw.resource["stone"].walking_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "sulfur",
      order = "a-b-e",
      base_density = 4,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.4,
      starting_rq_factor_multiplier = 0.9,
      richness_post_multiplier = 0.75,
      candidate_spot_count = 22
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__BrimStuff__/graphics/ore/sulfur-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = mods["bztin"] and {0.65, 1, 0.15} or {0.8, 1, 0.3},
    mining_visualisation_tint = {1, 1, 0.5},
    factoriopedia_simulation = sulfur_sim
  },
  {
    type = "autoplace-control",
    category = "resource",
    name = "sulfur",
    localised_name = {"", (mods["LunarLandings"] and "[virtual-signal=ll-nauvis] " or "") .. "[entity=sulfur] ", {"entity-name.sulfur"}},
    richness = true,
    order = "a-eb"
  }
})

data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["sulfur"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["sulfur"] = {}
