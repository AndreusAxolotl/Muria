data:extend(
{
  {
    type = "airborne-pollutant",
    name = "acids",
    chart_color = {r = 150, g = 45, b = 91, a = 164},
    icon =
    {
      filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
      priority = "high",
      size = 64,
      mipmap_count = 2,
      y = 3 * 64,
      flags = {"gui-icon"}
    },
    affects_evolution = false,
    affects_water_tint = false,
    damages_trees = false,
  }
})

--add an icon to the base game acid-cloud so it may show up in tooltips:
data.raw["smoke-with-trigger"]["acid-cloud"].icons = {
  {
      icon = "__base__/graphics/icons/tooltips/tooltip-category-steam.png",
      icon_size = 40,
      tint = {r = 1, g = 0, b = 0}
  }
}
