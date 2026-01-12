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
local math3d = require "math3d"
local fireutil = require("__base__.prototypes.fire-util")
local biochamber_pictures = require("__Muria__.prototypes.biovat-pictures")

circuit_connector_definitions["acidworking-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 24, main_offset = util.by_pixel(-62.75,  6.25), shadow_offset = util.by_pixel(-62.75,  6.25), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-62.75,  6.25), shadow_offset = util.by_pixel(-62.75,  6.25), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-62.75,  6.25), shadow_offset = util.by_pixel(-62.75,  6.25), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-62.75,  6.25), shadow_offset = util.by_pixel(-62.75,  6.25), show_shadow = true }, 
  }
)
circuit_connector_definitions["smelting-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 24, main_offset = util.by_pixel(-56.875,  22), shadow_offset = util.by_pixel(-56.875,  22), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-56.875,  22), shadow_offset = util.by_pixel(-56.875,  22), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-56.875,  22), shadow_offset = util.by_pixel(-56.875,  22), show_shadow = true }, 
    { variation = 24, main_offset = util.by_pixel(-56.875,  22), shadow_offset = util.by_pixel(-56.875,  22), show_shadow = true }, 
  }
)
circuit_connector_definitions["gun-turret"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -21, 1), shadow_offset = util.by_pixel( -12, 10), show_shadow = true },
  }
)
circuit_connector_definitions["flamethrower-turret"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 14, main_offset = util.by_pixel(    -7,  24), shadow_offset = util.by_pixel(  15, 38), show_shadow = false },
    { variation = 21, main_offset = util.by_pixel( -39.5, -12), shadow_offset = util.by_pixel( -21,  7), show_shadow = false },
    { variation = 2,  main_offset = util.by_pixel(     7, -47), shadow_offset = util.by_pixel(  14, 40), show_shadow = false },
    { variation = 23, main_offset = util.by_pixel(  39.5,  -8), shadow_offset = util.by_pixel(  45,  7), show_shadow = false }
  },
  true
)
circuit_connector_definitions["biochamber"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
  }
)
circuit_connector_definitions["agricultural-tower"] = circuit_connector_definitions.create_single
(
  universal_connector_template,
  { variation = 30, main_offset = util.by_pixel(-7, 12), shadow_offset = util.by_pixel(-7, 12), show_shadow = true }
)

local function shotgun_top_gfx(cfg)
  local flags
  if cfg.mask then
    flags = {"mask"}
  else
    flags = {}
  end
  -- Beats me
  local size = cfg.mask and 128 or 192
  local scale = cfg.mask and 0.75 or 0.5
  return {
    filename = "__Muria-Graphics__/graphics/entity/shotgun-turret/" .. cfg.file,
    width = size, height = size,
    scale = scale,
    direction_count = 64,
    -- It spins around, but each direction only has one frame
    frame_count = 1,
    line_length = 8,
    axially_symmetrical = false,
    run_mode = "forward",
    shift = {0.25, -0.56},
    flags = flags,
    draw_as_shadow = cfg.shadow,
    apply_runtime_tint = cfg.mask,
  }
end
local function shotgun_base_gfx(cfg)
  local flags
  if cfg.mask then
    flags = {"mask", "low-object"}
  else
    flags = {}
  end
  return {
    filename = "__Muria-Graphics__/graphics/entity/shotgun-turret/" .. cfg.file,
    width = 128, height = 128,
    scale = 0.5,
    shift = {0.0, -0.26},

    frame_count = 1,
    flags = flags,
    apply_runtime_tint = cfg.mask,
  }
end

local top_ani = {
  layers = {
    shotgun_top_gfx{file="shotgun-turret-top.png"},
    shotgun_top_gfx{file="shotgun-turret-top-shadow.png", shadow=true},
    shotgun_top_gfx{file="shotgun-turret-top-mask.png", mask=true},
  }
}
local base_ani = {
  layers = {
    shotgun_base_gfx{file="shotgun-turret-base.png"},
    shotgun_base_gfx{file="shotgun-turret-base-mask.png", mask=true},
  }
}

local acids 
if not mods["Paracelsin"] then 
acids = {{type = "chlorane"},
        {type = "sulfuric-acid", damage_modifier = 0.8}}
else
acids = {{type = "chlorane"},
        {type = "sulfuric-acid", damage_modifier = 0.8},
        {type = "nitric-acid", damage_modifier = 0.7}}
end

