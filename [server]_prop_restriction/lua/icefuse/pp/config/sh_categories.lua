--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/config/sh_categories.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local categories = IcefusePP.config('categories')
--------------------------------------------------

--------------------------------------------------
-- Default (hardcoded) categories

categories['_editor'] = {
    custom = function(ply)

        return true == IcefusePP.isPlayerEditor(ply)
    end
}

categories['_adminmode'] = {
    custom = function(ply)

        if ply.GetDataVar == nil then
            return false
        end

        return true == ply:GetDataVar('adminmode')
    end
}

--------------------------------------------------

--
-- Some handy contants

local TIER_ANY        = 'any'
-- local TIER_SUBSCRIBER = 1
-- local TIER_PATRON     = 2
-- local TIER_SUPPORTER  = 3
-- local TIER_LOYAL      = 4
-- local TIER_LEGEND     = 5
-- local TIER_CHAMPION   = 6

--------------------------------------------------
-- Generic categories

categories['global'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',
		
		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',										
		'legend',
		'loyal',
		'supporter',
		'patron',
		'subscriber',
		
		'member',
		'user'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Executives
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['developer'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Board of Directors
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['e_d'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d'
	}
}
-------------------------------------------------------------------------------
categories['d_o_p'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p'
	}
}
-------------------------------------------------------------------------------
categories['d_o_i'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i'
	}
}
-------------------------------------------------------------------------------
categories['d_o_a'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Supervisors
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['i_s'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s'
	}
}
-------------------------------------------------------------------------------
categories['p_s'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s'
	}
}
-------------------------------------------------------------------------------
categories['a_s'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s'
	}
}
-------------------------------------------------------------------------------
categories['advisor'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- High Staff
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['division_leader'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader'
	}
}
-------------------------------------------------------------------------------
categories['sector_lead'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Base Staff
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['head_administrator'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',
		
		'division_leader',
		'sector_lead',

		'head_administrator'
	}
}
-------------------------------------------------------------------------------
categories['elite_administrator'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator'
	}
}
-------------------------------------------------------------------------------
categories['administrator'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator'
	}
}
-------------------------------------------------------------------------------
categories['senior_moderator'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator'
	}
}
-------------------------------------------------------------------------------
categories['moderator'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator'
	}
}
-------------------------------------------------------------------------------
categories['trial_mod'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIP/Donator Ranks
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['subscriber'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',
		'legend',
		'loyal',
		'supporter',
		'patron',
		'subscriber'
	}
}
----------------------------------------------------------------------------------------------
categories['patron'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',
		'legend',
		'loyal',
		'supporter',
		'patron'
	}
}
----------------------------------------------------------------------------------------------
categories['supporter'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',
		'legend',
		'loyal',
		'supporter'
	}
}
----------------------------------------------------------------------------------------------
categories['loyal'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',
		'legend',
		'loyal'
	}
}
----------------------------------------------------------------------------------------------
categories['legend'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion',
		'legend'
	}
}
----------------------------------------------------------------------------------------------
categories['champion'] = {
	groups = {
        'superadmin',
		'c_e_o',
		'developer',

		'e_d',
		'd_o_p',
		'd_o_i',
		'd_o_a',

		'i_s',
		'p_s',
		'a_s',
		'advisor',

		'division_leader',
		'sector_lead',

		'head_administrator',
		'elite_administrator',
		'administrator',
		'senior_moderator',
		'moderator',
		'trial_mod',

		'champion'
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- General/Free Ranks
------------------------------------------------------------------------------------------------------------------------------------------------------
categories['member'] = {
    custom = function(ply)
        -- Everyone that is not in the user group belongs to the member category
        return false == ply:IsUserGroup('user')
    end
}