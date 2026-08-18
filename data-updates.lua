if data.raw["agricultural-tower"]["agricultural-tower"] and not data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds then
  data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds = {}
  for _, type in pairs({"item", "tool", "module", "capsule"}) do
    for _, seed in pairs(data.raw[type] or {}) do
      if seed.plant_result then
        --log(seed.name)
        if seed.name ~= "chlorine-salts" and seed.name ~= "cotunnite" and seed.name ~= "holmium-chloride" and seed.name ~= "eschatotaxite-sprout" then
          table.insert(data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds, seed.name)
        end
      end
    end
  end
end

require "compat.bzlead"
require "compat.scrubbing"

PlanetsLib.assign_rocket_part_recipe("muria", "muria-rocket-part", true)

data.raw.planet["muria"].platform_surface_render_parameters =
{
    shadow_opacity = 0.5,
    space_dust_background =
    {
        animation_speed = 1,
        noise_texture =
        {
            filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
            size = 4096,
            premul_alpha = false
        },
        asteroid_texture =
        {
            filename = "__space-age__/graphics/space/asteroidTexture.png",
            size = 1024
        },
        asteroid_normal_texture =
        {
            filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
            size = 1024
        },
    },
    space_dust_foreground =
    {
        animation_speed = 1,
        noise_texture =
        {
            filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
            size = 4096,
            premul_alpha = false
        },
        asteroid_texture =
        {
            filename = "__space-age__/graphics/space/asteroidTexture.png",
            size = 1024
        },
        asteroid_normal_texture =
        {
            filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
            size = 1024
        },
    },
    platform_backdrop =
    {
  atmosphere_color = {
    138,
    88,
    148,
    5,
  },
  atmosphere_ray_light_color_1 = {
    127.5,
    67.99575,
    0,
    255,
  },
  atmosphere_ray_light_color_2 = {
    25.5,
    21.49905,
    12.900450000000001,
    255,
  },
  atmosphere_thickness = 0,
  cloud_flow_intensity = 1,
  cloud_flow_seconds = 10,
  cloud_normal_intensity = 1,
  cloud_panning_rate = 0,
  cloud_vertical_offset = 0.037,
  cloudiness = 0.299,
  emission_scalar = 2,
  emission_scales_with_shadow = true,
  global_cloud = {
    filename = "__Muria-Graphics__/graphics/planet/muria-cloud.png",
    width = 2048,
    height = 1024,
  },
  global_cloud_flow = {
    filename = "__space-age__/graphics/space/aquilo-cloud-flow.png",
    width = 2048,
    height = 1024,
  },
  global_cloud_normal = {
    filename ="__space-age__/graphics/space/aquilo-cloud-normal.png",
    width = 2048,
    height = 1024,
  },
  light_color = {
    255,
    255,
    255,
    255,
  },
  light_direction = {
    -1,
    0,
    0.5,
  },
  light_intensity_contrast = 0.037,
  light_radius = 6,
  planet_axis = {
    -30,
    20,
  },
  planet_axis_deviation_amplitude = {
    0,
    0,
  },
  planet_axis_deviation_seconds = {
    609.2,
    712.7,
  },
  planet_normal = {
    filename = "__space-age__/graphics/space/nauvis-normal.png",
    width = 2048,
    height = 1024,
  },
  planet_reflectivity = {
    filename = "__space-age__/graphics/space/nauvis-reflectivity.png",
    width = 2048,
    height = 1024,
  },
  planet_surface = {
    filename = "__Muria-Graphics__/graphics/planet/muria.png",
    width = 2048,
    height = 1024,
  },
  radius = 400,
  rotation_seconds = 340,
  specular_color = {
    255,
    255,
    255,
    255,
  },
  specular_intensity = 1,
  surface_normal_intensity = 0.1,
  surface_vertical_offset = 0.099,
}
}