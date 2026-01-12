local DAMAGE_INTERVAL = 240         -- ticks
local DAMAGE_AMOUNT = 25            -- how much damage per cycle
local MINED_DAMAGE_AMOUNT = 25      -- how much damage is done to player or robot when mining lichen
local DESTROYED_ALERT_AMOUNT = 5    -- how many times the warning is sent to players about a building getting destroyed by planet
local POLLUTION_ABSORB_AMOUNT = 25  -- how much pollution is absorbed by the trees on harvest

local DAMAGE_TYPE = "toxic"         -- damage type to use
local TARGET_SURFACE = "muria"      -- change to your planet/surface name

-- List of immune entities for galvanized machines or wtv
local immunity = {
    ["acidworking-plant"] = true,
    ["smelting-plant"] = true,
    ["burner-inserter"] = true,
    ["inserter"] = true,
    ["long-handed-inserter"] = true,
    ["transport-belt"] = true,
    ["underground-belt"] = true,
    ["rocket-silo"] = true,
    ["cargo-bay"] = true,
    ["fast-transport-belt"] = true,
    ["fast-underground-belt"] = true,
    ["cargo-landing-pad"] = true,
    ["biovat"] = true,
}

local production_types = {
    ["assembling-machine"] = true,
    ["furnace"] = true,
    ["pipe"] = false,
    ["pipe-to-ground"] = false,
    ["pump"] = false,
    ["storage-tank"] = false,
    ["inserter"] = true,
    ["transport-belt"] = true,
    ["underground-belt"] = true,
    ["splitter"] = true,
    ["logistic-robot"] = true,
    ["construction-robot"] = true,
    ["lab"] = true,
    ["car"] = true,
}

local production_types_list = {}

for type,enabled in pairs(production_types) do
    if enabled then
        table.insert(production_types_list, type) -- convert map to list so it can be used for filtering
    end
end

local function get_chunk_position_from_entity(entity)
    return {
        x = math.floor(entity.position.x / 32) * 32,
        y = math.floor(entity.position.y / 32) * 32
    }
end

local function convert_chunk_pos_to_key(position)
    return tostring(position.x)..":"..tostring(position.y)
end

local function track_entity(entity)
    local chunk_pos = get_chunk_position_from_entity(entity)
    local chunk_key = convert_chunk_pos_to_key(chunk_pos)
    storage.entity_map[entity.unit_number] = chunk_key
    if not storage.chunks[chunk_key] then
        storage.chunks[chunk_key] = {
            position = chunk_pos,
            entities = {},
            total_entities = 0
        }
    end
    storage.chunks[chunk_key].entities[entity.unit_number] = entity
    storage.chunks[chunk_key].total_entities = storage.chunks[chunk_key].total_entities + 1
end

local function on_init()
    storage.entity_map = {}
    storage.chunks = {}
    storage.destroyed_alerts = 0
    storage.destroyed_alerts_last_tick = 0
end

local function on_configuration_changed()
    if type(storage.destroyed_alerts) ~= "number" then storage.destroyed_alerts = 0 end
    if type(storage.destroyed_alerts_last_tick) ~= "number" then storage.destroyed_alerts_last_tick = 0 end
    storage.entity_map = {}
    storage.chunks = {}
    local surface = game.surfaces[TARGET_SURFACE]
    if surface then
        local entities = surface.find_entities_filtered { type = production_types_list, force = "player" }
        for _, entity in pairs(entities) do
            if entity.valid and entity.health and entity.health > 0 and entity.destructible then
                if not immunity[entity.name] then
                    track_entity(entity)
                end
            end
        end
    end
end

