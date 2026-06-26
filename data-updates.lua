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

data.raw.planet["muria"].surface_properties["temperature"] = 320

require "compat.bzlead"
require "compat.scrubbing"

PlanetsLib.assign_rocket_part_recipe("muria", "muria-rocket-part", true)