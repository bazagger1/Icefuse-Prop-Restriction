--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/sh_util.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP

local singleton = Addon.singleton

local type = type
local SysTime = SysTime

local SERVER = SERVER

--------------------------------------------------

local notifyCooldown = singleton('notifyCooldown')

--[[
- @param player ply
- @param number|string messageType
- @param string|number|nil message
- @param number|nil cooldown
]]
function Addon.notify(ply, messageType, message, cooldown)

    if type(messageType) == 'string' then
        messageType, message, cooldown = 3, messageType, message
    end

    if cooldown then
        local sysTime = SysTime()

        if sysTime - (notifyCooldown[message] or 0) < 0 then
            return
        end

        notifyCooldown[message] = sysTime + cooldown

    end

    if not IsValid(ply) then -- Console
        Addon.message(message)
    else

        if SERVER then
            DarkRP.notify(ply, messageType, 4, message)
        else

            GAMEMODE:AddNotify(message, messageType, 4)
            surface.PlaySound("buttons/lightswitch2.wav")

            -- Log to client console
            MsgC(Color(255, 255, 0), "[IcefusePP] ", Color(180, 180, 180), message, "\n")

        end

    end

end

--[[
- @param player ply
- @param string message
- @param ...
]]
function Addon.message(...)
    MsgC(Color(255, 255, 9), "[", Addon._name, "] ", Color(180, 180, 180), ...)
    MsgC("\n")
end

--------------------------------------------------

local _clientLoaded = false

--[[
- TODO: Optimize this...
-
- Waits for the client player to be loaded.
-
- @param function callback
- @param bool|nil shouldCall
-
- @return function
]]
function Addon.waitForClient(callback, shouldCall)

    local func
    func = function(...)

        if _clientLoaded == true then
            callback(...)

            return
        end

        local args = {...}
        timer.Simple(.5, function()

            if IsValid(LocalPlayer()) then
                _clientLoaded = true
            end

            func(unpack(args))

        end)

    end

    if shouldCall == true then
        func()
    end

    return func
end