local function on_nth_tick(event)
    local surface = game.surfaces[TARGET_SURFACE]
    if surface then
        for _,chunk in pairs(storage.chunks) do
            if surface.get_pollution(chunk.position) > 0 then
                for _,entity in pairs(chunk.entities) do
                    if entity.valid and entity.health > 0 then
                        surface.pollute(entity.position, -0.1, entity.prototype)
                        entity.health = entity.health - DAMAGE_AMOUNT -- damage without sending entity_under_attack alert
                        if entity.health <= 0 then
                            entity.health = 1 -- to ensure entity.damage kills entity, even through resistances
                            entity.damage(DAMAGE_AMOUNT, "neutral", DAMAGE_TYPE)
                            if storage.destroyed_alerts < DESTROYED_ALERT_AMOUNT and storage.destroyed_alerts_last_tick ~= event.tick then
                                storage.destroyed_alerts_last_tick = event.tick
                                storage.destroyed_alerts = storage.destroyed_alerts + 1
                                for _,player in pairs(game.players) do
                                    player.print({"planet-effect-alert.muria-corrosive-effect-destroyed-entity"})
                                end
                            end
                        end
                    end 
                end
            end
        end 
    end
end

local function on_entity_built(event)
    local entity = event.entity
    if entity and entity.valid then
        if entity.surface.name == TARGET_SURFACE and production_types[entity.type] then
            if entity.health and entity.health > 0 and entity.destructible then
                if not immunity[entity.name] then
                    track_entity(entity)
                end
            end 
        end
    end
end

local function on_tower_mined_plant(event)
    local entity = event.plant or event.entity
    if entity and entity.valid then
        if entity.name == "metallic-lichen-colony" or entity.name == "cotunnite-lichen-colony" then
            local surface = entity.surface
            surface.create_trivial_smoke({name = "lichen-acid-cloud", position = entity.position})
        end
        if entity.name == "eschatotaxite" then
            local surface = entity.surface
            surface.pollute(entity.position, -POLLUTION_ABSORB_AMOUNT, entity.prototype)
        end
    end
end

local function on_entity_destroyed(event)
    local entity = event.entity
    if entity and entity.valid then
        if storage.entity_map[entity.unit_number] then
            local chunk_key = storage.entity_map[entity.unit_number]
            storage.chunks[chunk_key].entities[entity.unit_number] = nil
            storage.entity_map[entity.unit_number] = nil
            storage.chunks[chunk_key].total_entities = storage.chunks[chunk_key].total_entities - 1
            if storage.chunks[chunk_key].total_entities <= 0 then 
                storage.chunks[chunk_key] = nil
            end
        end
        if entity.name == "metallic-lichen-colony" or entity.name == "cotunnite-lichen-colony" then
            local surface = entity.surface
            surface.create_trivial_smoke({name = "lichen-acid-cloud", position = entity.position})
            mining_entity = event.robot
            if event.player_index then
                mining_entity = game.players[event.player_index] and game.players[event.player_index].character
            end
            if mining_entity and mining_entity.valid then
                mining_entity.damage(MINED_DAMAGE_AMOUNT, "neutral", DAMAGE_TYPE)
            end
            surface.pollute(entity.position, entity.prototype.harvest_emissions["acids"] , entity.prototype)
        end
        if entity.name == "eschatotaxite" then
            local surface = entity.surface
            surface.pollute(entity.position, -POLLUTION_ABSORB_AMOUNT, entity.prototype)
        end
    end 
end

script.on_init(on_init)
script.on_configuration_changed(on_configuration_changed)
script.on_nth_tick(DAMAGE_INTERVAL, on_nth_tick)

script.on_event(defines.events.on_tower_mined_plant, on_tower_mined_plant)

-- on_entity_built
script.on_event(defines.events.on_built_entity, on_entity_built)
script.on_event(defines.events.on_robot_built_entity, on_entity_built)
script.on_event(defines.events.script_raised_built, on_entity_built)
script.on_event(defines.events.script_raised_revive, on_entity_built)
--script.on_event(defines.events.on_entity_cloned, on_built)

-- on_entity_destroyed
script.on_event(defines.events.on_player_mined_entity, on_entity_destroyed)
script.on_event(defines.events.on_robot_mined_entity, on_entity_destroyed)
script.on_event(defines.events.on_entity_died, on_entity_destroyed)
script.on_event(defines.events.script_raised_destroy, on_entity_destroyed)
script.on_event(defines.events.script_raised_destroy, on_entity_destroyed)