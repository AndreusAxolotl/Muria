local cmu = require("collision-mask-util")

for _, asteroid in pairs(data.raw.asteroid or {}) do
    local mask = cmu.get_mask(asteroid)
    mask.layers.trigger_target = true
    asteroid.collision_mask = mask
end