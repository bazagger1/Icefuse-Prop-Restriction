--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/cache/sh_cache.lua
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

local SERVER = SERVER

--------------------------------------------------

singleton('cache', {

    ['whitelist_models'] = {},
    ['whitelist_tools'] = {},
    ['whitelist_touch'] = {},

    ['player.categories'] = {},
    ['player.spawn_model'] = {},
    ['player.touch_entity'] = {}

})

--[[
- @param string|nil name
-
- @return table
]]
function Addon.cache(name)

    if name == nil then
        return singleton('cache')
    end

    return singleton('cache')[name]
end
local cache = Addon.cache

--------------------------------------------------

--[[
- Resets the whole cache.
]]
function Addon.resetCache()

    Addon.recacheWhitelistTools()
    Addon.recacheWhitelistTouch()

    if SERVER then
        Addon.recacheModelWhitelist()
    end

    Addon.resetAllPlayerCache()

end
