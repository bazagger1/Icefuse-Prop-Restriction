--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/core/sh_touch_entity.lua
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

local IsValid = IsValid
local IsFirstTimePredicted = IsFirstTimePredicted

local hook_Call = hook.Call

local SERVER = SERVER
local CLIENT = CLIENT

local NW_ENTITY_OWNER = identifier('owner')

--------------------------------------------------

local config_disableTouchNotifications = config('disable_touch_notifications')

local cache_whitelistTools = cache('whitelist_tools')
local cache_whitelistTouch = cache('whitelist_touch')

local cache_playerTouchEntity = cache('player.touch_entity')

--------------------------------------------------

--[[
- @param entity entity
-
- @return entity|nil
]]
function Addon.getEntityOwner(entity)
    return entity:GetNWEntity(NW_ENTITY_OWNER, nil)
end

--------------------------------------------------

--[[
- @param player ply
-
- @return string|nil
]]
function Addon.getPlayerCurrentToolType(ply)

    local weapon = ply:GetActiveWeapon()
    if not IsValid(weapon) then
        return nil
    end

    local class = weapon:GetClass()

    if class == 'weapon_physgun' then
        return 'physgun'
    end

    if class == 'gmod_tool' then

        local tool = weapon:GetToolObject()
        if tool then
            return weapon:GetToolObject().Mode
        end

    end

    return nil
end

--[[
- @param player ply
- @param entity entity
-
- @return bool
]]
function Addon.getPlayerTouchEntityReason(ply, entity)

    local owner = Addon.getEntityOwner(entity)

    if owner == nil then
        return "unknown"
    end

    if not IsValid(owner) then
        return "disconnected"
    end

    if ply ~= owner then

        -- Check if is adminmode
        if Addon.playerBelongsToCategory(ply, '_adminmode') then
            return "Adminmode: " .. owner:Nick()

        -- Check if the player is a buddy of the owner
        elseif Addon.isPlayerBuddy(ply, owner) == true then

            return "Buddy: " .. owner:Nick()
        end

    end

    return owner:Nick()
end

--[[
- Whether the player can touch an entity with the specific tool.
-
- @param player ply
- @param entity entity
- @param string toolType
-
- @return bool
]]
function Addon.canPlayerTouchEntity(ply, entity, toolType)

    -- Allow editors to touch anything
    if Addon.playerBelongsToCategory(ply, '_editor') then
        return true
    end

    --
    -- Check if the player is the owner or is buddies with the owner
    -- (if the entity has an owner)

    local owner = Addon.getEntityOwner(entity)
    if IsValid(owner) == true then

        -- Whenever the player is not the owner of that entity
        if ply ~= owner then

            -- Check if is adminmode
            if Addon.playerBelongsToCategory(ply, '_adminmode') then
                -- Anyone in adminmode does not have to be a buddy of the player

            -- Check if the player is a buddy of the owner
            elseif Addon.isPlayerBuddy(ply, owner) == false then

                -- If the player is not a buddy, the player is not allowed to touch the entity
                return false
            end

        end

    end

    --
    -- Check whether the player may use the toolType

    local categories = cache_whitelistTools[toolType]

    -- No categories (not defined), disallow..
    if categories == nil then
        return false
    end

    if Addon.playerBelongsToOneCategory(ply, categories) == false then
        return false
    end

	-- Temp fix
	if Addon.playerBelongsToCategory(ply, '_adminmode') then

		if entity:IsVehicle() then
			return true
		end

	end

    --
    -- Check whether the player may touch the entity with the toolType

    local categories = cache_whitelistTouch[toolType][entity:GetClass()]

    -- No categories (not defined), disallow..
    if categories == nil then
        return false
    end

    return Addon.playerBelongsToOneCategory(ply, categories) == true
end
local canPlayerTouchEntity = Addon.canPlayerTouchEntity

--------------------------------------------------
-- Physgun

--[[
- @param player ply
- @param entity entity
]]
local function physGunPickup(ply, entity)

	-- Temp fix
    if SERVER then
        if entity:IsPlayer() and IcefuseAdmin then

            if (ply:GetGroupWeight() >= IcefuseAdmin.Config.PlayerPhysgun) and ply:GetDataVar('adminmode') and IcefuseAdmin.Player.CanTarget(ply, entity) then

        		entity:Freeze(true)
        		entity:SetMoveType(MOVETYPE_NOCLIP)

        		return nil -- Allow other hooks
            end

        end
	end

    local allowed = cache_playerTouchEntity[ply]['physgun'][entity]

    -- Cache if not cached..
    if allowed == nil then

        allowed = canPlayerTouchEntity(ply, entity, 'physgun')
        cache_playerTouchEntity[ply]['physgun'][entity] = allowed

    end

    if allowed == false then
        return false
    end
    
    hook_Call('Icefuse.PropRestriction.PhysgunPickup', nil, ply, entity)
    return nil -- Allow other hooks
end
hook.Add('PhysgunPickup', identifier(), physGunPickup)

--[[
- @param player ply
- @param entity entity
- @param PhysObj physObject
]]
local function canPlayerUnfreeze(ply, entity, physObject)
    local allowed = cache_playerTouchEntity[ply]['physgun'][entity]

    -- Cache if not cached..
    if allowed == nil then

        allowed = canPlayerTouchEntity(ply, entity, 'physgun')
        cache_playerTouchEntity[ply]['physgun'][entity] = allowed

    end

    if allowed == false then
        return false
    end

    return nil -- Allow other hooks
end
hook.Add('CanPlayerUnfreeze', identifier(), canPlayerUnfreeze)

--------------------------------------------------
-- Tool

--[[
- @param player ply
- @param entity entity
- @param string tool
]]
local function canTool(ply, trace, tool)
    local allowed = cache_playerTouchEntity[ply][tool][trace.Entity]

    -- Cache if not cached..
    if allowed == nil then

        allowed = canPlayerTouchEntity(ply, trace.Entity, tool)
        cache_playerTouchEntity[ply][tool][trace.Entity] = allowed

    end

    if allowed == false then

        if CLIENT and IsFirstTimePredicted() then
            if config_disableTouchNotifications[tool] and config_disableTouchNotifications[tool][trace.Entity:GetClass()] ~= true then
                Addon.notify(ply, 1, "You are not allowed to use that tool on that!", .5)
            end
        end

        return false
    end

    return nil -- Allow other hooks
end
hook.Add('CanTool', identifier(), canTool)

--------------------------------------------------
-- Gravity gun punting

--[[
- @param player ply
- @param entity entity
]]
local function gravGunPunt(ply, entity)

    if SERVER then

        -- Simply drop the entity
        DropEntityIfHeld(entity)

    end

    return false
end
hook.Add('GravGunPunt', identifier(), gravGunPunt)
