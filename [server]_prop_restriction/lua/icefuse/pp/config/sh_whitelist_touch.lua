--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/config/sh_whitelist_touch.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local whitelist = IcefusePP.config('whitelist_touch')


-----------------------------------------------------------------------------------------------------------------------
--                                             Pocket Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['pocket'] = {
    ['global'] = {
        'spawned_shipment',
        'spawned_weapon',
        'empty_shipment'
    }
}


-----------------------------------------------------------------------------------------------------------------------
--                                             Physgun Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['physgun'] = {
    ['global'] = {
        'prop_physics',

        'gmod_cameraprop',
        'sammyservers_textscreen',
        'gmt_instrument_piano',
        'donation_box',
        'darkrp_laws',
        'zhits_phone',

        'item_healthcharger',
        'item_suitcharger',
        'item_healthkit',
        'item_healthvial',

		
        'atm_reader',
        'ss_shelf_bookcase',
        'ss_shelf_displaycase',
        'ss_shelf_woodenrack',
        'ss_shelf_woodenshelf',

        'wheel_of_luck',
        'double_or_nothing',
        'redsushi_slot',
		


        'zmlab_combiner',
        'zmlab_frezzer',

        'whk_art',
        'whk_mediasource',
        'whk_billboard',
        'whk_blockedarea',
        'whk_ent',
        'whk_musicplayer',
        'whk_pictureframe',
        'whk_radio',
        'whk_squarepictureframe',
        'whk_sticker',
        'whk_tablepicframe',
        'whk_tv',
        'whk_widepictureframe'
    },
-----------------------------------------------------------------------------------------------------------------------Physgun: Admin mode.
    ['_adminmode'] = {
        'prop_physics',
		
        'zhits_phone',

        'prop_vehicle',
        'prop_vehicle_airboat',
        'prop_vehicle_apc',
        'prop_vehicle_cannon',
        'prop_vehicle_crane',
        'prop_vehicle_driveable',
        'prop_vehicle_jeep',
        'prop_vehicle_prisoner_pod',
		
        'vc_pickup_healthkit_25',
        'vc_pickup_fuel_petrol',
        'vc_pickup_engine',
        'vc_pickup_tire',
        'vc_pickup_light',
        'vc_pickup_exhaust',
        'vc_pickup_fuel_diesel',
        'vc_pickup_healthkit_100',
        'vc_pickup_fuel_electricity',
        'vc_pickup_healthkit_10',
        'vc_spikestrip',
        'vc_spikestrip_pointyend',
        'vc_spikestrip_pointyend_extended',

        'atm_reader',
        'ss_cash_registry',
        'ss_package',
        'ss_shelf_bookcase',
        'ss_shelf_displaycase',
        'ss_shelf_woodenrack',
        'ss_shelf_woodenshelf',

        'wheel_of_luck',
        'double_or_nothing',
        'redsushi_slot',

        'entity_barrier',
        'entity_barriercyl',
        'entity_barriercylgold',
        'entity_barrierwall',

        'item_healthcharger',
        'item_suitcharger',
        'item_healthkit',
        'item_healthvial',

        'sammyservers_textscreen',
        'gmt_instrument_piano',
        'donation_box',    
        'darkrp_laws',
        'spawned_shipment',
        'spawned_weapon',

        'icefuse_food_1_balloon_poodle',
        'icefuse_food_2_dick',
        'icefuse_food_3_cactus',
        'icefuse_food_4_orange',
        'icefuse_food_5_hotdog',
        'icefuse_food_6_burger',
        'icefuse_food_7_fish_goldfish',
        'icefuse_food_8_donut',
        'icefuse_food_9_chinese_food',
        'icefuse_food_10_watermelon',
        'icefuse_food_11_baby_food',
        'icefuse_food_12_male_head',
        'icefuse_food_13_female_head',
        'icefuse_food_14_bomb',

        'drug_antitoxin',
        'drug_booze',
        'drug_ciggies',
        'drug_meth',
        'drug_dextradose',
        'drug_gunslinger',
        'drug_vampire',
        'drug_preserver',
        'drug_booze2',
        'drug_relaxant',
        'drug_painkiller',
        'drug_pingaz',
        'drug_roids',
        'drug_vitalex',
        'drug_volatile',
        'drug_weed',
        'drug_vaporwave',
		'ent_ebolacure',

        'icefuse_crystal_meth_lab',
        'icefuse_crystal_meth_level1',
        'icefuse_crystal_meth_level2',
        'icefuse_crystal_meth_level3',

        'zmlab_aluminium',
        'zmlab_filter',
        'zmlab_meth',
        'zmlab_meth_baggy',
        'zmlab_methdropoff',
        'zmlab_methylamin',
        'zmlab_collectcrate',
        'zmlab_palette',

        'plant_pot',
        'weed_seed',
        'plant_grow',
		
        'icefuse_weedtable',
        'icefuse_weed_level1',
        'icefuse_weed_level2',
        'icefuse_weed_level3',

        'icefuse_coca_plant_lab_desk',
        'icefuse_coca_plant_level1',
        'icefuse_coca_plant_level2',
        'icefuse_coca_plant_level3',

        'mn_bottle',
        'mn_corn',
        'mn_cseed',
        'mn_dirt',
        'mn_distillery',
        'mn_grain',
        'mn_gseed',
        'mn_ccorn',
        'mn_ggrain',
        'mn_bucket',
        'mn_pot',
        'mn_stand',
        'mn_toppiece',
        'mn_water',
        'mn_barrel',

        'icefuse_lsd_stove',
        'icefuse_lsd_level1',
        'icefuse_lsd_level2',
        'icefuse_lsd_level3',

        'the_opium_barrel',
        'the_opium_bottle',
        'the_opium_codeine',
        'the_opium_gas',
        'the_opium_heater',
        'the_opium_packed',
        'the_opium_packer',
        'the_opium_papaverine',
        'the_opium_sulfate',
        'the_opium_water',

        'the_crack_barrel',
        'the_crack_bowl',
        'the_crack_bucket',
        'the_crack_compcan',
        'the_crack_ferment',
        'the_crack_heater',
        'the_crack_mircowave',
        'the_crack_pipekit',

        'zhits_phone',

        'icefuse_printer_copper',
        'icefuse_printer_bronze',
        'icefuse_printer_silver',
        'icefuse_printer_gold',
        'icefuse_printer_emerald',
        'icefuse_printer_ruby',
        'icefuse_printer_sapphire',
        'icefuse_printer_legendary',

        'whk_art',
        'whk_mediasource',
        'whk_billboard',
        'whk_blockedarea',
        'whk_ent',
        'whk_musicplayer',
        'whk_pictureframe',
        'whk_radio',
        'whk_squarepictureframe',
        'whk_sticker',
        'whk_tablepicframe',
        'whk_tv',
        'whk_widepictureframe'
    }
}



