if not mods["bzlead"] then return end

local tech = data.raw.technology["foundry"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "molten-lead" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["foundry"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "casting-lead" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["foundry"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "casting-lead-expansion-bolt" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["foundry"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "molten-lead-from-lava" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["bioflux-processing"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "chelated-lead" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["bioflux-processing"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "lead-dechelation" then
      table.remove(tech.effects, i)
    end
end

local function add_tech_effect(tech_name, effect)
    local tech = data.raw.technology[tech_name]
    tech.effects = tech.effects or {}
    table.insert(tech.effects, effect)
  end

add_tech_effect("advanced-lead-processing", {type = "unlock-recipe", recipe = "casting-lead-expansion-bolt"})
add_tech_effect("advanced-lead-processing", {type = "unlock-recipe", recipe = "molten-lead-from-lava"})
add_tech_effect("advanced-lead-processing", {type = "unlock-recipe", recipe = "chelated-lead"})
add_tech_effect("advanced-lead-processing", {type = "unlock-recipe", recipe = "lead-dechelation"})
data:extend {
{
    type = "recipe",
    name = "lead-conversion",
    icon = "__Muria-Graphics__/graphics/icons/lead.png",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "lead-ore",   amount = 2},
    },
    results = {
        {type = "item", name = "lead", amount = 2},
    },
    allow_productivity = true,
    category = "leadworking",
    auto_recycle = false,
    show_amount_in_title = false,
},}
add_tech_effect("advanced-lead-processing", {type = "unlock-recipe", recipe = "lead-conversion"})