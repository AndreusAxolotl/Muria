local simulations = {}
simulations.muria_briefing =
{
  init_update_count = 3000,
  planet = "muria",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "acidophile-lichen"}}
      end
    end

    for k, position in pairs ({{-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-11, 6}, {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "muriatic-solution"}}
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "muriatic-soil-dark"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "acidophile-lichen"}}
    end

    for k, position in pairs ({{3, 6}, {4, 6}, {5, 6}, {6, 6}, {8, 6}, {9, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "muriatic-solution"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "muriatic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[1].set_tiles{{position = position, name = "acidophile-lichen"}}
    end

    game.surfaces[1].create_entity{name = "metallic-lichen-colony", position = {4.5, -0.5}}
    game.surfaces[1].create_entity{name = "metallic-lichen-colony", position = {8.5, -3.5}}

    local create_list = {}
    table.insert(create_list, { name = "crater-small", position = {-3, 0}, amount = 1})
    for k, position in pairs ({{-10, -3}, {-8, -3}, {4, -3},
                               {8, 1}}) do
      table.insert(create_list, { name = "calcite-stain-small", position = position, amount = 1})
    end
    for k, position in pairs ({{-10, 2},
                               {-8, 3}, {-7, 3}, {5, 3}, {7, 3},
                               {3, 4}, {6, 4},
                               {1, 5}}) do
      table.insert(create_list, { name = "tiny-rock-cluster", position = position, amount = 1})
    end
    game.surfaces[1].create_decoratives{decoratives = create_list}

  ]]
}

data:extend(
{
  {
    type = "tips-and-tricks-item",
    name = "muria-briefing",
    tag = "[planet=muria]",
    category = "space-age",
    order = "x-a",
    trigger =
    {
      type = "research",
      technology = "planet-discovery-muria"
    },
    skip_trigger =
    {
      type = "change-surface",
      surface = "muria"
    },
    simulation = simulations.muria_briefing
  },
{
    type = "tips-and-tricks-item",
    name = "acid-immunity-list",
    tag = "[item=acidthrower-ammo]",
    category = "space-age",
    order = "x-b",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "planet-discovery-muria"
    },
  }})