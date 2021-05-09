--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/cache/sh_player_categories.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP

local identifier = Addon.identifier
local cache = Addon.cache
local config = Addon.config

--------------------------------------------------

local playerMeta = FindMetaTable('Player')

--[[
- TODO
-
- @return bool
]]
function playerMeta:isDonatorTier()
    return true
end

--------------------------------------------------
-- Player categories

local config_categories = config('categories')

local cache_playerCategories = cache('player.categories')

--[[
- Checks whether a player belongs to a category.
-
- @param player ply
- @param string category
-
- @return bool
]]
function Addon.playerBelongsToCategory(ply, category)
    return cache_playerCategories[ply][category] == true
end

--[[
- Checks whether a player belongs to one of the given categories.
-
- @param player ply
- @param string[] categories
-
- @return bool
]]
function Addon.playerBelongsToOneCategory(ply, categories)
    local playerCategories = cache_playerCategories[ply]

    for i=1, #categories do
        if playerCategories[categories[i]] == true then
            return true
        end
    end

    return false
end

--[[
- (Re)caches the categories for a player.
-
- @param player ply
]]
function Addon.recachePlayerCategories(ply)

    -- Clear the cache for the player...
    cache_playerCategories[ply] = {}

    for category, options in pairs(config_categories) do
        local groups = options.groups or 'any'
        local tier = options.tier or 'any'
        local custom = options.custom or nil

        -- Custom
        if custom ~= nil then
            assert(type(custom) == 'function', "Exected option `custom` to be a function.")

            if custom(ply) == false then
                continue
            end

        end

        -- Check if the player has one of the user groups..
        if groups ~= 'any' then
            assert(type(groups) == 'table', "Expected option `groups` to be 'any' (nil) or a table with user groups..")

            for _, group in ipairs(groups) do
                if ply:IsUserGroup(group) then

                    goto hasUserGroup
                end
            end

            continue -- Continue, not in user group
        end
        ::hasUserGroup::

        -- Check if the player is the given donator tier
        if tier ~= 'any' then
            assert(type(tier) == 'number', "Expected option `tier` to be a number.")

            if not ply:isDonatorTier(tier) then
                continue
            end

        end

        -- Add the category to the player
        cache_playerCategories[ply][category] = true

    end

end
