local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

data:extend{
      {
    type = "item-subgroup",
    name = "muria-leadworking",
    group = "intermediate-products",
    order = "q-a"
  },
  {
    type = "item-subgroup",
    name = "muria-acidworking",
    group = "intermediate-products",
    order = "q-b"
  },
  {
    type = "item-subgroup",
    name = "muria-alt-recipes",
    group = "intermediate-products",
    order = "q-c"
  },
  {
    type = "item-subgroup",
    name = "offworld-chlorane-production",
    group = "intermediate-products",
    order = "q-d"
  },
  {
    type = "item-subgroup",
    name = "muria-agriculture",
    group = "intermediate-products",
    order = "q-e"
  },
  {
    type = "item-subgroup",
    name = "fungiculture",
    group = "production",
    order = "da-b"
  },
  {
    type = "fuel-category",
    name = "chloric-fuel"
  },
  {
      type = "ammo-category",
      name = "acidthrower",
      icon = "__Muria-Graphics__/graphics/icons/muriatic-capsule.png",
      subgroup = "ammo-category"
    },
{
    type = "fluid",
    name = "chlorane",
    subgroup = "fluid",
    default_temperature = -90,
    max_temperature = 0,
    base_color = {0.06, 0.11, 0.07},
    flow_color = {0.06, 0.11, 0.07},
    icon = "__Muria-Graphics__/graphics/icons/chlorane.png",
    auto_barrel = true
  },
  {
    type = "fluid",
    name = "chlorine",
    subgroup = "fluid",
    default_temperature = -30,
    max_temperature = 0,
    base_color = {0.20, 0.69, 0.42},
    flow_color = {0.20, 0.69, 0.42},
    icon = "__Muria-Graphics__/graphics/icons/chlorine.png",
    auto_barrel = true
  },
    {
    type = "fluid",
    name = "hydrogen",
    subgroup = "fluid",
    default_temperature = 0,
    max_temperature = 200,
    base_color = {1, 1, 1},
    flow_color = {1, 1, 1},
    icon = "__Muria-Graphics__/graphics/icons/hydrogen.png",
    auto_barrel = true
  },
{
    type = "fluid",
    name = "oxygen",
    subgroup = "fluid",
    default_temperature = 0,
    max_temperature = 200,
    base_color = {1, 0, 0},
    flow_color = {1, 0, 0},
    icon = "__Muria-Graphics__/graphics/icons/oxygen.png",
    auto_barrel = true
  },
    {
    type = "fluid",
    name = "hydronium",
    subgroup = "fluid",
    default_temperature = 0,
    max_temperature = 100,
    base_color = {0.98, 0.93, 0.93},
    flow_color = {0.98, 0.93, 0.93},
    icon = "__Muria-Graphics__/graphics/icons/hydronium.png",
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "muriatic-solution",
    subgroup = "fluid",
    default_temperature = 500,
    max_temperature = 1000,
    base_color = {0.24, 0.36, 0.08},
    flow_color = {0.24, 0.36, 0.08},
    icon = "__Muria-Graphics__/graphics/icons/muriatic-solution.png",
    auto_barrel = false
  },
    {
    type = "fluid",
    name = "molten-lead",
    subgroup = "fluid",
    default_temperature = 330,
    max_temperature = 500,
    base_color = {0.36, 0.14, 0.12},
    flow_color = {0.36, 0.14, 0.12},
    icon = "__Muria-Graphics__/graphics/icons/molten-lead.png",
    auto_barrel = false
  },
  {
    type = "item",
    name = "acidophile-lichen",
    subgroup = "muria-acidworking",
    order = "d",
    icon = "__Muria-Graphics__/graphics/icons/acidophile-lichen.png",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    icon_size = 64,
    stack_size = 50,
    default_import_location = "muria",
    weight = 4000,
    spoil_ticks = 5 * minute,
    spoil_result = "stone"
},
{
    type = "item",
    name = "artificial-lichen-colony",
    icon = "__Muria-Graphics__/graphics/icons/artificial-lichen-colony.png",
    subgroup = "terrain",
    order = "c[landfill]-d",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "muria",
    place_as_tile =
    {
      result = "artificial-lichen-colony",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"muriatic-solution", "oil-ocean-shallow", "oil-ocean-deep"}
    },
    weight = 4000,
  },
  {
    type = "item",
    name = "chlorine-salts",
    localised_name={"item-name.chlorine-salts"},
    subgroup = "muria-acidworking",
    order = "c",
    icon = "__Muria-Graphics__/graphics/icons/chlorine-salts.png",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    icon_size = 64,
    stack_size = 50,
    plant_result = "metallic-lichen-colony",
    place_result = "metallic-lichen-colony",
    default_import_location = "muria",
    weight = 10000000,
},
  {
    type = "item",
    name = "cotunnite",
    subgroup = "muria-leadworking",
    localised_name={"item-name.cotunnite"},
    order = "a",
    icon = "__Muria-Graphics__/graphics/icons/cotunnite.png",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    icon_size = 64,
    stack_size = 50,
    plant_result = "cotunnite-lichen-colony",
    place_result = "cotunnite-lichen-colony",
    default_import_location = "muria",
    weight = 10000000,
},
  {
    type = "item",
    name = "lead",
    subgroup = "muria-leadworking",
    order = "b",
    icon = "__Muria-Graphics__/graphics/icons/lead.png",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    icon_size = 64,
    stack_size = 50,
    default_import_location = "muria",
    weight = 10000,
},
{
    type = "item",
    name = "lead-plate",
    subgroup = "muria-leadworking",
    order = "c",
    icon = "__Muria-Graphics__/graphics/icons/lead-plate.png",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    icon_size = 64,
    stack_size = 50,
    default_import_location = "muria",
    weight = 4000,
},
{
    type = "item",
    name = "lead-pellets",
    subgroup = "muria-leadworking",
    order = "f",
    icon = "__Muria-Graphics__/graphics/icons/lead-pellets-1.png",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    pictures =
        {
          { size = 64, filename = "__Muria-Graphics__/graphics/icons/lead-pellets-1.png",   scale = 0.5},
          { size = 64, filename = "__Muria-Graphics__/graphics/icons/lead-pellets-2.png", scale = 0.5},
          { size = 64, filename = "__Muria-Graphics__/graphics/icons/lead-pellets-3.png", scale = 0.5},
        },
    icon_size = 64,
    stack_size = 200,
    default_import_location = "muria",
    weight = 2000,
},
{
    type = "ammo",
    name = "heavy-shotgun-shell",
    icon = "__Muria-Graphics__/graphics/icons/heavy-shotgun-shell.png",
    ammo_category = "shotgun-shell",
    ammo_type =
    {
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 16,
          action_delivery =
          {
            type = "projectile",
            projectile = "heavy-shotgun-pellet",
            starting_speed = 1,
            starting_speed_deviation = 0.1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 20
          }
        }
      }
    },
    magazine_size = 15,
    subgroup = "ammo",
    order = "b[shotgun]-c[heavy]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 1*kg,
    default_import_location = "muria",
  },
  {
    type = "ammo",
    name = "toxic-rounds-magazine",
    icon = "__Muria-Graphics__/graphics/icons/toxic-rounds-magazine.png",
    ammo_category = "bullet",
    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
            },
            {
              type = "damage",
              damage = {amount = 18, type = "acid"}
            },
            {
              type = "activate-impact",
              deliver_category = "bullet"
            }
          }
        }
      }
    },
    magazine_size = 20,
    subgroup = "ammo",
    order = "a[basic-clips]-d[toxic-rounds-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 40*kg,
    default_import_location = "muria",
  },
  {type = "tool",
    name = "muriatic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__Muria-Graphics__/graphics/icons/muriatic-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "M" },
    order = "l",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "muria",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science,
    spoil_ticks = 1.5 * hour,
    spoil_to_trigger_result =
    {
      items_per_trigger = 10,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-trivial-smoke",
              smoke_name = "smoke",
            }
          }
        }
      }
    }
},
{
    type = "item",
    name = "chloric-fuel",
    icon = "__Muria-Graphics__/graphics/icons/chloric-fuel.png",
    subgroup = "muria-acidworking",
    order = "e",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chloric-fuel",
    fuel_value = "10MJ",
    stack_size = 50,
    default_import_location = "muria",
    spoil_ticks = 30 * minute,
    spoil_result = "stone",
    weight = 2 * kg
  },
  {
    type = "item",
    name = "eschatotaxite-sprout",
    localised_name={"item-name.eschatotaxite-sprout"},
    icon = "__Muria-Graphics__/graphics/icons/eschatotaxite-sprout.png",
    subgroup = "muria-agriculture",
    order = "a",
    plant_result = "eschatotaxite",
    place_result = "eschatotaxite",
    default_import_location = "muria",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    weight = 10 * kg,
    fuel_category = "chemical",
    spoil_ticks = 30 * minute,
    spoil_result = "spoilage",
    fuel_value = "200kJ"
  },
    {
    type = "capsule",
    name = "eschatotaxite-paste",
    icon = "__Muria-Graphics__/graphics/icons/eschatotaxite-paste.png",
    subgroup = "muria-agriculture",
    order = "b",
    default_import_location = "muria",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    weight = 10 * kg,
    fuel_category = "chemical",
    spoil_ticks = 10 * minute,
    spoil_result = "spoilage",
    fuel_value = "100kJ",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "capsule",
        cooldown = 10,
        range = 0,
        ammo_type =
        {
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = {type = "physical", amount = -25},
                  use_substitute = false
                },
                {
                  type = "play-sound",
                  sound = sounds.eat_fish
                }
              }
            }
          }
        }
      }
    },
  },
  {
    type = "ammo",
    name = "acidthrower-ammo",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-capsule.png",
    ammo_category = "acidthrower",
    ammo_type =
    {
      {
        source_type = "default",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-acidthrower"
          }
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "g",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "gun",
    name = "acidthrower",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-gun.png",
    subgroup = "gun",
    order = "i[acidthrower]",
    inventory_move_sound = item_sounds.flamethrower_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.flamethrower_inventory_move,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "acidthrower",
      cooldown = 2,
      movement_slow_down_factor = 0.4,
      gun_barrel_length = 2,
      gun_center_shift = {0, -1},
      range = 20,
      min_range = 5,
      cyclic_sound =
      {
        begin_sound = {filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 0.7, priority = 64},
        middle_sound = {filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 0.7, priority = 64},
        end_sound = {filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 0.7, priority = 64}
      }
    },
    stack_size = 5
  },
  {
    type = "item",
    name = "holmium-chloride",
    subgroup = "fulgora-processes",
    localised_name={"item-name.holmium-chloride"},
    order = "b-f",
    icon = "__Muria-Graphics__/graphics/icons/holmium-chloride.png",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    icon_size = 64,
    stack_size = 50,
    plant_result = "holmium-lichen-colony",
    place_result = "holmium-lichen-colony",
    default_import_location = "fulgora",
    weight = 10000000,
},
{
    type = "item",
    name = "leaded-fuel",
    icon = "__Muria-Graphics__/graphics/icons/leaded-fuel.png",
    fuel_category = "chemical",
    fuel_value = "500MJ",
    fuel_acceleration_multiplier = 3,
    fuel_top_speed_multiplier = 1.5,
    fuel_emissions_multiplier = 5,
    subgroup = "muria-leadworking",
    order = "z",
    inventory_move_sound = item_sounds.fuel_cell_inventory_move,
    pick_sound = item_sounds.fuel_cell_inventory_pickup,
    drop_sound = item_sounds.fuel_cell_inventory_move,
    stack_size = 20,
    weight = 20*kg
  },
}