-----------------------------------------------------------------------------------------------------------------------
--                                             Remover Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['remover'] = {
    ['global'] = {
        'prop_physics',
    
        'keypad',
        'gmod_button',
        'gmod_cameraprop',
        'sammyservers_textscreen',
        'gmt_instrument_piano',
        'donation_box',
		'zhits_phone',

        'darkrp_laws',

        'item_healthcharger',
        'item_suitcharger',
		
		'atm_reader',

        'ss_cash_registry',
        'ss_shelf_bookcase',
        'ss_shelf_displaycase',
        'ss_shelf_woodenrack',
        'ss_shelf_woodenshelf',

        'wheel_of_luck',
        'double_or_nothing',
        'redsushi_slot',
		
        'mn_bottle',
        'mn_corn',
        'mn_cseed',
        'mn_dirt',
        'mn_distillery',
        'mn_grain',
        'mn_gseed',
        'mn_ccorn',
        'mn_ggrain',
        'mn_bucket',
        'mn_pot',
        'mn_stand',
        'mn_toppiece',
        'mn_water',
        'mn_barrel',

        'zhits_phone',

        'whk_art',
        'whk_mediasource',
        'whk_billboard',
        'whk_blockedarea',
        'whk_ent',
        'whk_musicplayer',
        'whk_pictureframe',
        'whk_radio',
        'whk_squarepictureframe',
        'whk_sticker',
        'whk_tablepicframe',
        'whk_tv',
        'whk_widepictureframe'

    },
    ['_adminmode'] = {
        'prop_physics',
        ----------------------------------------
        'prop_vehicle',
        'prop_vehicle_airboat',
        'prop_vehicle_apc',
        'prop_vehicle_cannon',
        'prop_vehicle_crane',
        'prop_vehicle_driveable',
        'prop_vehicle_jeep',
        'prop_vehicle_prisoner_pod',
        ----------------------------------------
        'entity_barrier',
        'entity_barriercyl',
        'entity_barriercylgold',
        'entity_barrierwall',
        ----------------------------------------
        'sammyservers_textscreen',
        'gmt_instrument_piano',
        'donation_box',
        ----------------------------------------
        'darkrp_laws',
        'spawned_shipment',
        'spawned_weapon',
        ----------------------------------------
        'icefuse_food_1_balloon_poodle',
        'icefuse_food_2_dick',
        'icefuse_food_3_cactus',
        'icefuse_food_4_orange',
        'icefuse_food_5_hotdog',
        'icefuse_food_6_burger',
        'icefuse_food_7_fish_goldfish',
        'icefuse_food_8_donut',
        'icefuse_food_9_chinese_food',
        'icefuse_food_10_watermelon',
        'icefuse_food_11_baby_food',
        'icefuse_food_12_male_head',
        'icefuse_food_13_female_head',
        'icefuse_food_14_bomb',
        ----------------------------------------
        'item_healthcharger',
        'item_suitcharger',
        ----------------------------------------
        'vc_pickup_healthkit_25',
        'vc_pickup_fuel_petrol',
        'vc_pickup_engine',
        'vc_pickup_tire',
        'vc_pickup_light',
        'vc_pickup_exhaust',
        'vc_pickup_fuel_diesel',
        'vc_pickup_healthkit_100',
        'vc_pickup_fuel_electricity',
        'vc_pickup_healthkit_10',
        'vc_spikestrip',
        'vc_spikestrip_pointyend',
        'vc_spikestrip_pointyend_extended',
        ----------------------------------------
		'atm_reader',
		
        'ss_cash_registry',
        'ss_package',
        'ss_shelf_bookcase',
        'ss_shelf_displaycase',
        'ss_shelf_woodenrack',
        'ss_shelf_woodenshelf',
        ----------------------------------------
        'wheel_of_luck',
        'double_or_nothing',
        'redsushi_slot',
        ----------------------------------------
        'zhits_phone',
        
        'whk_art',
        'whk_mediasource',
        'whk_billboard',
        'whk_blockedarea',
        'whk_ent',
        'whk_musicplayer',
        'whk_pictureframe',
        'whk_radio',
        'whk_squarepictureframe',
        'whk_sticker',
        'whk_tablepicframe',
        'whk_tv',
        'whk_widepictureframe'
    }
}