local function acidworkinganimationLayer()
    return {
        priority = "high",
        width = 270,
        height = 282,
        frame_count = 128,
        lines_per_file = 8,
        animation_speed = 1,
        shift = util.by_pixel(0, -8),
        scale = 0.5,
        stripes = {
            {
                filename = "__Muria-Graphics__/graphics/entity/acidworking-plant/acidworking-plant-animation-1.png",
                width_in_frames = 8,
                height_in_frames = 8
            },
            {
                filename = "__Muria-Graphics__/graphics/entity/acidworking-plant/acidworking-plant-animation-2.png",
                width_in_frames = 8,
                height_in_frames = 8
            }
        }
    }
  end

local function smeltinganimationLayer()
  return {
      priority = "high",
      width = 270,
      height = 310,
      frame_count = 80,
      lines_per_file = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(0, -8),
      scale = 0.5,
      stripes = {
          {
              filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-animation-1.png",
              width_in_frames = 8,
              height_in_frames = 8
          },
          {
              filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-animation-2.png",
              width_in_frames = 8,
              height_in_frames = 8
          }
      }
  }
end

function fireutil.flamethrower_turret_extension_animation(shft, opts)
  local m_line_length = 5
  local m_frame_count = 15
  local ret_layers =
  {
    -- diffuse
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension.png",
      priority = "medium",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 152,
      height = 128,
      direction_count = 1,
      tint = { r = 0.61, g = 1, b = 0.57, a = 1 },
      shift = util.by_pixel(0, -26),
      scale = 0.5
    },
    -- mask
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-mask.png",
      flags = { "mask" },
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 144,
      height = 120,
      direction_count = 1,
      shift = util.by_pixel(0, -26),
      apply_runtime_tint = true,
      scale = 0.5
    },
    -- shadow
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-shadow.png",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 180,
      height = 114,
      direction_count = 1,
      shift = util.by_pixel(33, -1),
      draw_as_shadow = true,
      scale = 0.5
    }
  }

  local yoffsets = { north = 0, east = 3, south = 2, west = 1 }
  local m_lines = m_frame_count / m_line_length

  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
    if tab.height then tab.y = tab.height * m_lines * yoffsets[opts.direction] end
  end) }
end

fireutil.turret_gun_shift =
{
  north = util.by_pixel(0.0, -6.0),
  east = util.by_pixel(18.5, 9.5),
  south = util.by_pixel(0.0, 19.0),
  west = util.by_pixel(-12.0, 5.5)
}

fireutil.turret_model_info =
{
  tilt_pivot = { -1.68551, 0, 2.35439 },
  gun_tip_lowered = { 4.27735, 0, 3.97644 },
  gun_tip_raised = { 2.2515, 0, 7.10942 },
  units_per_tile = 4
}

fireutil.gun_center_base = math3d.vector2.sub({0,  -0.725}, fireutil.turret_gun_shift.south)

function fireutil.flamethrower_turret_preparing_muzzle_animation(opts)
  opts.frame_count = opts.frame_count or 15
  opts.run_mode = opts.run_mode or "forward"
  assert(opts.orientation_count)

  local model = fireutil.turret_model_info
  local angle_raised = -math3d.vector3.angle({1, 0, 0}, math3d.vector3.sub(model.gun_tip_raised, model.tilt_pivot))
  local angle_lowered = -math3d.vector3.angle({1, 0, 0}, math3d.vector3.sub(model.gun_tip_lowered, model.tilt_pivot))
  local delta_angle = angle_raised - angle_lowered

  local generated_orientations = {}
  for r = 0, opts.orientation_count-1 do
    local phi = (r / opts.orientation_count - 0.25) * math.pi * 2
    local generated_frames = {}
    for i = 0, opts.frame_count-1 do
      local k = opts.run_mode == "backward" and (opts.frame_count - i - 1) or i
      local progress = opts.progress or (k / (opts.frame_count - 1))

      local matrix = math3d.matrix4x4
      local mat = matrix.compose({
        matrix.translation_vec3(math3d.vector3.mul(model.tilt_pivot, -1)),
        matrix.rotation_y(progress * delta_angle),
        matrix.translation_vec3(model.tilt_pivot),
        matrix.rotation_z(phi),
        matrix.scale(1 / model.units_per_tile, 1 / model.units_per_tile, -1 / model.units_per_tile)
      })

      local vec = math3d.matrix4x4.mul_vec3(mat, model.gun_tip_lowered)
      table.insert(generated_frames, math3d.project_vec3(vec))
    end
    local direction_data = { frames = generated_frames }
    if (opts.layers and opts.layers[r]) then
      direction_data.render_layer = opts.layers[r]
    end
    table.insert(generated_orientations, direction_data)
  end

  return
  {
    rotations = generated_orientations,
    direction_shift = fireutil.turret_gun_shift
  }
