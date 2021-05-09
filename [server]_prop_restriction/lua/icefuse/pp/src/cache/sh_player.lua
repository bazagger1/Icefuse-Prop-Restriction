--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/cache/sh_player.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP

local identifier = Addon.identifier
local singleton = Addon.singleton
local cache = Addon.cache

--------------------------------------------------
-- Player cache

local cache_playerCategories = cache('player.categories')
local cache_playerSpawnModel = cache('player.spawn_model')
local cache_playerTouchEntity = cache('player.touch_entity')

--[[
- Initialize the cache for a player.
-
- @param player ply
]]
function Addon.initializePlayerCache(ply)

    cache_playerSpawnModel[ply] = {}
    cache_playerTouchEntity[ply] = {}

    -- Recache the categories..
    Addon.recachePlayerCategories(ply)

    -- Add all tools.. (so that we dont have to check whether the tool exists)
    for name, _ in pairs(weapons.Get('gmod_tool').Tool) do
        cache_playerTouchEntity[ply][name] = {}
    end
    cache_playerTouchEntity[ply]['physgun'] = {}

end

--[[
- Clears the cache of a player.
-
- @param player ply
]]
function Addon.clearPlayerCache(ply)

    cache_playerSpawnModel[ply] = nil
    cache_playerTouchEntity[ply] = nil
    cache_playerCategories[ply] = nil

end

--[[
- Resets the whole player cache for a player.
-
- @param player ply
]]
function Addon.resetPlayerCache(ply)

    Addon.clearPlayerCache(ply)
    Addon.initializePlayerCache(ply)

end

--[[
- Resets the whole player cache for all players.
]]
function Addon.resetAllPlayerCache()

    for _, ply in ipairs(player.GetAll()) do
        Addon.resetPlayerCache(ply)
    end

end