-----------------------------------------------------------------------------------------------------------------------
--                                             Weld Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['weld'] = {
    ['global'] = {
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}
-----------------------------------------------------------------------------------------------------------------------
--                                             Textscreen Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['textscreen'] = {
    ['global'] = {
        'worldspawn',
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}
-----------------------------------------------------------------------------------------------------------------------
--                                             Stacker Settings
-----------------------------------------------------------------------------------------------------------------------
whitelist['stacker_improved'] = {
    ['global'] = {
        'prop_physics'
    }
}

whitelist['shareprops'] = {
    ['global'] = {
        'prop_physics'
    }
}

whitelist['precision'] = {
    ['global'] = {
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['nocollide'] = {
    ['global'] = {
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['material'] = {
    ['global'] = {
        'prop_physics',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['keypad_willox'] = {
    ['global'] = {
        'worldspawn',
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['fading_door'] = {
    ['global'] = {
        'prop_physics',
        'keypad',
        'gmod_button'
    }
}

whitelist['colour'] = {
    ['global'] = {
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['camera'] = {
    ['global'] = {
        'worldspawn',
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

whitelist['button'] = {
    ['global'] = {
        'worldspawn',
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}

-----------------------------------------------------------------------------
whitelist['advdupe2'] = {
    ['global'] = {
        'worldspawn',
        'prop_physics',
        'keypad',
        'gmod_button',
        'sammyservers_textscreen',
        'gmod_cameraprop'
    }
}
