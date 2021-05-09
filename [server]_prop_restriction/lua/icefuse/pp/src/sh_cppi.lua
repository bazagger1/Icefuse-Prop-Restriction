--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/sh_cppi.lua
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

local PlayerMeta = FindMetaTable('Player')
local EntityMeta = FindMetaTable('Entity')

--------------------------------------------------
-- DarkRP support

CPPI = CPPI or {}

CPPI.CPPI_DEFER = 105102 --\102\112 = if ???
CPPI.CPPI_NOTIMPLEMENTED = 7370 --\70\80 = IF ???

--[[
- @return string
]]
function CPPI:GetName()
	return Addon._name
end

--[[
- @return string
]]
function CPPI:GetVersion()
	return tostring(Addon._version)
end

--[[
- @return number
]]
function CPPI:GetInterfaceVersion()
	return 1.0
end

--[[
- @return ??
]]
function CPPI:GetNameFromUID(uid)
	return CPPI.CPPI_NOTIMPLEMENTED
end

--[[
- @return ??
]]
function PlayerMeta:CPPIGetFriends()
    return CPPI.CPPI_NOTIMPLEMENTED
end

--[[
- @return ply|nil, string|nil
]]
function EntityMeta:CPPIGetOwner()
    local owner = Addon.getEntityOwner(self)

	if not IsValid(owner) or not owner:IsPlayer() then
        return nil, nil
    end

	return owner, owner:UniqueID()
end

if SERVER then

    --[[
    - @param player ply
    -
    - @return bool
    ]]
	function EntityMeta:CPPISetOwner(ply)
		
        if not IsValid(ply) or not ply:IsPlayer() then -- We only support valid players..
            return false
        end

		local canSetOwner = hook.Run('CPPIAssignOwnership', ply, self, ply:UniqueID())
		if canSetOwner == false then
            return false
        end

        Addon.setEntityOwner(self, ply)

		return true
	end

    --[[
    - @param string|any?
    -
    - @return bool
    ]]
	function EntityMeta:CPPISetOwnerUID(uniqueId)
		local ply = uniqueId and player.GetByUniqueID(tostring(uniqueId)) or nil

		if uniqueId and not IsValid(ply) then
            return false
        end

		return self:CPPISetOwner(ply)
	end

    --[[
    - @param player ply
    - @param string tool
    -
    - @return bool
    ]]
	function EntityMeta:CPPICanTool(ply, tool)
        return Addon.canPlayerTouchEntity(ply, self, tool)
	end

    --[[
    - @param player ply
    -
    - @return bool
    ]]
	function EntityMeta:CPPICanPhysgun(ply)
        return Addon.canPlayerTouchEntity(ply, self, 'physgun')
	end

    --[[
    - @param player ply
    -
    - @return bool
    ]]
	function EntityMeta:CPPICanPickup(ply) -- Currently not supported
		return Addon.canPlayerTouchEntity(ply, self, 'pocket')
	end

    --[[
    - @param player ply
    -
    - @return bool
    ]]
	function EntityMeta:CPPICanPunt(ply) -- Never allowed to punt
		return false
	end

    -- --[[
    -- - @param player ply
    -- -
    -- - @return bool
    -- ]]
	-- function EntityMeta:CPPICanUse(ply) -- Currently not supported
	-- 	return true
	-- end
    --
    -- --[[
    -- - @param player ply
    -- -
    -- - @return bool
    -- ]]
	-- function EntityMeta:CPPICanDamage(ply) -- Currently not supported
	-- 	return true
	-- end
    --
    -- --[[
    -- - @param player ply
    -- -
    -- - @return bool
    -- ]]
	-- function ENTITY:CPPIDrive(ply) -- Currently not supported
	-- 	return true
	-- end
    --
    -- --[[
    -- -
    -- ]]
	-- function ENTITY:CPPICanProperty(ply, property) -- Currently not supported
    --     return true
	-- end
    --
    -- --[[
    -- -
    -- ]]
	-- function ENTITY:CPPICanEditVariable(ply, key, val, editTbl) -- Currently not supported
	-- 	return true
	-- end

end
