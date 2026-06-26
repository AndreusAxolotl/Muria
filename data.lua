require "prototypes.asteroid-spawn-definitions"
require "prototypes.ambient-sounds"
require "prototypes.projectiles"
require "prototypes.items"
require "prototypes.recipes"
require "prototypes.acidic-air"
require "prototypes.fungicultural-tower-crane"
require "prototypes.biovat-pictures"
require "prototypes.entities"
require "prototypes.not-really-plants"
require "prototypes.technology"
require "prototypes.resources"
require "prototypes.tiles"
require "prototypes.tips-and-tricks"
require "prototypes.planet"

local replace_base_game_simulations = false
local muria_menu_simulations = require("__Muria__/prototypes/menu-simulations.lua")
if not data.raw["utility-constants"]["default"].main_menu_simulations or replace_base_game_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.muria_separation = muria_menu_simulations.muria_separation
main_menu_simulations.muria_fungal = muria_menu_simulations.muria_fungal
main_menu_simulations.muria_corrosion = muria_menu_simulations.muria_corrosion
main_menu_simulations.muria_leaded = muria_menu_simulations.muria_leaded

data.raw.surface["space-platform"].surface_properties["atmospheric-acidity"] = 0
data.raw.planet["nauvis"].surface_properties["atmospheric-acidity"] = 10
data.raw.planet["vulcanus"].surface_properties["atmospheric-acidity"] = 80
data.raw.planet["fulgora"].surface_properties["atmospheric-acidity"] = 30
data.raw.planet["gleba"].surface_properties["atmospheric-acidity"] = 15
data.raw.planet["aquilo"].surface_properties["atmospheric-acidity"] = 5
data.raw.planet["muria"].surface_properties["atmospheric-acidity"] = 100

table.insert(data.raw.lab["lab"].inputs, "muriatic-science-pack")
table.insert(data.raw.lab["biolab"].inputs, "muriatic-science-pack")

local function is_in_table(table_, value)
  for _, item in pairs(table_) do
    if item == value then
      return true
    end
  end
  return false
end

local function add_crafting_categories(recipe_name, categories)
  local recipe = data.raw.recipe[recipe_name]
  recipe.categories = recipe.categories or {"crafting"}
  for _, category_to_insert in pairs(categories) do
    if not is_in_table(recipe.categories, category_to_insert) then
      table.insert(recipe.categories, category_to_insert)
    end
  end
end
add_crafting_categories("sulfuric-acid", {"acidworking"})
add_crafting_categories("sulfur", {"acidworking"})
add_crafting_categories("battery", {"acidworking"})
add_crafting_categories("acid-neutralisation", {"acidworking"})
add_crafting_categories("explosives", {"acidworking"})
add_crafting_categories("carbon", {"acidworking"})
add_crafting_categories("poison-capsule", {"acidworking"})
add_crafting_categories("slowdown-capsule", {"acidworking"})
add_crafting_categories("holmium-solution", {"acidworking"})
add_crafting_categories("iron-ore-melting", {"leadworking"})
add_crafting_categories("copper-ore-melting", {"leadworking"})
add_crafting_categories("casting-iron", {"leadworking"})
add_crafting_categories("casting-copper", {"leadworking"})
add_crafting_categories("casting-steel", {"leadworking"})
add_crafting_categories("casting-iron-gear-wheel", {"leadworking"})
add_crafting_categories("casting-iron-stick", {"leadworking"})
add_crafting_categories("casting-copper-cable", {"leadworking"})
add_crafting_categories("casting-low-density-structure", {"leadworking"})
add_crafting_categories("casting-pipe", {"leadworking"})
add_crafting_categories("casting-pipe-to-ground", {"leadworking"})
add_crafting_categories("concrete-from-molten-iron", {"leadworking"})
add_crafting_categories("holmium-plate", {"leadworking"})
add_crafting_categories("yumako-processing", {"biovat-processes"})
add_crafting_categories("jellynut-processing", {"biovat-processes"})
add_crafting_categories("copper-bacteria", {"biovat-processes"})
add_crafting_categories("iron-bacteria", {"biovat-processes"})
add_crafting_categories("copper-bacteria-cultivation", {"biovat-processes"})
add_crafting_categories("iron-bacteria-cultivation", {"biovat-processes"})
add_crafting_categories("nutrients-from-spoilage", {"biovat-processes"})
add_crafting_categories("nutrients-from-yumako-mash", {"biovat-processes"})
add_crafting_categories("nutrients-from-bioflux", {"biovat-processes"})
add_crafting_categories("burnt-spoilage", {"biovat-processes"})
add_crafting_categories("nutrients-from-fish", {"biovat-processes"})
add_crafting_categories("nutrients-from-biter-egg", {"biovat-processes"})
add_crafting_categories("tree-seed", {"biovat-processes"})
add_crafting_categories("rocket-fuel", {"biovat-processes"})