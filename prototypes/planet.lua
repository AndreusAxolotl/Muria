require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local asteroid_util = require("prototypes.asteroid-spawn-definitions")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

data:extend(
{
    {
    type = "autoplace-control",
    name = "chlorine_salts",
    localised_name = {"", "[entity=chlorine-salt-deposit] ", {"entity-name.chlorine-salt-deposit"}},
    richness = true,
    order = "z-a",
    category = "resource"
  },
      {
    type = "noise-expression",
    name = "muria_chlorine_salts_size",
    expression = "slider_rescale(control:chlorine_salts:size, 2)"
  },
  {
    type = "noise-expression",
    name = "muria_chlorine_salts_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(muria_starting_chlorine_salts,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_non_metal_spots(749, 12, 1,\z
                                                         muria_chlorine_salts_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                         control:chlorine_salts:frequency,\z
                                                         vulcanus_mountains_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "muria_chlorine_salts_probability",
    expression = "(control:chlorine_salts:size > 0) * (1000 * ((1 + muria_chlorine_salts_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "muria_chlorine_salts_richness",
    expression = "muria_chlorine_salts_region * random_penalty_between(0.9, 1, 1)\z
                  * 24000 * vulcanus_starting_area_multiplier\z
                  * control:chlorine_salts:richness / muria_chlorine_salts_size"
  },
})

planet_map_gen.muria = function()
  return
  {
    property_expression_names =
    {
      elevation = "gleba_elevation",
      aux = "gleba_aux",
      moisture = "gleba_moisture",
      temperature = "gleba_temperature",
      cliffiness = "gleba_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:chlorine_salts:probability"] = "muria_chlorine_salts_probability",
      ["entity:chlorine_salts:richness"] = "muria_chlorine_salts_richness",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
    autoplace_controls =
    {
      ["chlorine_salts"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          
          ["muriatic-soil-dark"] = {},
          ["muriatic-soil-light"] = {},
          ["muriatic-folds"] = {},
          ["muriatic-folds-flat"] = {},
          ["acidophile-lichen"] = {},
          ["muriatic-solution"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["tiny-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["chlorine-salt-deposit"] = {},
          ["big-chloric-rock"] = {},
          ["metallic-lichen-colony"] = {},
          ["eschatotaxite"] = {}
        }
      }
    }
  }
end

data:extend{
  {
        type = "surface-property",
        name = "atmospheric-acidity",
        default_value = 10,
    },
  {
    type = "planet",
    name = "muria",
    icon = "__Muria-Graphics__/graphics/icons/muria.png",
    starmap_icon = "__Muria-Graphics__/graphics/icons/starmap-planet-muria.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 32,
    orientation = 0.14,
    magnitude = 1.0,
    label_orientation = 0.18,
    order = "g",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.muria(),
    pollutant_type = "acids",
    solar_power_in_space = 70,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_gleba, 
    surface_properties =
    {
      ["day-night-cycle"] = 5 * minute,
      ["magnetic-field"] = 30,
      pressure = 2180,
      ["solar-power"] = 25,
      gravity = 9,
    },
    surface_render_parameters=
    {
      fog =
      {
        fog_type = "gleba",
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {255, 217, 139, 1.0},
        color2 = {183, 255, 169, 1.0},
        tick_factor = 0.000001,
      },
       clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
        {0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
        {0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
        {0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
        {0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
        {0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
        {0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
        {0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.2, 0.4, 0.3, 0.15 },
        scale_u = { 1.85, 1.85, 1.85, 1.85 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.5,
        global_scale = 0.4,
        zoom_factor = 3.8,
        zoom_intensity = 0.75
      }
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_muria, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience =
      {
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
      },
      wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.2},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound =
            {
              filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
              advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
            }
        },
      }
    },
    entities_require_heating = false,
    player_effects =
    { 
      type = "cluster",
      cluster_count = 10,
      distance = 8,
      distance_deviation = 8,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "gleba-raindrops",
          speed = {-0.05, 0.5},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.05,
          starting_frame = 2,
          starting_frame_deviation = 2,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    ticks_between_player_effects = 1
  },
  {
    type = "space-connection",
    name = "gleba-muria",
    subgroup = "planet-connections",
    from = "gleba",
    to = "muria",
    order = "g1",
    length = 25000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_muria)
  },
  {
    type = "space-connection",
    name = "muria-aquilo",
    subgroup = "planet-connections",
    from = "muria",
    to = "aquilo",
    order = "g2",
    length = 50000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_muria)
  },
  }