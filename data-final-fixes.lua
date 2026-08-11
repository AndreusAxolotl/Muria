local cmu = require("collision-mask-util")

for _, asteroid in pairs(data.raw.asteroid or {}) do
    local mask = cmu.get_mask(asteroid)
    mask.layers.trigger_target = true
    asteroid.collision_mask = mask
end

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

local acidthrower = data.raw["fluid-turret"]["acidthrower-turret"]
if data.raw.fluid["nitric-acid"] then
table.insert(acidthrower.attack_parameters.fluids, {type = "nitric-acid", damage_modifier = 0.7}) 
end
if data.raw.fluid["phosphoric-acid"] then
table.insert(acidthrower.attack_parameters.fluids, {type = "phosphoric-acid", damage_modifier = 0.9})
end

if data.raw.fluid["hydrochloric-acid"] then
table.insert(acidthrower.attack_parameters.fluids, {type = "hydrochloric-acid", damage_modifier = 1}) 
end

if mods["Paracelsin"] then
    add_crafting_categories("nitrogen-nitric-acid", {"acidworking"})
end

if mods["Cerys-Moon-of-Fulgora"] then
    add_crafting_categories("cerys-nitric-acid", {"acidworking"})
end

if mods["apia"] then
    add_crafting_categories("phosphoric-acid", {"acidworking"})
end