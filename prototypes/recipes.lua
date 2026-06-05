data:extend{
{
    type = "recipe",
    name = "muriatic-solution-separation",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-solution-separation.png",
    enabled = false,
    energy_required = 2,
    subgroup = "muria-acidworking",
    order = "a",
    ingredients = {
        {type = "fluid", name = "muriatic-solution",   amount = 50},
    },
    results = {
        {type = "fluid", name = "chlorine", amount = 50},
        {type = "fluid", name = "hydronium", amount = 20},
        {type = "item", name = "cotunnite", amount = 1}
    },
    allow_productivity = true,
    category = "chemistry",
    auto_recycle = false,
    show_amount_in_title = false,
    additional_categories = {"acidworking"},
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    crafting_machine_tint =
    {
        primary = {r = 0, g = 1, b = 0, a = 1.000},
        secondary = {r = 0, g = 1, b = 0, a = 1.000},
        tertiary = {r = 0, g = 1, b = 0, a = 1.000},
        quaternary = {r = 0, g = 1, b = 0, a = 1.000}
    }
},
{
    type = "recipe",
    name = "hydronium-destruction",
    icon = "__Muria-Graphics__/graphics/icons/hydronium-destruction.png",
    enabled = false,
    energy_required = 1,
    subgroup = "muria-acidworking",
    order = "b",
    ingredients = {
        {type = "fluid", name = "hydronium",   amount = 10},
    },
    results = {
        {type = "fluid", name = "oxygen", amount = 40},
        {type = "fluid", name = "hydrogen", amount = 120}
    },
    allow_productivity = true,
    category = "chemistry",
    additional_categories = {"acidworking"},
    auto_recycle = false,
    show_amount_in_title = false,
    crafting_machine_tint =
    {
        primary = {r = 0.98, g = 0.93, b = 0.93, a = 1.000},
        secondary = {r = 0.98, g = 0.93, b = 0.93, a = 1.000},
        tertiary = {r = 0.98, g = 0.93, b = 0.93, a = 1.000},
        quaternary = {r = 0.98, g = 0.93, b = 0.93, a = 1.000},
    }
},
{
    type = "recipe",
    name = "chlorane",
    icon = "__Muria-Graphics__/graphics/icons/chlorane.png",
    enabled = false,
    subgroup = "muria-acidworking",
    order = "f",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "chlorine",   amount = 20},
        {type = "fluid", name = "hydrogen",   amount = 20},
        {type = "item", name = "sulfur",   amount = 2},
    },
    results = {
        {type = "fluid", name = "chlorane", amount = 20},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "molten-lead",
    icon = "__Muria-Graphics__/graphics/icons/molten-lead.png",
    enabled = false,
    subgroup = "muria-leadworking",
    order = "d",
    energy_required = 16,
    ingredients = {
        {type = "item", name = "lead",   amount = 10},
        {type = "fluid", name = "hydrogen",   amount = 50},
    },
    results = {
        {type = "fluid", name = "molten-lead", amount = 100},
    },
    allow_productivity = true,
    category = "leadworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "casting-lead",
    icon = "__Muria-Graphics__/graphics/icons/casting-lead-plate.png",
    enabled = false,
    subgroup = "muria-leadworking",
    order = "e",
    energy_required = 6.4,
    ingredients = {
        {type = "fluid", name = "molten-lead",   amount = 10},
        {type = "fluid", name = "chlorine",   amount = 20},
    },
    results = {
        {type = "item", name = "lead-plate", amount = 1},
    },
    allow_productivity = true,
    category = "leadworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "muria-lead-plate",
    localised_name = {"item-name.lead-plate"},
    icon = "__Muria-Graphics__/graphics/icons/lead-plate.png",
    enabled = false,
    energy_required = 6.4,
    ingredients = {
        {type = "item", name = "lead",   amount = 2},
    },
    results = {
        {type = "item", name = "lead-plate", amount = 1},
    },
    allow_productivity = true,
    category = "smelting",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "lead-pellets",
    icon = "__Muria-Graphics__/graphics/icons/lead-pellets-1.png",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "lead-plate",   amount = 2},
        {type = "fluid", name = "hydrogen",   amount = 10},
    },
    results = {
        {type = "item", name = "lead-pellets", amount = 5},
    },
    allow_productivity = true,
    category = "leadworking",
    auto_recycle = true,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "heavy-shotgun-shell",
    icon = "__Muria-Graphics__/graphics/icons/heavy-shotgun-shell.png",
    enabled = false,
    energy_required = 8,
    ingredients = {
        {type = "item", name = "shotgun-shell",   amount = 2},
        {type = "item", name = "lead-pellets",   amount = 5},
        {type = "item", name = "copper-plate",   amount = 3},
    },
    results = {
        {type = "item", name = "heavy-shotgun-shell", amount = 1},
    },
    allow_productivity = true,
    category = "crafting",
    auto_recycle = true,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "toxic-rounds-magazine",
    icon = "__Muria-Graphics__/graphics/icons/toxic-rounds-magazine.png",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "piercing-rounds-magazine",   amount = 1},
        {type = "item", name = "lead-plate",   amount = 2},
        {type = "fluid", name = "chlorane",   amount = 20},
    },
    results = {
        {type = "item", name = "toxic-rounds-magazine", amount = 1},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = true,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "inert-muriatic-science-pack",
    icon = "__Muria-Graphics__/graphics/icons/inert-muriatic-science-pack.png",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "heavy-shotgun-shell",   amount = 2},
        {type = "item", name = "eschatotaxite-paste",   amount = 5},
        {type = "item", name = "chloric-fuel",   amount = 5},
        {type = "fluid", name = "water",   amount = 10},
        {type = "fluid", name = "chlorane",   amount = 10},
    },
    results = {
        {type = "item", name = "inert-muriatic-science-pack", amount = 5},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
    emissions_multiplier = 2,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},    
},
{
    type = "recipe",
    name = "muriatic-science-pack-activation",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-science-pack-activation.png",
    enabled = false,
    subgroup = "science-pack",
    order = "l-1",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "inert-muriatic-science-pack",   amount = 1},
        {type = "fluid", name = "chlorane",   amount = 2},
    },
    results = {
        {type = "item", name = "muriatic-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1},
    },
    allow_productivity = false,
    allow_quality=false,
    category = "chemistry",
    auto_recycle = false,
    show_amount_in_title = false,
    emissions_multiplier = 3,    
},
{
    type = "recipe",
    name = "corroded-flask-recovery",
    icon = "__Muria-Graphics__/graphics/icons/corroded-flask-recovery.png",
    subgroup = "muria-acidworking",
    order = "z-3",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "corroded-flask",   amount = 5},
    },
    results = {
        {type = "fluid", name = "chlorine", amount = 5},
    },
    allow_productivity = true,
    category = "chemistry",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "acidophile-lichen-cultivation",
    icon = "__Muria-Graphics__/graphics/icons/acidophile-lichen-cultivation.png",
    enabled = false,
    energy_required = 4,
    subgroup = "muria-acidworking",
    order = "d-a",
    ingredients = {
        {type = "item", name = "acidophile-lichen",   amount = 2},
        {type = "fluid", name = "chlorine",   amount = 5},
        {type = "item", name = "nutrients",   amount = 10},
    },
    results = {
        {type = "item", name = "acidophile-lichen", amount = 4},
    },
    allow_productivity = true,
    reset_freshness_on_craft = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "nutrients-from-acidophile-lichen",
    icon = "__Muria-Graphics__/graphics/icons/nutrients-from-acidophile-lichen.png",
    enabled = false,
    subgroup = "muria-agriculture",
    order = "c-a",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "acidophile-lichen",   amount = 5},
    },
    results = {
        {type = "item", name = "nutrients", amount = 10, percent_spoiled=0.5},
    },
    allow_productivity = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "nutrients-from-eschatotaxite-sprout",
    icon = "__Muria-Graphics__/graphics/icons/nutrients-from-eschatotaxite-sprout.png",
    enabled = false,
    subgroup = "muria-agriculture",
    order = "c-b",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "eschatotaxite-sprout",   amount = 5},
    },
    results = {
        {type = "item", name = "nutrients", amount = 25},
    },
    allow_productivity = true,
    category = "organic-or-assembling",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "eschatotaxite-paste",
    icon = "__Muria-Graphics__/graphics/icons/eschatotaxite-paste.png",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "eschatotaxite-sprout",   amount = 1},
        {type = "fluid", name = "water",   amount = 10},
    },
    results = {
        {type = "item", name = "eschatotaxite-paste", amount = 10},
    },
    allow_productivity = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "chloric-fuel",
    icon = "__Muria-Graphics__/graphics/icons/chloric-fuel.png",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "acidophile-lichen",   amount = 5},
        {type = "fluid", name = "chlorine",   amount = 10},
        {type = "fluid", name = "oxygen",   amount = 5},
    },
    results = {
        {type = "item", name = "chloric-fuel", amount = 5},
    },
    allow_productivity = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "artificial-lichen-colony",
    icon = "__Muria-Graphics__/graphics/icons/artificial-lichen-colony.png",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "acidophile-lichen",   amount = 5},
        {type = "fluid", name = "chlorane",   amount = 30},
        {type = "item", name = "foundation",   amount = 10},
    },
    results = {
        {type = "item", name = "artificial-lichen-colony", amount = 10},
    },
    allow_productivity = false,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "gravity", min = 8, max = 9}},
},
{
    type = "recipe",
    name = "chlorane-from-biter-egg",
    icon = "__Muria-Graphics__/graphics/icons/chlorane-from-biter-egg.png",
    enabled = false,
    energy_required = 2,
    subgroup = "offworld-chlorane-production",
    order = "c",
    ingredients = {
        {type = "item", name = "biter-egg",   amount = 2},
        {type = "fluid", name = "water",   amount = 20},
    },
    results = {
        {type = "fluid", name = "chlorane", amount = 100},
    },
    allow_productivity = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "chlorane-from-spoilage",
    icon = "__Muria-Graphics__/graphics/icons/chlorane-from-spoilage.png",
    enabled = false,
    subgroup = "offworld-chlorane-production",
    order = "b", 
    energy_required = 2,
    ingredients = {
        {type = "item", name = "spoilage",   amount = 10},
        {type = "fluid", name = "water",   amount = 30},
    },
    results = {
        {type = "fluid", name = "chlorane", amount = 50},
    },
    allow_productivity = true,
    category = "organic",
    additional_categories = {"biovat-processes"},
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "atmospheric-acidity", max = 99}},
},
{
    type = "recipe",
    name = "oxyhydrogen-combustion",
    icon = "__Muria-Graphics__/graphics/icons/oxyhydrogen-combustion.png",
    enabled = false,
    energy_required = 2,
    subgroup = "muria-acidworking",
    order = "b-b",
    ingredients = {
        {type = "fluid", name = "oxygen",   amount = 100},
        {type = "fluid", name = "hydrogen",   amount = 200},
        {type = "item", name = "carbon",   amount = 5},
    },
    results = {
        {type = "fluid", name = "steam", amount = 5000, temperature = 500},
    },
    allow_productivity = false,
    category = "chemistry",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    crafting_machine_tint =
    {
      primary = {r = 0.409, g = 0.694, b = 0.895, a = 1.000}, 
      secondary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},
      tertiary = {r = 0.540, g = 0.520, b = 0.520, a = 1.000}, 
      quaternary = {r = 0.750, g = 0.750, b = 0.750, a = 1.000}, 
    }
},
{
    type = "recipe",
    name = "chlorane-explosives",
    icon = "__Muria-Graphics__/graphics/icons/chlorane-explosives.png",
    enabled = false,
    subgroup = "muria-alt-recipes",
    order = "c",
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "oxygen",   amount = 10},
        {type = "fluid", name = "chlorane",   amount = 15},
        {type = "item", name = "carbon",   amount = 5},
    },
    results = {
        {type = "item", name = "explosives", amount = 2},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "chlorane-lead-battery",
    icon = "__Muria-Graphics__/graphics/icons/chlorane-lead-battery.png",
    enabled = false,
    subgroup = "muria-alt-recipes",
    order = "b",
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "chlorane",   amount = 10},
        {type = "item", name = "iron-stick",   amount = 2},
        {type = "item", name = "lead-plate",   amount = 2},
    },
    results = {
        {type = "item", name = "battery", amount = 2},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "water-electrolysis",
    icon = "__Muria-Graphics__/graphics/icons/water-electrolysis.png",
    enabled = false,
    subgroup = "fluid-recipes",
    order = "e",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "water",   amount = 10},
        {type = "item", name = "copper-cable",   amount = 2},
    },
    results = {
        {type = "fluid", name = "oxygen",   amount = 10},
        {type = "fluid", name = "hydrogen",   amount = 20},
    },
    allow_productivity = false,
    category = "chemistry",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "atmospheric-acidity", max = 99}},
    crafting_machine_tint =
    {
      primary = {r = 0.409, g = 0.694, b = 0.895, a = 1.000}, 
      secondary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},
      tertiary = {r = 0.540, g = 0.520, b = 0.520, a = 1.000}, 
      quaternary = {r = 0.750, g = 0.750, b = 0.750, a = 1.000}, 
    }
},
{
    type = "recipe",
    name = "crude-oil-from-eschatotaxite-paste",
    icon = "__Muria-Graphics__/graphics/icons/crude-oil-from-eschatotaxite-paste.png",
    enabled = false,
    energy_required = 2.5,
    subgroup = "muria-agriculture",
    order = "d",
    ingredients = {
        {type = "item", name = "eschatotaxite-paste",   amount = 5},
        {type = "fluid", name = "chlorine",   amount = 20},
    },
    results = {
        {type = "fluid", name = "crude-oil",   amount = 50},
    },
    allow_productivity = true,
    category = "oil-processing",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "acidthrower-ammo",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-capsule.png",
    enabled = false,
    energy_required = 12,
    ingredients = {
        {type = "item", name = "lead-plate",   amount = 5},
        {type = "item", name = "nutrients",   amount = 2},
        {type = "fluid", name = "chlorane",   amount = 25},
        {type = "fluid", name = "sulfuric-acid",   amount = 25},
    },
    results = {
        {type = "item", name = "acidthrower-ammo",   amount = 50},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "acidthrower",
    icon = "__Muria-Graphics__/graphics/icons/muriatic-gun.png",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "item", name = "lead-plate",   amount = 5},
        {type = "item", name = "anti-corrosion-cladding",   amount = 5},
        {type = "item", name = "iron-gear-wheel",   amount = 15},
        {type = "item", name = "biter-egg",   amount = 1},
        {type = "item", name = "carbon-fiber",   amount = 5},
    },
    results = {
        {type = "item", name = "acidthrower",   amount = 1},
    },
    allow_productivity = true,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
 {
    type = "recipe",
    name = "oxygenated-copper-bacteria-cultivation",
    icon = "__Muria-Graphics__/graphics/icons/oxygenated-copper-bacteria-cultivation.png",
    category = "organic",
    additional_categories = {"biovat-processes"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-d[bacteria]-d[copper-bacteria-cultivation]-b",
    enabled = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "copper-bacteria", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      {type = "fluid", name = "oxygen",   amount = 5},
    },
    results =
    {
      {type = "item", name = "copper-bacteria", amount = 8}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000},
      secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000}, 
    },
    show_amount_in_title = false
  },
  {
    type = "recipe",
    name = "oxygenated-iron-bacteria-cultivation",
    icon = "__Muria-Graphics__/graphics/icons/oxygenated-iron-bacteria-cultivation.png",
    category = "organic",
    additional_categories = {"biovat-processes"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-d[bacteria]-b[iron-bacteria-cultivation]-b",
    enabled = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "iron-bacteria", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      {type = "fluid", name = "oxygen",   amount = 5},
    },
    results =
    {
      {type = "item", name = "iron-bacteria", amount = 8}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
      secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
    },
    show_amount_in_title = false
  },
  {
    type = "recipe",
    name = "holmium-chloride",
    icon = "__Muria-Graphics__/graphics/icons/holmium-chloride.png",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "fluid", name = "chlorane",   amount = 20},
        {type = "fluid", name = "holmium-solution",   amount = 50},
    },
    results = {
        {type = "item", name = "holmium-chloride", amount = 1},
    },
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99,
        max = 99
      }
    },
},
{
    type = "recipe",
    name = "chlorane-oxidation",
    icon = "__Muria-Graphics__/graphics/icons/chlorane-oxidation.png",
    enabled = false,
    subgroup = "offworld-chlorane-production",
    order = "a", 
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "chlorane",   amount = 20},
        {type = "fluid", name = "oxygen",   amount = 5},
        {type = "item", name = "calcite",   amount = 1},
    },
    results = {
        {type = "fluid", name = "chlorine", amount = 10},
        {type = "fluid", name = "water", amount = 10},
    },
    allow_productivity = false,
    category = "acidworking",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "atmospheric-acidity", max = 99}},
},
{
    type = "recipe",
    name = "polyvinyl-chloride",
    icon = "__Muria-Graphics__/graphics/icons/polyvinyl-chloride.png",
    enabled = false,
    subgroup = "raw-material",
    order = "b[chemistry]-b[plastic-bar]-c",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "chlorine",   amount = 10},
        {type = "fluid", name = "petroleum-gas",   amount = 20},
    },
    results = {
        {type = "item", name = "plastic-bar", amount = 2},
    },
    allow_productivity = false,
    category = "chemistry",
    additional_categories = {"acidworking"},
    auto_recycle = false,
    show_amount_in_title = false,
},
{
    type = "recipe",
    name = "hydrogenated-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "fluid", name = "hydrogen", amount = 150},
      {type = "fluid", name = "crude-oil", amount = 100}
    },
    results =
    {
      {type = "fluid", name = "heavy-oil", amount = 50},
      {type = "fluid", name = "light-oil", amount = 75},
      {type = "fluid", name = "petroleum-gas", amount = 100}
    },
    allow_productivity = true,
    icon = "__Muria-Graphics__/graphics/icons/hydrogenated-oil-processing.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[hydrogenated-oil-processing]"
  },
  {
    type = "recipe",
    name = "eschatotaxite-carbon-fiber",
    icon = "__Muria-Graphics__/graphics/icons/eschatotaxite-carbon-fiber.png",
    category = "organic",
    additional_categories = {"biovat-processes"},
    subgroup = "muria-alt-recipes",
    order = "e",
    auto_recycle = false,
    energy_required = 6,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "eschatotaxite-paste", amount = 10},
      {type = "fluid", name = "hydrogen", amount = 5},
      {type = "item", name = "carbon", amount = 2}
    },
    results = {{type="item", name="carbon-fiber", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 9, g = 0, b = 220, a = 1.000},
      secondary = {r = 0, g = 0, b = 0, a = 1.000},
    },
  },
   {
    type = "recipe",
    name = "eschatotaxite-low-density-structure",
    icon = "__Muria-Graphics__/graphics/icons/eschatotaxite-low-density-structure.png",
    category = "organic",
    subgroup = "muria-alt-recipes",
    order = "d",
    additional_categories = {"biovat-processes"},
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 3},
      {type = "item", name = "copper-plate", amount = 15},
      {type = "fluid", name = "chlorine", amount = 20},
      {type = "item", name = "eschatotaxite-paste", amount = 10}
    },
    results = {{type="item", name="low-density-structure", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kerolox-rocket-fuel",
    icon = "__Muria-Graphics__/graphics/icons/kerolox-rocket-fuel.png",
    energy_required = 10,
    enabled = false,
    category = "organic-or-chemistry",
    additional_categories = {"acidworking", "biovat-processes"},
    subgroup = "muria-alt-recipes",
    order = "a",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 2},
      {type="fluid", name = "light-oil", amount= 10},
      {type="fluid", name = "oxygen", amount = 10}
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.996, g = 0.742, b = 0.408, a = 1.000}, -- #febd68ff
      secondary = {r = 0.446, g = 0.392, b = 0.168, a = 1.000}, -- #71632aff
      tertiary = {r = 0.347, g = 0.388, b = 0.387, a = 1.000}, -- #586262ff
      quaternary = {r = 0.656, g = 0.562, b = 0.264, a = 1.000}, -- #a78f43ff
    }
  },
  {
    type = "recipe",
    name = "solid-fuel-from-hydrogen",
    enabled = false,
    subgroup = "muria-alt-recipes",
    order = "a-b",
    icon = "__Muria-Graphics__/graphics/icons/solid-fuel-from-hydrogen.png",
    icon_size = 64,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "hydrogen",   amount = 30},
        {type = "item", name = "sulfur", amount = 2},
    },
    results = {
        {type = "item", name = "solid-fuel", amount = 2}
    },
    allow_productivity = true,
    category = "chemistry",
    auto_recycle = true,
    show_amount_in_title = false,
    crafting_machine_tint =
    {
        primary = {r = 0.40, g = 0.55, b = 0.71, a = 1.000},
        secondary = {r = 0.40, g = 0.55, b = 0.71, a = 1.000},
        tertiary = {r = 0.40, g = 0.55, b = 0.71, a = 1.000},
        quaternary = {r = 0.40, g = 0.55, b = 0.71, a = 1.000},
    }
},
{
    type = "recipe",
    name = "casting-lead-pellets",
    icon = "__Muria-Graphics__/graphics/icons/casting-lead-pellets.png",
    enabled = false,
    subgroup = "muria-leadworking",
    order = "e-b",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "molten-lead",   amount = 10},
        {type = "fluid", name = "hydrogen",   amount = 20},
    },
    results = {
        {type = "item", name = "lead-pellets", amount = 5},
    },
    allow_productivity = true,
    category = "leadworking",
    auto_recycle = false,
    show_amount_in_title = false,
},
 {
    type = "recipe",
    name = "leaded-fuel",
    enabled = false,
    icon_size = 64,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "rocket-fuel", amount = 1},
      {type = "item", name = "lead-pellets", amount = 5},
      {type = "fluid", name = "heavy-oil", amount = 20}
    },
    results = {{type="item", name="leaded-fuel", amount=1}},
    allow_productivity = true,
    category = "chemistry",
    auto_recycle = true,
    show_amount_in_title = false,
    emissions_multiplier = 5,
    crafting_machine_tint =
    {
      primary = {r = 0.889, g = 0.628, b = 0.566, a = 1.000},
      secondary = {r = 0.803, g = 0.668, b = 0.644, a = 1.000}, 
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000},
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000},
    }
},
 {
    type = "recipe",
    name = "anti-corrosion-cladding",
    enabled = false,
    icon_size = 64,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lead-plate", amount = 5},
      {type = "item", name = "eschatotaxite-paste", amount = 2},
      {type = "fluid", name = "hydrogen", amount = 20}
    },
    results = {{type="item", name="anti-corrosion-cladding", amount=1}},
    allow_productivity = true,
    category = "acidworking",
    auto_recycle = true,
    show_amount_in_title = false,
    emissions_multiplier = 5,
},
{
    type = "recipe",
    name = "vulcanusian-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/vulcanusian-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "stone",      amount = 5},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "sulfuric-acid", amount = 20, probability = 0.10},
        {type = "fluid", name = "hydrogen", amount = 5, probability = 0.001},
        {type = "item", name = "carbon", amount = 3, probability = 0.05}, 
        {type = "item", name = "sulfur", amount = 2, probability = 0.02},
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "pressure", min = 4000, max = 4000}}
},
{
    type = "recipe",
    name = "nauvitian-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/nauvitian-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "calcite",      amount = 2},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "oxygen", amount = 20, probability = 0.02},
        {type = "fluid", name = "hydrogen", amount = 5, probability = 0.01},
        {type = "item", name = "carbon", amount = 2, probability = 0.05}, 
        {type = "item", name = "sulfur", amount = 1, probability = 0.01}, 
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "pressure", min = 1000, max = 1000}, {property = "magnetic-field", min = 90, max = 90}}
},
{
    type = "recipe",
    name = "gleban-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/gleban-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "sulfuric-acid",      amount = 25},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "oxygen", amount = 25, probability = 0.05},
        {type = "fluid", name = "hydrogen", amount = 5, probability = 0.01},
        {type = "item", name = "spoilage", amount = 3, probability = 0.05}, 
        {type = "item", name = "yumako-seed", amount = 1, probability = 0.01}, 
        {type = "item", name = "jellynut-seed", amount = 1, probability = 0.01}, 
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "pressure", min = 2000, max = 2000}, {property = "gravity", min = 20, max = 20}}
},
{
    type = "recipe",
    name = "fulgoran-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/fulgoran-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "calcite",      amount = 5},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "petroleum-gas", amount = 20, probability = 0.10},
        {type = "fluid", name = "chlorine", amount = 5, probability = 0.01},
        {type = "item", name = "ice", amount = 3, probability = 0.05}, 
        {type = "item", name = "stone", amount = 2, probability = 0.03}, 
        {type = "item", name = "holmium-ore", amount = 1, probability = 0.005}, 
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "magnetic-field", min = 99, max = 99}, {property = "pressure", min = 800, max = 800}}
},
{
    type = "recipe",
    name = "aquiloan-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/aquiloan-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "spoilage",      amount = 2},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "ammonia", amount = 10, probability = 0.20}, 
        {type = "fluid", name = "fluorine", amount = 10, probability = 0.05}, 
        {type = "item", name = "ice", amount = 2, probability = 0.10},
        {type = "item", name = "lithium", amount = 1, probability = 0.005}, 
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "pressure", min = 300, max = 300}}
},
{
    type = "recipe",
    name = "murian-air-scrubbing",
    icon = "__Muria-Graphics__/graphics/icons/murian-air-scrubbing.png",
    subgroup = "scrubbing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "eschatotaxite-sprout",      amount = 1},
        {type = "fluid", name = "water",      amount = 100},
    },
    results = {
        {type = "fluid", name = "water", amount = 10},
        {type = "fluid", name = "chlorine", amount = 10, probability = 0.20}, 
        {type = "fluid", name = "hydrogen", amount = 10, probability = 0.05}, 
        {type = "item", name = "acidophile-lichen", amount = 1, probability = 0.01},
        {type = "item", name = "chlorine-salts", amount = 1, probability = 0.01}, 
    },
    allow_productivity = false,
    allow_quality = false,
    category = "scrubbing",
    auto_recycle = false,
    show_amount_in_title = false,
    surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
},
{
        type = "recipe",
        name = "muria-rocket-part",
        icons = {
            { icon = "__base__/graphics/icons/rocket-part.png", icon_size = 64 },
            { icon = "__Muria-Graphics__/graphics/icons/muria.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
        },
        energy_required = 2,
        enabled = false,
        hide_from_player_crafting = true,
        auto_recycle = false,
        category = "rocket-building",
        ingredients = {
            { type = "item", name = "processing-unit", amount = 1 },
            { type = "item", name = "leaded-fuel", amount = 1 },
            { type = "item", name = "anti-corrosion-cladding", amount = 1 },
        },
        surface_conditions = {{property = "atmospheric-acidity", min = 100, max = 100}},
        results = { { type = "item", name = "rocket-part", amount = 1 } },
        allow_productivity = true,
    },
}