--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/config/sh_whitelist_tools.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local whitelist = IcefusePP.config('whitelist_tools')
--------------------------------------------------

whitelist['c_e_o'] = 'any'

------------------------------------------------------------------------------------
whitelist['global'] = {
    -- Everyone that belongs to the global category may use the follow tools:

	-- Hardcoded tools
    'physgun',
	'pocket',

	-- Actual tools
    'weld',
    'textscreen',
    'stacker_improved',
    'shareprops',
    'remover',
    'precision',
    'nocollide',
    'material',
    'keypad_willox',
    'fading_door',
    'colour',
    'camera',
    'button'
}

------------------------------------------------------------------------------------
whitelist['subscriber'] = {
    'advdupe2'
}
