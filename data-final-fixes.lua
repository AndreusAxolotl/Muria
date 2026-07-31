local cmu = require("collision-mask-util")

for _, asteroid in pairs(data.raw.asteroid or {}) do
    local mask = cmu.get_mask(asteroid)
    mask.layers.trigger_target = true
    asteroid.collision_mask = mask
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