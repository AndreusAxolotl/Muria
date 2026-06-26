 local function add_tech_effect(tech_name, effect)
    local tech = data.raw.technology[tech_name]
    tech.effects = tech.effects or {}
    table.insert(tech.effects, effect)
  end

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
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  end

  local function add_crafting_categories(entity_type, entity_name, categories)
    local entity = data.raw[entity_type][entity_name]
    for _,category in pairs(categories) do
      table.insert(entity.crafting_categories, category)
    end
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
 if mods["Paracelsin"] then 
    data:extend {
        {
    type = "recipe",
    name = "paracelsian-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/paracelsian-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "vaterite",      amount = 2},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "nitrogen", amount = 10, independent_probability = 0.50}, 
        {type = "fluid", name = "steam", amount = 5, independent_probability = 0.10}, 
        {type = "item", name = "ice", amount = 2, independent_probability = 0.10},
    },
    allow_productivity = false,
    allow_quality = false,
    categories = {"scrubbing"},
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}}
}}
        add_tech_effect("air-scrubbing", {type = "unlock-recipe", recipe = "paracelsian-air-scrubbing"})
        add_science_pack("air-scrubbing", {"galvanization-science-pack", 1})
    add_tech_prerequisites("air-scrubbing", "galvanization-science-pack")
    end    

if mods["maraxsis"] then 
add_crafting_categories("maraxsis-atmosphere", {"scrubbing"})
end