--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/cache/sh_whitelist.lua
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

--[[
- @param table target
]]
local function addAllToolsToTable(target)

    target['physgun'] = {}

    for name, _ in pairs(weapons.Get('gmod_tool').Tool) do
        target[name] = {}
    end

    return target
end

--------------------------------------------------
-- Rechacing whitelists

local cache_whitelistTools = cache('whitelist_tools')
local cache_whitelistTouch = cache('whitelist_touch')

--[[
-
]]
function Addon.recacheWhitelistTools()
    local config_whitelistTools = config('whitelist_tools')

    config_whitelistTools['_editor'] = 'any'

    -- Clear the cache
    table.Empty(cache_whitelistTools)

    for category, tools in pairs(config_whitelistTools) do
        
        if tools == 'any' then

            -- Add all tools when all
            tools = addAllToolsToTable({})

        end

        assert(type(tools) == 'table', string.format("Expected table for category '%s'", category))

        -- Add the category to the tools
        for _, tool in ipairs(tools) do

            if cache_whitelistTools[tool] == nil then
                cache_whitelistTools[tool] = {}
            end

            table.insert(cache_whitelistTools[tool], category)

        end

    end

end

--[[
-
]]
function Addon.recacheWhitelistTouch()
    local config_whitelistTouch = config('whitelist_touch')

    -- Clear the cache
    table.Empty(cache_whitelistTouch)

    -- Add all tools.. (so that we dont have to check whether the tool exists)
    addAllToolsToTable(cache_whitelistTouch)

    for tool, categories in pairs(config_whitelistTouch) do
        for category, classes in pairs(categories) do
            for _, class in ipairs(classes) do

                if cache_whitelistTouch[tool] == nil then -- Only the case when a tool does not existo n the server
                    cache_whitelistTouch[tool] = {}
                end

                if cache_whitelistTouch[tool][class] == nil then
                    cache_whitelistTouch[tool][class] = {}
                end

                table.insert(cache_whitelistTouch[tool][class], category)

            end
        end
    end

    Addon.resetAllPlayerCache(false)

end
