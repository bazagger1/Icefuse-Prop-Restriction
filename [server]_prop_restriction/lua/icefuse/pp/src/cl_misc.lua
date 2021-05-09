--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/cl_misc.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP

local identifier = Addon.identifier

--------------------------------------------------

--[[
-
]]
local function HUDPaint()

    local ply = LocalPlayer()

    local entity = ply:GetEyeTraceNoCursor().Entity
    if not IsValid(entity) then
        return
    end

    local owner = Addon.getEntityOwner(entity)
    if not IsValid(owner) then
        return
    end

    local canTouch, toolType = false, Addon.getPlayerCurrentToolType(ply)
    if toolType ~= nil then
        canTouch = Addon.canPlayerTouchEntity(ply, entity, toolType)
    end

    local reason = Addon.getPlayerTouchEntityReason(ply, entity)
    if reason == "unknown" then
        return
    end

    surface.SetFont('Default')
    local textW, textH = surface.GetTextSize(reason)

    draw.RoundedBox(4, 0, ScrH() / 2 - textH - 2, textW + 10, 20, Color(0, 0, 0, 110))

    if canTouch == true then
        surface.SetTextColor(0, 255, 0)
    else
        surface.SetTextColor(255, 0, 0)
    end

    surface.SetTextPos(5, ScrH() / 2 - textH)
    surface.DrawText(reason)

end
hook.Add('HUDPaint', identifier('misc'), HUDPaint)
