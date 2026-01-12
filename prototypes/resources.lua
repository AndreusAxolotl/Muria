local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
require ("util")
require("__base__/prototypes/entity/pipecovers")
require ("circuit-connector-sprites")
require("__base__/prototypes/entity/assemblerpipes")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
local cargo_pod_procession_catalogue = require("__base__/prototypes/entity/cargo-pod-catalogue")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")

data:extend({
{
    type = "resource",
    name = "chlorine-salt-deposit",
    icon = "__Muria-Graphics__/graphics/icons/chlorine-salts.png",
    flags = {"placeable-neutral"},
    subgroup = "muria-acidworking",
    order = "c-b",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    walking_sound = tile_sounds.walking.ore,
    driving_sound = tile_sounds.driving.stone,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 0.66,
      result = "chlorine-salts",
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "chlorine_salts",
      order = "z",
      base_density = 1,
      base_spots_per_km2 = 10,
      has_starting_area_placement = true,
      random_spot_size_minimum = 5,
      random_spot_size_maximum = 20,
      regular_rq_factor_multiplier = 2
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/calcite/calcite.png",
        priority = "extra-high",
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      },
    },
    mining_visualisation_tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
    map_color = {r = 177/256, g = 168/256, b = 86/256, a = 1.000}
  }, 
  {
    name = "big-chloric-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "z",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 250,
    autoplace = {order = "a[rock]-a[huge]", probability_expression = "(aquilo_high_frequency_peaks - 1) * 0.05", tile_restriction = {"muriatic-folds-flat", "muriatic-folds", "muriatic-soil-light", "muriatic-soil-dark"}},
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "stone", amount_min = 1, amount_max = 5},
        {type = "item", name = "chlorine-salts", amount_min = 2, amount_max = 4},
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-01.png",
        width =  188 ,
        height =  127 ,
        shift = {0.304688, -0.4},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-09.png",
        width =  187 ,
        height =  120 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = {r = 177/256, g = 168/256, b = 86/256, a = 1.000},
      }
    }
  },
})