--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/sh_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP or {

    _version = '0.1.8',

    _name = 'Icefuse Prop Protection',
    _identifier = 'icefuse.pp',

    _library = {},
    _instance = {},
    _singleton = {},
    _originals = {},
    _config = {}

}
IcefusePP = Addon

--------------------------------------------------
-- Utilities

--[[
- @return string
]]
function Addon.version()
    return Addon._version
end

--[[
- @param ...
-
- @return string
]]
function Addon.identifier(...)

    if #{...} == 0 then
        return Addon._identifier
    end

    return table.concat({Addon._identifier, ...}, '.')
end

--[[
- @param string name
- @param table|nil value
- @param bool|nil singleton
-
- @return table
]]
function Addon.library(name, value, singleton)
    assert(type(name) == 'string')

    if value ~= nil then
        if singleton == true then

            if Addon._library[name] == nil then
                Addon._library[name] = value
            end

        else
            Addon._library[name] = value
        end
    end

    assert(Addon._library[name] ~= nil, string.format("Library '%s' not found.", name))
    return Addon._library[name]
end

--[[
- @param string name
- @param any value
- @param bool|nil force
-
- @return any
]]
function Addon.instance(name, value, force)
    assert(type(name) == 'string')

    if force == true or value ~= nil then
        Addon._instance[name] = value
    end

    return Addon._instance[name]
end

--[[
- @param string name
- @param table|nil value
-
- @return table
]]
function Addon.singleton(name, value)
    assert(type(name) == 'string')

    if Addon._singleton[name] == nil then
        value = value == nil and {} or value
        assert(type(value) == 'table')

        Addon._singleton[name] = value

    end

    assert(Addon._singleton[name] ~= nil, string.format("Singleton '%s' not found.", name))
    return Addon._singleton[name]
end

--[[
- @param string name
-
- @return table
]]
function Addon.config(name)

    if name == nil then
        return Addon._config
    end

    if Addon._config[name] == nil then
        Addon._config[name] = {}
    end

    return Addon._config[name]
end

--[[
- @param string name
- @param any value - Not a nil value
-
- @return table
]]
function Addon.keepOriginal(name, value)

    if name == nil then
        return Addon._originals[name]
    end

    if Addon._originals[name] == nil then
        Addon._originals[name] = value
    end

    return Addon._originals[name]
end

--[[
- Includes a file.
- @arg string file
- @arg string type
]]
function Addon.include(file, type)
    if type == 'server' or type == 'shared' then
        if SERVER then
            include(file)
        end
    end
    if type == 'client' or type == 'shared' then
        if SERVER then
            AddCSLuaFile(file)
        else
            include(file)
        end
    end
end

--------------------------------------------------
-- Include files

Addon.include('lib/sh_class.lua', 'shared')
Addon.include('lib/cl_component.lua', 'client')

Addon.include('src/sh_util.lua', 'shared')

Addon.include('src/cache/sh_cache.lua', 'shared')
Addon.include('src/cache/sh_player.lua', 'shared')
Addon.include('src/cache/sh_player_categories.lua', 'shared')
Addon.include('src/cache/sh_whitelist.lua', 'shared')
Addon.include('src/cache/sv_whitelist.lua', 'server')

Addon.include('src/core/sh_touch_entity.lua', 'shared')
Addon.include('src/core/sv_spawn_entity.lua', 'server')
Addon.include('src/core/cl_spawn_entity.lua', 'client')

Addon.include('src/editor/sh_editor.lua', 'shared')
Addon.include('src/editor/sv_editor.lua', 'server')

Addon.include('src/buddies/sv_buddies.lua', 'server')
Addon.include('src/buddies/cl_buddies.lua', 'client')

Addon.include('src/sv_model_whitelist.lua', 'server')

Addon.include('src/core/sv_watch.lua', 'server')
Addon.include('src/core/cl_watch.lua', 'client')

Addon.include('src/cl_misc.lua', 'client')

Addon.include('src/sh_cppi.lua', 'shared')

Addon.include('config/sh_categories.lua', 'shared')
Addon.include('config/sh_whitelist_tools.lua', 'shared')
Addon.include('config/sh_whitelist_touch.lua', 'shared')
Addon.include('config/sv_whitelist_models.lua', 'server')
Addon.include('config/sv_generic.lua', 'server')
Addon.include('config/sh_disable_touch_notifications.lua', 'shared')
