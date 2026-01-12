local surface = game.get_surface("muria")
if not surface then return end

local mgs = surface.map_gen_settings
mgs.autoplace_settings.entity.settings["big-chloric-rock"] = {}
surface.map_gen_settings = mgs
-- mgs stands for metal gear solid and not map gen settings trust
game.print(
			"[Muria]: If you don't find any big chloric rocks, just load some new chunks and you'll find some!")