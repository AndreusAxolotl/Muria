local weapon_shooting_speed_3_icon = "__base__/graphics/technology/weapon-shooting-speed-3.png"

data:extend {
  {
    type = "technology",
    name = "planet-discovery-muria",
    icons = util.technology_icon_constant_planet("__Muria-Graphics__/graphics/technology/planet-discovery-muria.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "muria",
        use_icon_overlay_constant = true
      },
      {
        type = "unlock-recipe",
        recipe = "muriatic-solution-separation"
      },
      {
        type = "unlock-recipe",
        recipe = "hydronium-destruction"
      },
      {
        type = "unlock-recipe",
        recipe = "oxyhydrogen-combustion"
      },
    },
    prerequisites = { "rocket-turret", "advanced-asteroid-processing", "asteroid-reprocessing"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "metallurgic-science-pack",     1 },
        { "agricultural-science-pack",    1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "lichen-cultivation",
    icon = "__Muria-Graphics__/graphics/technology/lichen-cultivation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fungicultural-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "acidophile-lichen-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-acidophile-lichen"
      },
      {
        type = "unlock-recipe",
        recipe = "chloric-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "biovat"
      },
    },
    prerequisites = { "planet-discovery-muria" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "chlorine-salt-deposit"
    }
  },
  {
    type = "technology",
    name = "eschatotaxite-farming",
    icon = "__Muria-Graphics__/graphics/technology/eschatotaxite-farming.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fungicultural-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "eschatotaxite-paste"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-eschatotaxite-sprout"
      },
      {
        type = "unlock-recipe",
        recipe = "biovat"
      },
    },
    prerequisites = { "planet-discovery-muria" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "eschatotaxite"
    }
  },
   {
    type = "technology",
    name = "murian-oil-processing",
    icon = "__Muria-Graphics__/graphics/technology/murian-oil-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "crude-oil-from-eschatotaxite-paste"
      },
      {
        type = "unlock-recipe",
        recipe = "hydrogenated-oil-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "kerolox-rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-hydrogen"
      },
      {
        type = "unlock-recipe",
        recipe = "polyvinyl-chloride"
      }
    },
    prerequisites = { "eschatotaxite-farming" },
    research_trigger =
    {
      type = "craft-item",
      item = "eschatotaxite-paste",
      count = 50
    }
  },
   {
    type = "technology",
    name = "lead-processing",
    icon = "__Muria-Graphics__/graphics/technology/lead-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lead-plate"
      },
    },
    prerequisites = { "eschatotaxite-farming", "lichen-cultivation"},
    research_trigger =
    {
      type = "craft-item",
      item = "cotunnite",
      count = 20
    }
  },
  {
    type = "technology",
    name = "acidworking",
    icon = "__Muria-Graphics__/graphics/technology/acidworking.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "acidworking-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "chlorane"
      },
    },
    prerequisites = { "lead-processing", "eschatotaxite-farming"},
    research_trigger =
    {
      type = "craft-item",
      item = "chloric-fuel",
      count = 20
    }
  },
     {
    type = "technology",
    name = "advanced-lead-processing",
    icon = "__Muria-Graphics__/graphics/technology/advanced-lead-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "smelting-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "lead-pellets"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-lead"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-lead"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-lead-pellets"
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-shotgun-shell"
      },
    },
    prerequisites = { "lead-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "lead-plate",
      count = 50
    }
  },
  {
    type = "technology",
    name = "muriatic-science-pack",
    icon = "__Muria-Graphics__/graphics/technology/muriatic-science-pack.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "muriatic-science-pack"
      },
    },
    prerequisites = { "advanced-lead-processing", "acidworking"},
    research_trigger =
    {
      type = "craft-item",
      item = "heavy-shotgun-shell",
      count = 20
    }
  },
  {
    type = "technology",
    name = "offworld-chlorane-production",
    icon = "__Muria-Graphics__/graphics/technology/offworld-chlorane-production.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chlorane-from-biter-egg"
      },
      {
        type = "unlock-recipe",
        recipe = "chlorane-from-spoilage"
      },
      {
        type = "unlock-recipe",
        recipe = "chlorane-oxidation"
      },
      {
        type = "unlock-recipe",
        recipe = "water-electrolysis"
      },
    },
    prerequisites = { "muriatic-science-pack", "biter-egg-handling"},
    unit =
    {
      count = 500,
      ingredients =
      {
        { "chemical-science-pack",        1 },
        { "space-science-pack",           1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "advanced-paste-applications",
    icon = "__Muria-Graphics__/graphics/technology/advanced-paste-applications.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "eschatotaxite-low-density-structure"
      },
      {
        type = "unlock-recipe",
        recipe = "eschatotaxite-carbon-fiber"
      },
    },
    prerequisites = { "muriatic-science-pack"},
    unit =
    {
      count = 750,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "toxic-rounds-magazine",
    icon = "__Muria-Graphics__/graphics/technology/toxic-rounds-magazine.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "toxic-rounds-magazine"
      },
    },
    prerequisites = { "offworld-chlorane-production"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "military-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "chlorane-explosives",
    icon = "__Muria-Graphics__/graphics/technology/chlorane-explosives.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chlorane-explosives"
      },
    },
    prerequisites = { "offworld-chlorane-production"},
    unit =
    {
      count = 500,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "military-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "chlorane-lead-battery",
    icon = "__Muria-Graphics__/graphics/technology/chlorane-lead-battery.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chlorane-lead-battery"
      },
    },
    prerequisites = { "offworld-chlorane-production"},
    unit =
    {
      count = 500,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "space-science-pack",           1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "leaded-fuel",
    icon = "__Muria-Graphics__/graphics/technology/leaded-fuel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "leaded-fuel"
      },
    },
    prerequisites = { "muriatic-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "space-science-pack",           1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "acid-weaponization",
    icon = "__Muria-Graphics__/graphics/technology/acid-weaponization.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "acidthrower-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "acidthrower"
      },
      {
        type = "unlock-recipe",
        recipe = "acidthrower-ammo"
      },
    },
    prerequisites = { "offworld-chlorane-production"},
    unit =
    {
      count = 1500,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "military-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-7",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_3_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 1.5
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 1.3
      }
    },
    prerequisites = {"weapon-shooting-speed-6", "muriatic-science-pack"},
    unit =
    {
      count = 100 * 14,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-8",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_3_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 1.5
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 1.3
      }
    },
    prerequisites = {"weapon-shooting-speed-7"},
    unit =
    {
      count = 100 * 24,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-acid-weaponry",
    icons = util.technology_icon_constant_damage("__Muria-Graphics__/graphics/technology/acid-weaponization.png"),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "acidthrower",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "acidthrower-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"acid-weaponization"},
    unit =
    {
      count_formula = "2^(L-1)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "hydronium-destruction-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__Muria-Graphics__/graphics/technology/hydronium-destruction-productivity.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "hydronium-destruction",
        change = 0.1
      },
    },
    prerequisites = { "muriatic-science-pack" },
    unit =
    {
      count_formula = "1.5^L*1000",      
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "space-science-pack",                    1 },
        { "muriatic-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "explosives-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/explosives.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "explosives",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "chlorane-explosives",
        change = 0.1
      },
    },
    PlanetsLib_recipe_productivity_effects = {
            purge_other_effects = false,
            effects = {
                {
                    type = "item",
                    name = "explosives",
                    change = 0.1
                },
            }
        },
    prerequisites = { "chlorane-explosives" },
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "military-science-pack",              1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "muriatic-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "battery-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/battery.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "battery",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "chlorane-lead-battery",
        change = 0.1
      },
    },
    PlanetsLib_recipe_productivity_effects = {
            purge_other_effects = false,
            effects = {
                {
                    type = "item",
                    name = "battery",
                    change = 0.1
                },
            }
        },
    prerequisites = { "chlorane-lead-battery", "electromagnetic-science-pack" },
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "electromagnetic-science-pack",              1 },
        { "muriatic-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "oxygenated-bacteria-cultivation",
    icon = "__Muria-Graphics__/graphics/technology/oxygenated-bacteria-cultivation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "oxygenated-copper-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "oxygenated-iron-bacteria-cultivation"
      }
    },
    prerequisites = {"offworld-chlorane-production"},
    unit =
    {
      count = 750,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "agricultural-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "holmium-chloride",
    icon = "__Muria-Graphics__/graphics/technology/holmium-chloride.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "holmium-chloride"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-lichen-colony"
      },
    },
    prerequisites = {"foundation", "offworld-chlorane-production"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",        1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "electromagnetic-science-pack",     1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "shotgun-turret",
    icon = "__Muria-Graphics__/graphics/technology/shotgun-turret.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "shotgun-turret"
      }
    },
    prerequisites = { "muriatic-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "military-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "muriatic-science-pack",     1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "shotgun-turret-damage",
    icons = util.technology_icon_constant_damage("__Muria-Graphics__/graphics/technology/shotgun-turret.png"),
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "shotgun-turret",
        modifier = 0.5
      },
    },
    prerequisites = {"physical-projectile-damage-6", "shotgun-turret"},
    unit =
    {
      count_formula = "1.5^L*2000",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "military-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "muriatic-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
}

local function add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


local function add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  -- If `tech.unit` doesn't exist then it is a trigger tech rather than a science tech, cannot modify it in this way
  if tech.unit then
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  else
    log("Muria: Unable to add science to tech `" .. tech_name .. "` due to it being a trigger technology, skipped.")
  end
end
local function add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end
if settings.startup["muria-muriatic-promethium"].value then
add_tech_prerequisites("promethium-science-pack", "muriatic-science-pack")
add_science_pack("promethium-science-pack", { "muriatic-science-pack", 1 })
add_science_pack("research-productivity", { "muriatic-science-pack", 1 })
end
if settings.startup["muria-muriatic-implementation"].value then
add_tech_prerequisites("foundation", "muriatic-science-pack")
add_science_pack("foundation", { "muriatic-science-pack", 1 })
end