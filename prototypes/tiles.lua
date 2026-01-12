local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

local aquilo_tile_offset_frozen = 50
local aquilo_tile_offset_thawed = 60

local smooth_ice_vehicle_speed_modifier = 1
local ice_vehicle_speed_modifier = 1.4
local snow_vehicle_speed_modifier = 1.8

local function lerp_color_no_alpha(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3])
  }
end
local tile_pollution =
{
  muria =      { acids   = 0.0000035  },
  muriatic_soil =      { acids   = 0.00065 },
  muria_water = { acids    = 0.0000035 },
}


require("__space-age__/prototypes/tile/tiles-aquilo")
require("__space-age__/prototypes/tile/tiles-vulcanus")
require("__space-age__/prototypes/tile/tiles-gleba")

local lava_patch =
{
  filename = "__space-age__/graphics/terrain/water-transitions/lava-patch.png",
  scale = 0.5,
  width = 64,
  height = 64
}

local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local lava_stone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = lava_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = lava_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local lava_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,
  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.005,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

local destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke",
      offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
      starting_frame_deviation = 5
    }
  }
}

space_age_tiles_util.lava_to_out_of_map_transition = lava_to_out_of_map_transition
space_age_tiles_util.lava_stone_transitions_between_transitions = lava_stone_transitions_between_transitions

table.insert(water_tile_type_names, "muriatic-solution")

local artificial_lichen_colony = table.deepcopy(data.raw.tile["artificial-yumako-soil"])
artificial_lichen_colony.name = "artificial-lichen-colony"
artificial_lichen_colony.order = "e[lichen]-b"
artificial_lichen_colony.subgroup = "gleba-tiles"
artificial_lichen_colony.absorptions_per_second = tile_pollution.muria
artificial_lichen_colony.variants = tile_variations_template_with_transitions_and_effect_map(
          "__space-age__/graphics/terrain/gleba/cracked-lichen.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        )
--rtificial_lichen_colony.transitions = lava_stone_transitions
--artificial_lichen_colony.transitions_between_transitions = lava_stone_transitions_between_transitions
artificial_lichen_colony.walking_sound = tile_sounds.walking.soft_bark
artificial_lichen_colony.landing_steps_sound = tile_sounds.landing.bark
artificial_lichen_colony.map_color={81, 77, 44}
artificial_lichen_colony.walking_speed_modifier = 1
artificial_lichen_colony.vehicle_friction_modifier = 1

local acidophile_lichen = table.deepcopy(data.raw.tile["midland-cracked-lichen-dull"])
acidophile_lichen.name = "acidophile-lichen"
acidophile_lichen.order = "e[lichen]-a"
acidophile_lichen.subgroup = "gleba-tiles"
acidophile_lichen.absorptions_per_second = tile_pollution.muria

data:extend({
  artificial_lichen_colony})

data:extend({
  acidophile_lichen})

data:extend(
  {{
    type = "tile",
    name = "muriatic-solution",
    order = "a[muria-water]-a[muriatic-solution]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-grey",
    effect_color = {105, 210, 91},
    effect_color_secondary = { 63, 202, 34 },
    map_color = {105, 210, 91},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 3,
    absorptions_per_second = tile_pollution.muria_water,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer_group = "water",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1,
          tint = {105, 210, 91}
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "foundation",
    fluid = "muriatic-solution",
  }})

local function add_landfillable_stuff(landfill_name, new_surface)
  local item = data.raw.item[landfill_name]
  item.place_as_tile.tile_condition = item.place_as_tile.tile_condition or {}
  table.insert(item.place_as_tile.tile_condition, new_surface)
end
add_landfillable_stuff("foundation", "muriatic-solution")

local muriatic_soil_dark = table.deepcopy(data.raw.tile["volcanic-soil-dark"])
local muriatic_soil_light = table.deepcopy(data.raw.tile["volcanic-soil-light"])
local muriatic_folds = table.deepcopy(data.raw.tile["volcanic-folds"])
local muriatic_folds_flat = table.deepcopy(data.raw.tile["volcanic-folds-flat"])

muriatic_soil_dark.name = "muriatic-soil-dark"
muriatic_soil_light.name = "muriatic-soil-light"
muriatic_folds.name = "muriatic-folds"
muriatic_folds_flat.name = "muriatic-folds-flat"
muriatic_soil_dark.absorptions_per_second = tile_pollution.muriatic_soil
muriatic_soil_light.absorptions_per_second = tile_pollution.muriatic_soil
muriatic_folds.absorptions_per_second = tile_pollution.muriatic_soil
muriatic_folds_flat.absorptions_per_second = tile_pollution.muriatic_soil

data:extend({
  muriatic_soil_dark})
data:extend({
  muriatic_soil_light})
data:extend({
  muriatic_folds})
data:extend({
  muriatic_folds_flat})
