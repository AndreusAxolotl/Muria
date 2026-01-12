if data.raw["agricultural-tower"]["agricultural-tower"] and not data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds then
  data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds = {}
  for _, _type in pairs({"item", "tool", "module", "capsule"}) do
    for _, seed in pairs(data.raw[_type]) do
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