end

function fireutil.flamethrower_turret_extension(opts)
  local set_direction = function (opts, dir)
    opts.direction = dir
    return opts
  end

  return
  {
    north = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.north, set_direction(opts, "north")),
    east = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.east, set_direction(opts, "east")),
    south = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.south, set_direction(opts, "south")),
    west = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.west, set_direction(opts, "west"))
  }
end

function fireutil.flamethrower_turret_prepared_animation(shft, opts)
  local diffuse_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun.png",
    priority = "medium",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 128,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    scale = 0.5
  }
  local glow_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 126,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    tint = util.premul_color{1, 1, 1, 0.5},
    blend_mode = "additive",
    scale = 0.5
  }

  local glow_light_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 126,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    tint = util.premul_color{1, 1, 1, 0.5},
    blend_mode = "additive",
    draw_as_light = true,
    scale = 0.5
  }

  local mask_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-mask.png",
    flags = { "mask" },
    counterclockwise = true,
    line_length = 8,
    width = 144,
    height = 112,
    direction_count = 64,
    shift = util.by_pixel(-1, -28),
    apply_runtime_tint = true,
    scale = 0.5
  }
  local shadow_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-shadow.png",
    counterclockwise = true,
    line_length = 8,
    width = 182,
    height = 116,
    direction_count = 64,
    shift = util.by_pixel(31, -1),
    draw_as_shadow = true,
    scale = 0.5
  }

  local ret_layers = opts and opts.attacking and { diffuse_layer, glow_layer, glow_light_layer, mask_layer, shadow_layer }
                                             or  { diffuse_layer, mask_layer, shadow_layer }

  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
  end) }
end

function fireutil.flamethrower_prepared_animation(opts)
  return
  {
    north = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.north, opts),
    east = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.east, opts),
    south = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.south, opts),
    west = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.west, opts)
  }
end

local function set_shift(shift, tab)
  tab.shift = shift
  return tab
end

function fireutil.flamethrower_turret_pipepictures()
  local pipe_sprites = pipepictures()

  return
  {
    north = set_shift({0, 1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    south = set_shift({0, -1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    east = set_shift({-1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal)),
    west = set_shift({1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal))
  }
end

local indicator_pictures =
{
  north = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-north.png",
    width = 10,
    height = 18,
    shift = util.by_pixel(7, 20),
    scale = 0.5
  },
  east = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-east.png",
    width = 18,
    height = 8,
    shift = util.by_pixel(-33, -5),
    scale = 0.5
  },
  south = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-south.png",
    width = 8,
    height = 18,
    shift = util.by_pixel(-8, -45),
    scale = 0.5
  },
  west = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-west.png",
    width = 20,
    height = 10,
    shift = util.by_pixel(32, -20),
    scale = 0.5
  }
}

