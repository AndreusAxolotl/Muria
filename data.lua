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

data.raw.surface["space-platform"].surface_properties["atmospheric-acidity"] = 0
data.raw.planet["nauvis"].surface_properties["atmospheric-acidity"] = 10
data.raw.planet["vulcanus"].surface_properties["atmospheric-acidity"] = 80
data.raw.planet["fulgora"].surface_properties["atmospheric-acidity"] = 30
data.raw.planet["gleba"].surface_properties["atmospheric-acidity"] = 15
data.raw.planet["aquilo"].surface_properties["atmospheric-acidity"] = 5
data.raw.planet["muria"].surface_properties["atmospheric-acidity"] = 100

table.insert(data.raw.lab["lab"].inputs, "muriatic-science-pack")
table.insert(data.raw.lab["biolab"].inputs, "muriatic-science-pack")

local function add_additional_categories(recipe_name, categories)
    local recipe = data.raw.recipe[recipe_name]
    if recipe and categories then
        recipe.additional_categories = recipe.additional_categories or {}
        for _, cat in pairs(categories) do
            table.insert(recipe.additional_categories, cat)
        end
    end
end
add_additional_categories("sulfuric-acid", {"acidworking"})
add_additional_categories("sulfur", {"acidworking"})
add_additional_categories("battery", {"acidworking"})
add_additional_categories("acid-neutralization", {"acidworking"})
add_additional_categories("explosives", {"acidworking"})
add_additional_categories("carbon", {"acidworking"})
add_additional_categories("poison-capsule", {"acidworking"})
add_additional_categories("slowdown-capsule", {"acidworking"})
add_additional_categories("holmium-solution", {"acidworking"})
add_additional_categories("molten-iron", {"leadworking"})
add_additional_categories("molten-copper", {"leadworking"})
add_additional_categories("casting-iron", {"leadworking"})
add_additional_categories("casting-copper", {"leadworking"})
add_additional_categories("casting-steel", {"leadworking"})
add_additional_categories("casting-iron-gear-wheel", {"leadworking"})
add_additional_categories("casting-iron-stick", {"leadworking"})
add_additional_categories("casting-copper-cable", {"leadworking"})
add_additional_categories("casting-low-density-structure", {"leadworking"})
add_additional_categories("casting-pipe", {"leadworking"})
add_additional_categories("casting-pipe-to-ground", {"leadworking"})
add_additional_categories("concrete-from-molten-iron", {"leadworking"})
add_additional_categories("holmium-plate", {"leadworking"})
add_additional_categories("yumako-processing", {"biovat-processes"})
add_additional_categories("jellynut-processing", {"biovat-processes"})
add_additional_categories("copper-bacteria", {"biovat-processes"})
add_additional_categories("iron-bacteria", {"biovat-processes"})
add_additional_categories("copper-bacteria-cultivation", {"biovat-processes"})
add_additional_categories("iron-bacteria-cultivation", {"biovat-processes"})
add_additional_categories("nutrients-from-spoilage", {"biovat-processes"})
add_additional_categories("nutrients-from-yumako-mash", {"biovat-processes"})
add_additional_categories("nutrients-from-bioflux", {"biovat-processes"})
add_additional_categories("burnt-spoilage", {"biovat-processes"})
add_additional_categories("nutrients-from-fish", {"biovat-processes"})
add_additional_categories("nutrients-from-biter-egg", {"biovat-processes"})
add_additional_categories("wood-processing", {"biovat-processes"})
add_additional_categories("rocket-fuel", {"biovat-processes"})