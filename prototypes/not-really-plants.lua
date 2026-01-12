local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local plant_emissions = { acids = 0 } -- pollution while plant is out
local plant_harvest_emissions = { acids = 30 } -- pollution when plant is harvested
local plant_anti_emissions = { acids = -0.0075 } -- pollution while plant is out
local plant_harvest_anti_emissions = { acids = 0 } -- pollution when plant is harvested
local plant_flags = {"placeable-neutral", "placeable-off-grid"}

local novotaxite_pictures = {
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_00",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_00",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_01",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_01",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_02",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_02",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_03",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_03",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_04",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_04",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_05",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_05",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_06",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_06",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_07",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_07",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_08",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_08",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_09",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_09",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_10",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_10",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_11",{ scale = 0.5, tint = {158, 117, 33},}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_11",{ scale = 0.5, draw_as_shadow = true}),
    }
  }
}

data:extend({
  {
  type = "trivial-smoke",
  name = "lichen-acid-cloud",
  duration = 300,
  fade_in_duration = 2,
  fade_away_duration = 298,
  spread_duration = 3,
  start_scale = 0.2,
  end_scale = 1,
  color = data.raw["airborne-pollutant"]["acids"].chart_color,
  cyclic = true,
  affected_by_wind = false,
  render_layer = "object-under",
  movement_slow_down_factor = 1,
  animation =
  {
    width = 152,
    height = 120,
    line_length = 5,
    frame_count = 60,
    shift = {-0.53125, -0.4375},
    priority = "high",
    animation_speed = 0.25,
    filename = "__base__/graphics/entity/smoke/smoke.png",
    flags = { "smoke" }
  }
},
    {
        type = "plant",
        name = "metallic-lichen-colony",
        icon = "__space-age__/graphics/icons/iron-stromatolite.png",
        flags = plant_flags,
        minable =
        {
            mining_time = 0.5,
            results = {
                {type = "item", name = "acidophile-lichen", amount_min = 0, amount_max = 3},
                {type = "item", name = "iron-ore", amount_min = 2, amount_max = 7},
                {type = "item", name = "copper-ore", amount_min = 2, amount_max = 7},
            }
        },
        growth_ticks = 0.5 * minute, -- growth time in ticks, 60 ticks = 1 second
        harvest_emissions = plant_harvest_emissions,
        emissions_per_second = plant_emissions,
        max_health = 50,
        collision_box = {{-0.5, -0.5}, {0.5, 0.5}}, -- change this to fit your texture
        --collision_mask = {layers={player=true, ground_tile=true, train=true}},
        selection_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- change this to fit your texture
        --drawing_box_vertical_extension = 0.8,
        subgroup = "trees", -- can be what ever
        order = "salts", -- can be what ever
        impact_category = "stone", -- can be what ever
        damaged_trigger_effect = hit_effects.rock(),
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        mined_sound = base_sounds.deconstruct_bricks(1.0),
        pictures =
    {
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        tint = {255, 216, 132},
        scale = 0.4,
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.30625, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        tint = {255, 216, 132},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        tint = {255, 216, 132},
        scale = 0.4
      }
    },
    water_reflection =
    {
      pictures =
        {
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01-effect-map.png",
            width = 96,
            height = 92,
            shift = {0.304688, -0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02-effect-map.png",
            width = 78,
            height = 92,
            shift = {0.0, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03-effect-map.png",
            width = 70,
            height = 91,
            shift = {0.151562, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04-effect-map.png",
            width = 88,
            height = 94,
            shift = {0.390625, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.328125, 0.0703125},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.16875, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07-effect-map.png",
            width = 94,
            height = 93,
            shift = {0.3, 0.0},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.0, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09-effect-map.png",
            width = 79,
            height = 93,
            shift = {0.1, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10-effect-map.png",
            width = 93,
            height = 93,
            shift = {0.325, -0.1},
            scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11-effect-map.png",
            width = 95,
            height = 93,
            shift = {0.453125, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12-effect-map.png",
            width = 92,
            height = 92,
            shift = {0.3, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13-effect-map.png",
            width = 76,
            height = 93,
            shift = {0.0703125, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.160938, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15-effect-map.png",
            width = 101,
            height = 92,
            shift = {0.242188, -0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16-effect-map.png",
            width = 88,
            height = 92,
            shift = {0.1, -0.1},
          scale = 0.8
          }
        }
    },
        agricultural_tower_tint =
        {
            primary = {255, 216, 132},
            secondary = {255, 216, 132},
        },
        autoplace = {
        --probability_expression = 0.003,
        probability_expression = 0.01,
        richness_expression = 1,
        peaks = {
            { influence = 0.2, tile_restriction = {"artificial-lichen-colony", "acidophile-lichen"}  },
        },
        tile_restriction = {"artificial-lichen-colony", "acidophile-lichen"} ,
        surface_conditions = {
            { property = "pressure", min = 2180, max = 2180 },
        },
      },
        map_color = {255, 216, 132}, -- can be what ever
    },
    {
        type = "plant",
        name = "cotunnite-lichen-colony",
        icon = "__space-age__/graphics/icons/copper-stromatolite.png",
        flags = plant_flags,
        minable =
        {
            mining_time = 0.5,
            results = {
                {type = "item", name = "acidophile-lichen", amount_min = 0, amount_max = 1},
                {type = "item", name = "lead", amount_min = 1, amount_max = 5},
            }
        },
        growth_ticks = 2 * minute, -- growth time in ticks, 60 ticks = 1 second
        harvest_emissions = plant_harvest_emissions,
        emissions_per_second = plant_emissions,
        max_health = 50,
        collision_box = {{-0.5, -0.5}, {0.5, 0.5}}, -- change this to fit your texture
        --collision_mask = {layers={player=true, ground_tile=true, train=true}},
        selection_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- change this to fit your texture
        --drawing_box_vertical_extension = 0.8,
        subgroup = "trees", -- can be what ever
        order = "salts", -- can be what ever
        impact_category = "stone", -- can be what ever
        damaged_trigger_effect = hit_effects.rock(),
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        mined_sound = base_sounds.deconstruct_bricks(1.0),
        pictures =
    {
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.390625, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        tint = {196, 137, 255},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        tint = {196, 137, 255},
        scale = 0.4
      }
    },
    water_reflection =
      {
        pictures =
          {
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01-effect-map.png",
              width = 96,
              height = 92,
              shift = {0.304688, -0.3},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02-effect-map.png",
              width = 78,
              height = 92,
              shift = {0.0, 0.3},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03-effect-map.png",
              width = 70,
              height = 91,
              shift = {0.151562, 0.1},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04-effect-map.png",
              width = 88,
              height = 94,
              shift = {0.30625, 0.3},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05-effect-map.png",
              width = 77,
              height = 92,
              shift = {0.328125, 0.0703125},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06-effect-map.png",
              width = 77,
              height = 92,
              shift = {0.16875, 0.1},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07-effect-map.png",
              width = 94,
              height = 93,
              shift = {0.3, 0.0},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08-effect-map.png",
              width = 63,
              height = 93,
              shift = {0.0, 0.2},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09-effect-map.png",
              width = 79,
              height = 93,
              shift = {0.1, 0.2},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10-effect-map.png",
              width = 93,
              height = 93,
              shift = {0.325, -0.1},
              scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11-effect-map.png",
              width = 95,
              height = 93,
              shift = {0.453125, 0.2},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12-effect-map.png",
              width = 92,
              height = 92,
              shift = {0.3, 0.1},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13-effect-map.png",
              width = 76,
              height = 93,
              shift = {0.0703125, 0.3},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14-effect-map.png",
              width = 63,
              height = 93,
              shift = {0.160938, 0.2},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15-effect-map.png",
              width = 101,
              height = 92,
              shift = {0.242188, -0.1},
            scale = 0.8
            },
            {
              filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16-effect-map.png",
              width = 88,
              height = 92,
              shift = {0.1, -0.1},
            scale = 0.8
            }
          }
      },
        agricultural_tower_tint =
        {
            primary = {196, 137, 255},
            secondary = {196, 137, 255},
        },
         autoplace =
        {
            probability_expression = 0,
            tile_restriction = {"artificial-lichen-colony", "acidophile-lichen"},  -- change this to set what tiles it can be placed on
            surface_conditions = {
            { property = "pressure", min = 2180, max = 2180 },
        },},
        map_color = {196, 137, 255}, -- can be what ever
    },
    {
        type = "plant",
        name = "eschatotaxite",
        icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
        flags = plant_flags,
        minable =
        {
            mining_time = 0.5,
            results = {
                {type = "item", name = "eschatotaxite-sprout", amount_min = 1, amount_max = 2},
                {type = "item", name = "carbon", amount_min = 0, amount_max = 3},
                {type = "item", name = "spoilage", amount_min = 1, amount_max = 5},
                {type = "item", name = "sulfur", amount_min = 0, amount_max = 2},
            }
        },
        growth_ticks = 0.75 * minute, -- growth time in ticks, 60 ticks = 1 second
        harvest_emissions = plant_harvest_anti_emissions,
        emissions_per_second = plant_anti_emissions,
        mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
        mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
        max_health = 50,
        collision_box = {{-0.5, -0.6}, {0.5, 0.4}}, -- change this to fit your texture
        --collision_mask = {layers={player=true, ground_tile=true, train=true}},
        selection_box = {{-0.9, -2.4}, {0.9, 0.3}}, -- change this to fit your texture
        --drawing_box_vertical_extension = 0.8,
        subgroup = "trees", -- can be what ever
        order = "salts", -- can be what ever
        impact_category = "tree", -- can be what ever
        pictures = novotaxite_pictures,
        agricultural_tower_tint =
        {
            primary = {158, 117, 33},
            secondary = {158, 117, 33},
        },
        autoplace = {
        --probability_expression = 0.003,
        probability_expression = 0.01,
        richness_expression = 1,
        peaks = {
            { influence = 0.2, tile_restriction = {"muriatic-folds-flat", "muriatic-folds", "muriatic-soil-light", "muriatic-soil-dark"}  },
        },
        tile_restriction = {"muriatic-folds-flat", "muriatic-folds", "muriatic-soil-light", "muriatic-soil-dark"} ,
        surface_conditions = {
            { property = "pressure", min = 2180, max = 2180 },
        },
      },
        map_color = {158, 117, 33}, -- can be what ever
    },
    {
        type = "plant",
        name = "holmium-lichen-colony",
        icon = "__space-age__/graphics/icons/iron-stromatolite.png",
        flags = plant_flags,
        minable =
        {
            mining_time = 0.5,
            results = {
                {type = "item", name = "acidophile-lichen", amount_min = 1, amount_max = 2},
                {type = "item", name = "holmium-ore", amount_min = 1, amount_max = 5},
            }
        },
        growth_ticks = 2 * minute, -- growth time in ticks, 60 ticks = 1 second
        harvest_emissions = nil,
        emissions_per_second = nil,
        max_health = 50,
        collision_box = {{-0.5, -0.5}, {0.5, 0.5}}, -- change this to fit your texture
        --collision_mask = {layers={player=true, ground_tile=true, train=true}},
        selection_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- change this to fit your texture
        --drawing_box_vertical_extension = 0.8,
        subgroup = "trees", -- can be what ever
        order = "salts", -- can be what ever
        impact_category = "stone", -- can be what ever
        damaged_trigger_effect = hit_effects.rock(),
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        mined_sound = base_sounds.deconstruct_bricks(1.0),
        pictures =
    {
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        tint = {255, 140, 144},
        scale = 0.4,
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.30625, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        tint = {255, 140, 144},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        tint = {255, 140, 144},
        scale = 0.4
      }
    },
    water_reflection =
    {
      pictures =
        {
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01-effect-map.png",
            width = 96,
            height = 92,
            shift = {0.304688, -0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02-effect-map.png",
            width = 78,
            height = 92,
            shift = {0.0, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03-effect-map.png",
            width = 70,
            height = 91,
            shift = {0.151562, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04-effect-map.png",
            width = 88,
            height = 94,
            shift = {0.390625, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.328125, 0.0703125},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.16875, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07-effect-map.png",
            width = 94,
            height = 93,
            shift = {0.3, 0.0},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.0, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09-effect-map.png",
            width = 79,
            height = 93,
            shift = {0.1, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10-effect-map.png",
            width = 93,
            height = 93,
            shift = {0.325, -0.1},
            scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11-effect-map.png",
            width = 95,
            height = 93,
            shift = {0.453125, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12-effect-map.png",
            width = 92,
            height = 92,
            shift = {0.3, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13-effect-map.png",
            width = 76,
            height = 93,
            shift = {0.0703125, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.160938, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15-effect-map.png",
            width = 101,
            height = 92,
            shift = {0.242188, -0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16-effect-map.png",
            width = 88,
            height = 92,
            shift = {0.1, -0.1},
          scale = 0.8
          }
        }
    },
        agricultural_tower_tint =
        {
            primary = {255, 140, 144},
            secondary = {255, 140, 144},
        },
        autoplace = {
        probability_expression = 0,
        richness_expression = 0,
        peaks = {
            { influence = 0, tile_restriction = {"artificial-lichen-colony"}  },
        },
        tile_restriction = {"artificial-lichen-colony"} ,
        surface_conditions = {
            { property = "magnetic-field", min = 99, max = 99 },
        },
      },
        map_color = {255, 140, 144}, -- can be what ever
    },
})