data:extend{
  {
    type = "recipe-category",
    name = "acidworking",
  },
    {
    type = "recipe-category",
    name = "leadworking",
  },
  {
    type = "recipe-category",
    name = "biovat-processes",
  },
  {
    type = "item",
    name = "acidworking-plant",
    subgroup = "production-machine",
    order = "z-b",
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    icon = "__Muria-Graphics__/graphics/icons/acidworking-plant.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "muria",
    weight = 200000,
    place_result = "acidworking-plant"
},
  {
    type = "item",
    name = "smelting-plant",
    subgroup = "production-machine",
    order = "z-b",
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    icon = "__Muria-Graphics__/graphics/icons/smelting-plant.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "muria",
    weight = 200000,
    place_result = "smelting-plant"
},
{
    type = "item",
    name = "fungicultural-tower",
    subgroup = "fungiculture",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/agricultural-tower.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.38, b = 0.19, a = 1 }
      },
    },
    icon_size = 64,
    stack_size = 20,
    weight = 200000,
    default_import_location = "muria",
    place_result = "fungicultural-tower"
},
  {
    type = "item",
    name = "acidthrower-turret",
    subgroup = "turret",
    order = "z-b-e-a-b",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    icons =
    {
      {
        icon = "__base__/graphics/icons/flamethrower-turret.png",
        icon_size = 64,
        tint = { r = 0.61, g = 1, b = 0.57, a = 1 }
      },
    },
    icon_size = 64,
    stack_size = 10,
    default_import_location = "muria",
    weight = 100*kg,
    place_result = "acidthrower-turret"
},
{
    type = "item",
    name = "shotgun-turret",
    subgroup = "turret",
    order = "z-b-e-a-c",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    icons =
    {
      {
        icon = "__Muria-Graphics__/graphics/icons/shotgun-turret.png",
        icon_size = 64,
      },
    },
    icon_size = 64,
    stack_size = 10,
    default_import_location = "muria",
    weight = 100*kg,
    place_result = "shotgun-turret"
},
{
    type = "item",
    name = "biovat",
    icon = "__Muria-Graphics__/graphics/icons/biovat.png",
    subgroup = "fungiculture",
    order = "b",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "biovat",
    stack_size = 20,
    default_import_location = "muria"
  },
{
    type = "recipe",
    name = "acidworking-plant",
    enabled = false,
    energy_required = 15,
    ingredients = {
        {type = "item", name = "electronic-circuit",   amount = 20},
        {type = "item", name = "iron-plate",       amount = 20},
        {type = "item", name = "stone-brick",       amount = 20},
        {type = "item", name = "lead-plate", amount = 10},
        {type = "fluid", name = "chlorine", amount = 20},
    },
    results = {
        {type = "item", name = "acidworking-plant", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    main_product = "acidworking-plant",
    category = "crafting-with-fluid",
    auto_recycle = true
},
{
    type = "recipe",
    name = "smelting-plant",
    enabled = false,
    energy_required = 15,
    ingredients = {
        {type = "item", name = "electronic-circuit",   amount = 20},
        {type = "item", name = "copper-plate",       amount = 20},
        {type = "item", name = "stone-brick",       amount = 20},
        {type = "item", name = "lead-plate", amount = 10},
        {type = "fluid", name = "oxygen", amount = 20},
    },
    results = {
        {type = "item", name = "smelting-plant", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    main_product = "smelting-plant",
    category = "crafting-with-fluid",
    auto_recycle = true
},
 {
    type = "recipe",
    name = "fungicultural-tower",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "copper-plate", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 2},
      {type = "item", name = "spoilage", amount = 10},
      {type = "item", name = "landfill", amount = 2}
    },
    results = {{type="item", name="fungicultural-tower", amount=1}},
    enabled = false,
    allow_productivity = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    main_product = "fungicultural-tower",
    auto_recycle = true 
  },
  {
    type = "recipe",
    name = "acidthrower-turret",
    enabled = false,
    energy_required = 40,
    ingredients = {
      {type = "item", name = "lead-plate", amount = 30},
      {type = "item", name = "iron-gear-wheel", amount = 15},
      {type = "item", name = "pipe", amount = 10},
      {type = "item", name = "acidthrower", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 5}
    },
    results = {
        {type = "item", name = "acidthrower-turret", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    main_product = "acidthrower-turret",
    category = "acidworking",
    auto_recycle = true
},
  {
    type = "recipe",
    name = "shotgun-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {type = "item", name = "lead-plate", amount = 20},
      {type = "item", name = "iron-gear-wheel", amount = 15},
      {type = "item", name = "carbon-fiber", amount = 10},
      {type = "item", name = "lead-pellets", amount = 10},
      {type = "item", name = "processing-unit", amount = 5},
    },
    results = {
        {type = "item", name = "shotgun-turret", amount = 1}
    },
    allow_productivity = false,
    main_product = "shotgun-turret",
    category = "acidworking",
    auto_recycle = true
},
{
    type = "recipe",
    name = "biovat",
    category = "organic-or-assembling",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2180,
        max = 2180
      }
    },
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "nutrients", amount = 5},
      {type = "item", name = "eschatotaxite-sprout", amount = 5},
      {type = "item", name = "copper-plate", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 5},
    },
    results = {{type="item", name="biovat", amount=1}},
    enabled = false
  },
    {
        name = "acidworking-plant",
        type = "assembling-machine",
        icon = "__Muria-Graphics__/graphics/icons/acidworking-plant.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
          mining_time = 0.5,
          results = {{type="item", name="acidworking-plant", amount=1}}
        },
        max_health = 500,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        circuit_wire_max_distance = furnace_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["acidworking-plant"],
        collision_box = {{-1.6, -1.6}, {1.6, 1.6}},
        selection_box = {{-2, -2}, {2, 2}},
        crafting_categories = {"acidworking"},
        crafting_speed = 2,
        effect_receiver = { base_effect = { productivity = 0.5 }},
        energy_source =
        {
      type = "burner",
      fuel_categories = {"chloric-fuel"},
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { acids = 2, pollution = 2, spores = -2 },
    },
        impact_category = "metal",
        open_sound = sounds.metal_large_open,
        close_sound = sounds.metal_large_close,
        fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1.5, 1.5} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1.5, -1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1.5, -1.5} }}
      }
    },
        energy_usage = "1MW",
        heating_energy = "100kW",
        module_slots = 4,
        ource_inventory_size = 1,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__Muria-Graphics__/graphics/entity/acidworking-plant/acidworking-plant-shadow.png",
                        priority = "high",
                        width = 1200,
                        height = 700,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 128,
                        animation_speed = 1,
                        shift = util.by_pixel(4, -8),
                        draw_as_shadow = true,
                        scale = 0.375
                    },
                    acidworkinganimationLayer()
                }
            },
            working_visualisations = {
                {
                    fadeout = true,
                    animation = {
                        layers = {
                            acidworkinganimationLayer(),
                            {
                                priority = "high",
                                draw_as_glow = true,
                                blend_mode = "additive",
                                width = 270,
                                height = 282,
                                frame_count = 128,
                                lines_per_file = 8,
                                animation_speed = 1,
                                shift = util.by_pixel(0, -8),
                                scale = 0.5,
                                stripes = {
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/acidworking-plant/acidworking-plant-emission-1.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    },
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/acidworking-plant/acidworking-plant-emission-2.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        working_sound =
    {
      sound = { filename = "__quality__/sound/recycler/recycler-loop.ogg", volume = 0.7 },
      sound_accents =
      {
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-jaw-move", 5, 0.45 )}, frame = 14, audible_distance_modifier = 0.2 },
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-vox", 5, 0.2 )}, frame = 20, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-mechanic", 3, 0.3 )}, frame = 45, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-jaw-move", 5, 0.45 )}, frame = 60, audible_distance_modifier = 0.2 },
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-trash", 5, 0.6 )}, frame = 61, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__quality__/sound/recycler/recycler-jaw-shut", 6, 0.3 )}, frame = 63, audible_distance_modifier = 0.6 },
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
        created_effect = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "script",
                effect_id = "acidworking-plant-created",
              },
            }
          }
        },
      },
      {
        name = "smelting-plant",
        type = "assembling-machine",
        icon = "__Muria-Graphics__/graphics/icons/smelting-plant.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
          mining_time = 0.5,
          results = {{type="item", name="smelting-plant", amount=1}}
        },
        max_health = 500,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["smelting-plant"],
        collision_box = {{-1.6, -1.6}, {1.6, 1.6}},
        selection_box = {{-2, -2}, {2, 2}},
        crafting_categories = {"smelting", "leadworking"},
        crafting_speed = 3.2,
        effect_receiver = { base_effect = { productivity = 0.5 }},
        energy_source =
        {
      type = "burner",
      fuel_categories = {"chloric-fuel"},
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { acids = 2, pollution = 2, spores = -2 },
    },
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1.5, 1.5} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1.5, -1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1.5, -1.5} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 5,
          shift = {0,2}
      }),
      rotate = false
    },
        energy_usage = "1MW",
        heating_energy = "200kW", 
        module_slots = 2,
        source_inventory_size = 1,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
          graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-shadow.png",
                        priority = "high",
                        width = 500,
                        height = 350,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 80,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        scale = 0.5
                    },
                    smeltinganimationLayer()
                }
            },
            working_visualisations = {
                {
                    fadeout = true,
                    animation = {
                        layers = {
                            smeltinganimationLayer(),
                            {
                                priority = "high",
                                draw_as_glow = true,
                                blend_mode = "additive",
                                width = 270,
                                height = 310,
                                frame_count = 80,
                                lines_per_file = 8,
                                animation_speed = 0.5,
                                shift = util.by_pixel(0, -8),
                                scale = 0.5,
                                stripes = {
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-emission1-1.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    },
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-emission1-2.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    }
                                }
                            },
                            {
                                priority = "high",
                                draw_as_glow = true,
                                blend_mode = "additive",
                                width = 270,
                                height = 310,
                                frame_count = 80,
                                lines_per_file = 8,
                                animation_speed = 0.5,
                                shift = util.by_pixel(0, -8),
                                scale = 0.5,
                                stripes = {
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-emission2-1.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    },
                                    {
                                        filename = "__Muria-Graphics__/graphics/entity/smelting-plant/smelting-plant-emission2-2.png",
                                        width_in_frames = 8,
                                        height_in_frames = 8
                                    }
                                }
                            },
                        }
                    }
                }
            }
        },
        working_sound =
        {
          sound = {filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.9},
          apparent_volume = 0.3,
        },
        created_effect = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "script",
                effect_id = "smelting-plant-created",
              },
            }
          }
        },
      },
      {
    type = "agricultural-tower",
    name = "fungicultural-tower",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/agricultural-tower.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.38, b = 0.19, a = 1 }
      },
    },
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "fungicultural-tower"},
    fast_replaceable_group = "agricultural-tower",
    max_health = 500,
    corpse = "agricultural-tower-remnants",
    dying_explosion = "agricultural-tower-explosion",
    open_sound = sounds.mech_large_open,
    close_sound = sounds.mech_large_close,
    input_inventory_size = 3,
    surface_conditions = {{property = "gravity", min = 8, max = 9}},
    radius_visualisation_picture =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    radius = 2,
    accepted_seeds = {"eschatotaxite-sprout", "chlorine-salts", "cotunnite", "holmium-chloride"},
    crane = require("__Muria__.prototypes.fungicultural-tower-crane"),
    planting_procedure_points =
    {
      {0.0, 0.0, 0.75},
      {0.0, 0.0, 0.0},
      {0.0, 0.05, -0.05},
      {0.0353553, 0.0353553, -0.1},
      {0.05, 0.0, -0.15},
      {0.0353553, -0.0353553, -0.2},
      {0.0, -0.05, -0.25},
      {-0.0353553, -0.0353553, -0.3},
      {-0.05, 0.0, -0.35},
      {-0.0353553, 0.0353553, -0.4},
      {0.0, 0.0, -0.45},
      {0.0, 0.0, 0.0}
    },
    harvesting_procedure_points =
    {
      {0.0, 0.0, 1.0}
    },
    drawing_box_vertical_extension = 2.5,
    heating_energy = "100kW",
    energy_usage = "500kW",
    crane_energy_usage = "250kW",
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
        volume = 0.7,
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg", volume = 0.3},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg", volume = 0.5}
    },
    central_orienting_sound_source = "hub",
    arm_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg", volume = 0.6}
    },
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg", volume = 0.4}
    },
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg", volume = 0.4},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg", volume = 0.45}
    },
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-planting", 5, 0.7),
    harvesting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting", 6, 0.6),
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
    },
    circuit_connector = circuit_connector_definitions["agricultural-tower"],
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            priority = "high",
            animation_speed = 0.25,
            frame_count = 64,
            tint = { r = 0.7, g = 0.38, b = 0.19, a = 1 },
            scale = 0.5
          }),
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow",
          {
            priority = "high",
            frame_count = 1,
            repeat_count = 64,
            draw_as_shadow = true,
            scale = 0.5
          })
        }
      },
      recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
      working_visualisations =
      {
        {
          always_draw = true,
          fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            frame_count = 1,
            tint = { r = 0.7, g = 0.38, b = 0.19, a = 1 },
            scale = 0.5
          }),
        },

        {
          --constant_speed = true,
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-plant-mask",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            tint_as_overlay = true,
            scale = 0.5
          }),
        },
        {
          --constant_speed = true,
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-light",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            blend_mode = "additive",
            scale = 0.5
          }),
        },
        {
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 6, shift = {-0.45, -0.25}, color = {r = 1, g = 1, b = 1}}
        },
        {
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 16, shift = {-1.2, -0.5}, color = {r = 1, g = 1, b = 1}}
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 36,
          shift = util.by_pixel(0, 20),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false,
      }
    }
  },
  {
    type = "fluid-turret",
    name = "acidthrower-turret",
    icons =
    {
      {
        icon = "__base__/graphics/icons/flamethrower-turret.png",
        icon_size = 64,
        tint = { r = 0.61, g = 1, b = 0.57, a = 1 }
      },
    },
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "acidthrower-turret"},
    fast_replaceable_group = "flamethrower-turret",
    max_health = 1500,
    corpse = "flamethrower-turret-remnants",
    collision_box = {{-0.7, -1.2 }, {0.7, 1.2}},
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    open_sound = sounds.turret_open,
    close_sound = sounds.turret_close,
    preparing_sound = sounds.flamethrower_turret_activate,
    folding_sound = sounds.flamethrower_turret_deactivate,
    folding_speed = 0.08,
    attacking_speed = 0.35,
    ending_attack_speed = 1,
    dying_explosion = "medium-explosion",
    turret_base_has_direction = true,
    resistances =
    {
      {
        type = "acid",
        percent = 100
      }
    },

    fluid_box =
    {
      production_type = "none", -- FluidTurret has its own logic
      secondary_draw_order = 0,
      render_layer = "lower-object",
      --pipe_picture = fireutil.flamethrower_turret_pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        { direction = defines.direction.west, position = {-0.5, 1.0} },
        { direction = defines.direction.east, position = {0.5, 1.0} }
      }
    },
    fluid_buffer_size = 100,
    fluid_buffer_input_flow = 250 / 60 / 5, -- 5s to fill the buffer
    activation_buffer_ratio = 0.25,

    circuit_connector = circuit_connector_definitions["flamethrower-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    folded_animation = fireutil.flamethrower_turret_extension({frame_count = 1, line_length = 1}),

    preparing_animation = fireutil.flamethrower_turret_extension({}),
    prepared_animation = fireutil.flamethrower_prepared_animation(),
    attacking_animation = fireutil.flamethrower_prepared_animation({attacking = true}),
    ending_attack_animation = fireutil.flamethrower_prepared_animation({attacking = true}),

    folding_animation = fireutil.flamethrower_turret_extension({ run_mode = "backward" }),

    not_enough_fuel_indicator_picture = indicator_pictures,
    not_enough_fuel_indicator_light = {intensity = 0.2, size = 1.5, color = {1, 0, 0}},
    enough_fuel_indicator_picture = fireutil.foreach(util.table.deepcopy(indicator_pictures), function (tab) tab.x = tab.width end),
    enough_fuel_indicator_light = {intensity = 0.2, size = 1.5, color = {0, 1, 0}},
    out_of_ammo_alert_icon =
    {
      filename = "__core__/graphics/icons/alerts/fuel-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },

    gun_animation_render_layer = "object",
    gun_animation_secondary_draw_order = 1,
    graphics_set =
    {
      base_visualisation =
      {
        render_layer = "object",
        secondary_draw_order = 0,
        animation =
        {
          north =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north.png",
                line_length = 1,
                width = 158,
                height = 196,
                shift = util.by_pixel(-1, 13),
                tint = { r = 0.61, g = 1, b = 0.57, a = 1 },
                scale = 0.5,
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-mask.png",
                flags = { "mask" },
                line_length = 1,
                width = 74,
                height = 70,
                shift = util.by_pixel(-1, 33),
                apply_runtime_tint = true,
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 134,
                height = 152,
                shift = util.by_pixel(3, 15),
                scale = 0.5
              }
            }
          },
          east =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east.png",
                line_length = 1,
                width = 216,
                height = 169,
                shift = util.by_pixel(-6, -2.75),
                tint = { r = 0.61, g = 1, b = 0.57, a = 1 },
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 66,
                height = 82,
                shift = util.by_pixel(-33, 1),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 144,
                height = 86,
                shift = util.by_pixel(14, 9),
                scale = 0.5
              }
            }
          },
          south =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south.png",
                line_length = 1,
                width = 128,
                height = 166,
                shift = util.by_pixel(0, -8),
                tint = { r = 0.61, g = 1, b = 0.57, a = 1 },
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 72,
                height = 72,
                shift = util.by_pixel(0, -31),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 134,
                height = 98,
                shift = util.by_pixel(3, 9),
                scale = 0.5
              }
            }

          },
          west =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west.png",
                line_length = 1,
                width = 208,
                height = 160,
                shift = util.by_pixel(7, -5),
                tint = { r = 0.61, g = 1, b = 0.57, a = 1 },
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 64,
                height = 74,
                shift = util.by_pixel(32, -1),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 206,
                height = 88,
                shift = util.by_pixel(15, 4),
                scale = 0.5
              }
            }
          }
        }
      }
    },

    --[[muzzle_animation = util.draw_as_glow
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-muzzle-fire.png",
      line_length = 8,
      width = 16,
      height = 30,
      frame_count = 32,
      blend_mode = "additive",
      scale = 0.45,
      shift = {0.015625 * 0.5, -0.546875 * 0.5 + 0.05}
    },
    muzzle_light = {size = 1.5, intensity = 0.2, color = {1, 0.5, 0}},]]--

    folded_muzzle_animation_shift          = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 4, progress = 0, layers = {[0] = "object"} },
    preparing_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, layers = {[0] = "object"} },
    prepared_muzzle_animation_shift        = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1, orientation_count =  64, progress = 1},
    --starting_attack_muzzle_animation_shift = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    attacking_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    ending_attack_muzzle_animation_shift   = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    folding_muzzle_animation_shift         = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, run_mode = "backward", layers = {[0] = "object"}},

    prepare_range = 35,
    shoot_in_prepare_state = false,
    attack_parameters =
    {
      type = "stream",
      cooldown = 2,
      range = 20,
      min_range = 10,

      turn_range = 1.0 / 5.0,
      fire_penalty = 15,

      -- lead_target_for_projectile_speed = 0.2* 0.75 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      fluids = acids,
      fluid_consumption = 0.2,

      gun_center_shift =
      {
        north = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.north),
        east = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.east),
        south = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.south),
        west = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.west)
      },
      gun_barrel_length = 0.4,

      ammo_category = "acidthrower",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-acidthrower",
            source_offset = {0.15, -0.5}
          }
        }
      },

      cyclic_sound =
      {
        begin_sound = sound_variations("__base__/sound/fight/flamethrower-turret-start", 3, 0.5),
        middle_sound = sound_variations("__base__/sound/fight/flamethrower-turret-mid", 3, 0.5),
        end_sound = sound_variations("__base__/sound/fight/flamethrower-turret-end", 3, 0.5)
      }
    },
    surface_conditions = {{property = "pressure", min = 10}},
    call_for_help_radius = 40
  },
  {
    type = "ammo-turret",
    name = "shotgun-turret",
    icon = "__Muria-Graphics__/graphics/icons/shotgun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "shotgun-turret"},
    fast_replaceable_group = "ammo-turret",
    max_health = 400,
    corpse = "gun-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    drawing_box_vertical_extension = 0.2,
    damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    prepare_range = 20,
    start_attacking_only_when_can_shoot = false,
    shoot_in_prepare_state = false,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.08,
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.4,
    folded_speed = 1,
    alert_when_attacking = true,
    circuit_connector = circuit_connector_definitions["gun-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = sounds.turret_open,
    close_sound = sounds.turret_close,
    icon_draw_specification = {scale = 0.7},
    icons_positioning =
    {
      {inventory_index = defines.inventory.turret_ammo, shift = {0, -0.25}}
    },
    folded_animation = top_ani,
    preparing_animation = top_ani,
    prepared_animation = top_ani,
    attacking_animation = top_ani,
    folding_animation = top_ani,
    graphics_set = {
    base_visualization = {
          animation = base_ani
        }
      },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      health_penalty = 1,
      cooldown = 30,
      cooldown_deviation = 0,
      damage_modifier = 2.5,
      min_attack_distance = 15,
      projectile_creation_distance = 1.5,
      projectile_center = {0, 0.2}, -- same as gun_turret_attack shift
      shell_particle =
      {
            name = "shell-particle",
            direction_deviation = 0.1,
            speed = 0.1,
            speed_deviation = 0.03,
            center = {0, 0.2},
            creation_distance = -1.925,
            starting_frame_speed = 0.2,
            starting_frame_speed_deviation = 0.1
          },
      range = 20,
      min_range = 5,
      turn_range = 0.333333,
      warmup = 0,
      movement_slow_down_cooldown = 30,
      movement_slow_down_factor = 0.5,
      use_shooter_direction = true,
      sound = "__base__/sound/fight/pump-shotgun-1.ogg"
    },

    call_for_help_radius = 40,
  },
  {
    type = "assembling-machine",
    name = "biovat",
    icon = "__Muria-Graphics__/graphics/icons/biovat.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "biovat"},
    fast_replaceable_group = "biochamber",
    max_health = 150,
    corpse = "biochamber-remnants",
    dying_explosion = "biochamber-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["biochamber"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    graphics_set = require("__Muria__.prototypes.biovat-pictures").graphics_set,
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nutrients"},
      effectivity = 0.5,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { acids = -2, pollution = -1, spores = 2 },
      light_flicker = require("__space-age__.prototypes.entity.biochamber-pictures").light_flicker
    },
    energy_usage = "500kW",
    heating_energy = "100kW",
    crafting_categories = {"biovat-processes"},
    fluid_boxes_off_when_no_fluid_recipe = true,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    production_health_effect = nil
  },
}