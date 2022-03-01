Config = Config or {}

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
    "weapon_beanbag",
    "weapon_g17"
}

Config.DurabilityMultiplier = {
	-- Melee
	-- ['weapon_unarmed'] 				 = 0.15,
	['weapon_dagger'] 				 = 0.15,
	['weapon_bat'] 				 	 = 0.15,
	['weapon_bottle'] 				 = 0.15,
	['weapon_crowbar'] 				 = 0.15,
	-- ['weapon_flashlight'] 			 = 0.15,
	['weapon_golfclub'] 			 = 0.15,
	['weapon_hammer'] 				 = 0.15,
	['weapon_hatchet'] 				 = 0.15,
	['weapon_knuckle'] 				 = 0.15,
	['weapon_knife'] 				 = 0.15,
	['weapon_machete'] 				 = 0.15,
	['weapon_switchblade'] 			 = 0.15,
	-- ['weapon_nightstick'] 			 = 0.15,
	['weapon_wrench'] 				 = 0.15,
	['weapon_battleaxe'] 			 = 0.15,
	['weapon_poolcue'] 				 = 0.15,
	['weapon_briefcase'] 			 = 0.15,
	['weapon_briefcase_02'] 		 = 0.15,
	['weapon_garbagebag'] 			 = 0.15,
	['weapon_handcuffs'] 			 = 0.15,
	['weapon_bread'] 				 = 0.15,
	['weapon_stone_hatchet'] 		 = 0.15,

	-- Handguns
	['weapon_pistol'] 				 = 0.15,
	['weapon_pistol_mk2'] 			 = 0.15,
	['weapon_combatpistol'] 		 = 0.15,
	['weapon_appistol'] 			 = 0.15,
	-- ['weapon_stungun'] 				 = 0.15,
    -- ['weapon_stungun_mp'] 				 = 0.15,
	['weapon_pistol50'] 			 = 0.15,
	['weapon_snspistol'] 			 = 0.15,
	['weapon_heavypistol'] 			 = 0.15,
	['weapon_vintagepistol'] 		 = 0.15,
	['weapon_flaregun'] 			 = 0.15,
	['weapon_marksmanpistol'] 		 = 0.15,
	['weapon_revolver'] 			 = 0.15,
	['weapon_revolver_mk2'] 		 = 0.15,
	['weapon_doubleaction'] 		 = 0.15,
	['weapon_snspistol_mk2'] 		 = 0.15,
	['weapon_raypistol'] 			 = 0.15,
	['weapon_ceramicpistol'] 		 = 0.15,
	['weapon_navyrevolver'] 		 = 0.15,
	['weapon_gadgetpistol'] 		 = 0.15,

	-- Submachine Guns
	['weapon_microsmg'] 			 = 0.15,
	['weapon_smg'] 				     = 0.15,
	['weapon_smg_mk2'] 				 = 0.15,
	['weapon_assaultsmg'] 			 = 0.15,
	['weapon_combatpdw'] 			 = 0.15,
	['weapon_machinepistol'] 		 = 0.15,
	['weapon_minismg'] 				 = 0.15,
	['weapon_raycarbine'] 			 = 0.15,

	-- Shotguns
	['weapon_pumpshotgun'] 			= 0.15,
	['weapon_sawnoffshotgun'] 		= 0.15,
	['weapon_assaultshotgun'] 		= 0.15,
	['weapon_bullpupshotgun'] 		= 0.15,
	['weapon_musket'] 				= 0.15,
	['weapon_heavyshotgun'] 		= 0.15,
	['weapon_dbshotgun'] 			= 0.15,
	['weapon_autoshotgun'] 			= 0.15,
	['weapon_pumpshotgun_mk2'] 		= 0.15,
	['weapon_combatshotgun'] 		= 0.15,

	-- Assault Rifles
	['weapon_assaultrifle'] 		= 0.15,
	['weapon_assaultrifle_mk2'] 	= 0.15,
	['weapon_carbinerifle'] 		= 0.15,
	['weapon_carbinerifle_mk2'] 	= 0.15,
	['weapon_advancedrifle'] 		= 0.15,
	['weapon_specialcarbine'] 		= 0.15,
	['weapon_bullpuprifle'] 		= 0.15,
	['weapon_compactrifle'] 		= 0.15,
	['weapon_specialcarbine_mk2'] 	= 0.15,
	['weapon_bullpuprifle_mk2'] 	= 0.15,
	['weapon_militaryrifle'] 		= 0.15,
    ['weapon_heavyrifle']           = 0.15,

	-- Light Machine Guns
	['weapon_mg'] 				    = 0.15, 
	['weapon_combatmg'] 			= 0.15,
	['weapon_gusenberg'] 			= 0.15,
	['weapon_combatmg_mk2'] 		= 0.15,

	-- Sniper Rifles
	['weapon_sniperrifle'] 			= 0.15,
	['weapon_heavysniper'] 			= 0.15,
	['weapon_marksmanrifle'] 		= 0.15,
	['weapon_remotesniper'] 		= 0.15,
	['weapon_heavysniper_mk2'] 		= 0.15,
	['weapon_marksmanrifle_mk2'] 	= 0.15,

	-- Heavy Weapons
	['weapon_rpg'] 				    = 0.15,
	['weapon_grenadelauncher'] 		= 0.15,
	['weapon_grenadelauncher_smoke']= 0.15,
    ['weapon_emplauncher']          = 0.15,
	['weapon_minigun'] 				= 0.15,
	['weapon_firework'] 			= 0.15,
	['weapon_railgun'] 				= 0.15,
	['weapon_hominglauncher'] 		= 0.15,
	['weapon_compactlauncher'] 		= 0.15,
	['weapon_rayminigun'] 			= 0.15,

	-- Throwables
	['weapon_grenade'] 				= 0.15,
	['weapon_bzgas'] 				= 0.15,
	['weapon_molotov'] 				= 0.15,
	['weapon_stickybomb'] 			= 0.15,
	['weapon_proxmine'] 			= 0.15,
	['weapon_snowball'] 			= 0.15,
	['weapon_pipebomb'] 			= 0.15,
	['weapon_ball'] 				= 0.15,
	['weapon_smokegrenade'] 		= 0.15,
	['weapon_flare'] 				= 0.15,

	-- Miscellaneous
	['weapon_petrolcan'] 			= 0.15,
	['weapon_fireextinguisher'] 	= 0.15,
	['weapon_hazardcan'] 			= 0.15,
    ['weapon_fertilizercan'] 		= 0.15,

    --ADD-ON WEAPONS
    ['weapon_mk18']                 =0.15,
    ['weapon_m870']                 =0.15,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
}

WeaponAttachments = {
    -- PISTOLS
    ['WEAPON_PISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_01',
            item = 'pistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL_VARMOD_LUXE',
            item = 'pistol_luxuryfinish',
        },
    },
    ['WEAPON_COMBATPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_01',
            item = 'combatpistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_02',
            item = 'combatpistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER',
            item = 'combatpistol_luxuryfinish',
        },
    },
    ['WEAPON_APPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_01',
            item = 'appistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_02',
            item = 'appistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_APPISTOL_VARMOD_LUXE',
            item = 'appistol_luxuryfinish',
        },
    },
    ['WEAPON_PISTOL50'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_01',
            item = 'pistol50_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_02',
            item = 'pistol50_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL50_VARMOD_LUXE',
            item = 'pistol50_luxuryfinish',
        },
    },
    ['WEAPON_REVOLVER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_REVOLVER_CLIP_01',
            item = 'revovler_defaultclip',
        },
        ['vipvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_GOON',
            item = 'revolver_vipvariant',
            type = 'skin',
        },
        ['bodyguardvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_BOSS',
            item = 'revolver_bodyguardvariant',
            type = 'skin',
        },
    },
    ['WEAPON_SNSPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_01',
            item = 'snspistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_02',
            item = 'snspistol_extendedclip',
            type = 'clip',
        },
        ['grip'] = {
            component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER',
            item = 'snspistol_grip',
        },
    },
    ['WEAPON_HEAVYPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_01',
            item = 'heavypistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_02',
            item = 'heavypistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE',
            item = 'heavypistol_grip',
        },
    },
    ['WEAPON_VINTAGEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_01',
            item = 'vintagepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            item = 'vintagepistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
            type = 'silencer',
        },
    },
    -- SMG'S
    ['WEAPON_MICROSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_01',
            item = 'microsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_02',
            item = 'microsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_LUXE',
            item = 'microsmg_luxuryfinish',
        },
    },
    ['WEAPON_SMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SMG_CLIP_01',
            item = 'smg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SMG_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SMG_VARMOD_LUXE',
            item = 'smg_luxuryfinish',
        },
    },
    ['WEAPON_ASSAULTSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_01',
            item = 'assaultsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_02',
            item = 'assaultsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER',
            item = 'assaultsmg_luxuryfinish',
        },
    },
    ['WEAPON_MINISMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_01',
            item = 'minismg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_02',
            item = 'minismg_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_MACHINEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_01',
            item = 'machinepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_02',
            item = 'machinepistol_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_03',
            item = 'machinepistol_drum',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
    },
    ['WEAPON_COMBATPDW'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_01',
            item = 'combatpdw_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_02',
            item = 'combatpdw_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_03',
            item = 'combatpdw_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'combatpdw_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
    },
    -- SHOTGUNS
    ['WEAPON_PUMPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER',
            item = 'pumpshotgun_luxuryfinish',
        },
    },
    ['WEAPON_SAWNOFFSHOTGUN'] = {
        ['luxuryfinish'] = {
            component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE',
            item = 'sawnoffshotgun_luxuryfinish',
        },
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01',
            item = 'assaultshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
            item = 'assaultshotgun_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_BULLPUPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_01',
            item = 'heavyshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02',
            item = 'heavyshotgun_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03',
            item = 'heavyshotgun_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
    },
    -- RIFLES
    ['WEAPON_ASSAULTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_01',
            item = 'assaultrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_02',
            item = 'assaultrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_03',
            item = 'assaultrifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE',
            item = 'assaultrifle_luxuryfinish',
        },
    },
    ['WEAPON_CARBINERIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_01',
            item = 'carbinerifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_02',
            item = 'carbinerifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_03',
            item = 'carbinerifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE',
            item = 'carbinerifle_luxuryfinish',
        },
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_01',
            item = 'advancedrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02',
            item = 'advancedrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE',
            item = 'advancedrifle_luxuryfinish',
        },
    },
    ['WEAPON_SPECIALCARBINE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_01',
            item = 'specialcarbine_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_02',
            item = 'specialcarbine_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_03',
            item = 'specialcarbine_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER',
            item = 'specialcarbine_luxuryfinish',
        },
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_01',
            item = 'bullpuprifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_02',
            item = 'bullpuprifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish',
        },
    },
    ['WEAPON_COMPACTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_01',
            item = 'compactrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_02',
            item = 'compactrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_03',
            item = 'compactrifle_drum',
            type = 'clip',
        },
    },
    ['WEAPON_HEAVYRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_01',
            item = 'bullpuprifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_02',
            item = 'bullpuprifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish',
        },
    },
    -- MACHINE GUNS
    ['WEAPON_GUSENBERG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_01',
            item = 'gusenberg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_02',
            item = 'gusenberg_extendedclip',
            type = 'clip',
        },
    },
    -- LAUNCHERS
    ['WEAPON_EMPLAUNCHER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_EMPLAUNCHER_CLIP_01',
            item = 'emplauncher_defaultclip',
            type = 'clip',
        },
    },
    -- SNIPERS
    ['WEAPON_SNIPERRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNIPERRIFLE_CLIP_01',
            item = 'sniperrifle_defaultclip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'snipermax_scope',
            type = 'scope',
        },
        ['grip'] = {
            component = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE',
            item = 'sniper_grip',
        },
    },
    ['WEAPON_HEAVYSNIPER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_CLIP_01',
            item = 'heavysniper_defaultclip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'snipermax_scope',
            type = 'scope',
        },
    },
    ['WEAPON_MARKSMANRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_01',
            item = 'marksmanrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_02',
            item = 'marksmanrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM',
            item = 'marksmanrifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE',
            item = 'marksmanrifle_luxuryfinish',
        },
    },
    ['WEAPON_G17'] = {
        ['17rnddefault'] = {
            component = 'COMPONENT_G17_CLIP_01',
            item = 'g17_17rnddefaultclip',
            type = 'clip',
        },
        ['17rndextended'] = {
            component = 'COMPONENT_G17_CLIP_02',
            item = 'g17_17rndextendedclip',
            type = 'clip',
        },
        ['21rnd'] = {
            component = 'COMPONENT_G17_CLIP_03',
            item = 'g17_21rndclip',
            type = 'clip,'
        },
        ['33rnd'] = {
            component = 'COMPONENT_G17_CLIP_04',
            item = 'g17_33rndclip',
            type = 'clip',
        },
        ['50rnd'] = {
            component = 'COMPONENT_G17_CLIP_05',
            item = 'g17_50rndclip',
            type = 'clip',
        },
        ['flashlight1'] = {
            component = 'COMPONENT_G17_FLASH_01',
            item = 'g17_flashlight1',
        },
        ['flashlight2'] = {
            component = 'COMPONENT_G17_FLASH_02',
            item = 'g17_flashlight2',
        },
        ['flashlight3'] = {
            component = 'COMPONENT_G17_FLASH_03',
            item = 'g17_flashlight3',
        },
        ['flashlight4'] = {
            component = 'COMPONENT_G17_FLASH_04',
            item = 'g17_flashlight4',
            type = 'flashlight'
        },
        ['suppressor1'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_01',
            item = 'g17_suppressor1',
            type = 'silencer'
        },
        ['suppressor2'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_02',
            item = 'g17_suppressor2',
            type = 'silencer'
        },
        ['suppressor3'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_03',
            item = 'g17_suppressor3',
            type = 'silencer'
        },
        ['suppressor4'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_04',
            item = 'g17_suppressor4',
            type = 'silencer'
        },
        ['suppressor5'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_05',
            item = 'g17_suppressor5',
            type = 'silencer'
        },
        ['suppressor6'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_06',
            item = 'g17_suppressor6',
            type = 'silencer'
        },
        ['suppressor7'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_07',
            item = 'g17_suppressor7',
            type = 'silencer'
        },
        ['suppressor8'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_08',
            item = 'g17_suppressor8',
            type = 'silencer'
        },
        ['suppressor9'] = {
            component = 'COMPONENT_G17_SUPPRESSOR_09',
            item = 'g17_suppressor9',
            type = 'silencer'
        },
        ['barrel1'] = {
            component = 'COMPONENT_G17_BARREL_01',
            item = 'g17_barrel1',
        },
        ['barrel2'] = {
            component = 'COMPONENT_G17_BARREL_02',
            item = 'g17_barrel2',
        },
        ['barrel3'] = {
            component = 'COMPONENT_G17_BARREL_03',
            item = 'g17_barrel3',
        },
        ['barrel4'] = {
            component = 'COMPONENT_G17_BARREL_04',
            item = 'g17_barrel4',
        },
        ['barrel5'] = {
            component = 'COMPONENT_G17_BARREL_05',
            item = 'g17_barrel5',
        },
        ['barrel6'] = {
            component = 'COMPONENT_G17_BARREL_06',
            item = 'g17_barrel6',
        },
        ['barrel7'] = {
            component = 'COMPONENT_G17_BARREL_07',
            item = 'g17_barrel7',
        },
        ['frame1'] = {
            component = 'COMPONENT_G17_FRAME_01',
            item = 'g17_frame1',
        },
        ['frame2'] = {
            component = 'COMPONENT_G17_FRAME_02',
            item = 'g17_frame2',
        },
        ['frame3'] = {
            component = 'COMPONENT_G17_FRAME_03',
            item = 'g17_frame3',
        },
        ['frame4'] = {
            component = 'COMPONENT_G17_FRAME_04',
            item = 'g17_frame4',
        },
        ['frame5'] = {
            component = 'COMPONENT_G17_FRAME_05',
            item = 'g17_frame5',
        },
        ['slide1'] = {
            component = 'COMPONENT_G17_SLIDE_01',
            item = 'g17_slide1',
            type = 'scope',
        },
        ['slide2'] = {
            component = 'COMPONENT_G17_SLIDE_02',
            item = 'g17_slide2',
            type = 'scope',
        },
        ['slide3'] = {
            component = 'COMPONENT_G17_SLIDE_03',
            item = 'g17_slide3',
            type = 'scope',
        },
        ['slide4'] = {
            component = 'COMPONENT_G17_SLIDE_04',
            item = 'g17_slide4',
            type = 'scope',
        },
        ['slide5'] = {
            component = 'COMPONENT_G17_SLIDE_05',
            item = 'g17_slide5',
            type = 'scope',
        },
        ['slide6'] = {
            component = 'COMPONENT_G17_SLIDE_06',
            item = 'g17_slide6',
            type = 'scope',
        },
        ['slide7'] = {
            component = 'COMPONENT_G17_SLIDE_07',
            item = 'g17_slide7',
            type = 'scope',
        },
        ['slide8'] = {
            component = 'COMPONENT_G17_SLIDE_08',
            item = 'g17_slide8',
            type = 'scope',
        },
        ['slide9'] = {
            component = 'COMPONENT_G17_SLIDE_09',
            item = 'g17_slide9',
            type = 'scope',
        },
    },
    ['WEAPON_M870'] = {
        ['barrel1'] ={
            component = 'COMPONENT_m870_BARREL_01',
            item = 'm870_barrel1'
        },
        ['barrel2'] ={
            component = 'COMPONENT_m870_BARREL_02',
            item = 'm870_barrel2'
        },
        ['barrel3'] ={
            component = 'COMPONENT_m870_BARREL_03',
            item = 'm870_barrel3'
        },
        ['barrel4'] ={
            component = 'COMPONENT_m870_BARREL_04',
            item = 'm870_barrel4'
        },
        ['barrel5'] ={
            component = 'COMPONENT_m870_BARREL_05',
            item = 'm870_barrel5'
        },
        ['barrel6'] ={
            component = 'COMPONENT_m870_BARREL_06',
            item = 'm870_barrel6'
        },
        ['barrel7'] ={
            component = 'COMPONENT_m870_BARREL_07',
            item = 'm870_barrel7'
        },
        ['4rndmag'] = {
            component = 'COMPONENT_m870_CLIP_01',
            item = 'm870_4rndmag',
            type = 'clip'
        },
        ['7rndmag'] = {
            component = 'COMPONENT_m870_CLIP_02',
            item = 'm870_7rndmag',
            type = 'clip'
        },
        ['12rndmag'] = {
            component = 'COMPONENT_m870_CLIP_03',
            item = 'm870_12rndmag',
            type = 'clip'
        },
        ['handguard1'] = {
            component = 'COMPONENT_m870_HANDGUARD_01',
            item = 'm870_handguard1',
        },
        ['handguard2'] = {
            component = 'COMPONENT_m870_HANDGUARD_02',
            item = 'm870_handguard2',
        },
        ['handguard3'] = {
            component = 'COMPONENT_m870_HANDGUARD_03',
            item = 'm870_handguard3',
        },
        ['scope1'] = {
            component = 'COMPONENT_m870_SCOPE_01',
            item = 'm870_scope1',
            type = 'scope'
        },
        ['scope2'] = {
            component = 'COMPONENT_m870_SCOPE_02',
            item = 'm870_scope2',
            type = 'scope'
        },
        ['scope3'] = {
            component = 'COMPONENT_m870_SCOPE_03',
            item = 'm870_scope3',
            type = 'scope'
        },
        ['scope4'] = {
            component = 'COMPONENT_m870_SCOPE_04',
            item = 'm870_scope4',
            type = 'scope'
        },
        ['stock1'] = {
            component = 'COMPONENT_m870_STOCK_01',
            item = 'm870_stock1',
        },
        ['stock2'] = {
            component = 'COMPONENT_m870_STOCK_02',
            item = 'm870_stock2',
        },
        ['stock3'] = {
            component = 'COMPONENT_m870_STOCK_03',
            item = 'm870_stock3',
        },
        ['stock4'] = {
            component = 'COMPONENT_m870_STOCK_04',
            item = 'm870_stock4',
        },
        ['stock5'] = {
            component = 'COMPONENT_m870_STOCK_05',
            item = 'm870_stock5',
        },
        ['stock6'] = {
            component = 'COMPONENT_m870_STOCK_06',
            item = 'm870_stock6',
        },
    },
    ['WEAPON_MK18'] = {
        ['suppressor1'] = {
            component = 'COMPONENT_MK18_suppressor_01',
            item = 'mk18_suppressor1',
        },
        ['suppressor2'] = {
            component = 'COMPONENT_MK18_suppressor_02',
            item = 'mk18_suppressor2',
        },
        ['suppressor3'] = {
            component = 'COMPONENT_MK18_suppressor_03',
            item = 'mk18_suppressor3',
        },
        ['suppressor4'] = {
            component = 'COMPONENT_MK18_suppressor_04',
            item = 'mk18_suppressor4',
        },
        ['suppressor5'] = {
            component = 'COMPONENT_MK18_suppressor_05',
            item = 'mk18_suppressor5',
        },
        ['suppressor6'] = {
            component = 'COMPONENT_MK18_suppressor_06',
            item = 'mk18_suppressor6',
        },
        ['black30rndmag1'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_black30rndmag1',
            type = 'clip',
        },
        ['black30rndmag2'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_black30rndmag2',
            type = 'clip',
        },
        ['tan30rndmag1'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_tan30rndmag1',
            type = 'clip',
        },
        ['black30rndmag3'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_black30rndmag3',
            type = 'clip',
        },
        ['tan30rndmag2'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_tan30rndmag2',
            type = 'clip',
        },
        ['black60rndmag'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_black60rndmag',
            type = 'clip',
        },
        ['black60rnddrum'] = {
            component = 'COMPONENT_MK18_CLIP_01',
            item = 'mk18_black60rnddrum',
            type = 'clip',
        },
        ['tanflashlight1'] = {
            component = 'COMPONENT_MK18_FLASH_01',
            item = 'mk18_tanflashlight1',
        },
        ['tanflashlight2'] = {
            component = 'COMPONENT_MK18_FLASH_02',
            item = 'mk18_tanflashlight2',
        },
        ['tanflashlight3'] = {
            component = 'COMPONENT_MK18_FLASH_03',
            item = 'mk18_tanflashlight3',
        },
        ['balckflashlight1'] = {
            component = 'COMPONENT_MK18_FLASH_04',
            item = 'mk18_blackflashlight1',
        },
        ['blackflashlight2'] = {
            component = 'COMPONENT_MK18_FLASH_05',
            item = 'mk18_blackflashlight2',
        },
        ['tanflashlight4'] = {
            component = 'COMPONENT_MK18_FLASH_06',
            item = 'mk18_tanflashlight4',
        },
        ['tanflashlight5'] = {
            component = 'COMPONENT_MK18_FLASH_07',
            item = 'mk18_tanflashlight5',
        },
        ['frame1'] = {
            component = 'COMPONENT_MK18_FRAME_01',
            item = 'mk18_frame1',
        },
        ['frame2'] = {
            component = 'COMPONENT_MK18_FRAME_02',
            item = 'mk18_frame2',
        },
        ['frame3'] = {
            component = 'COMPONENT_MK18_FRAME_03',
            item = 'mk18_frame3',
        },
        ['scope1'] = {
            component = 'COMPONENT_MK18_SCOPE_01',
            item = 'mk18_scope1',
        },
        ['scope2'] = {
            component = 'COMPONENT_MK18_SCOPE_02',
            item = 'mk18_scope2',
        },
        ['scope3'] = {
            component = 'COMPONENT_MK18_SCOPE_03',
            item = 'mk18_scope3',
        },
        ['scope4'] = {
            component = 'COMPONENT_MK18_SCOPE_04',
            item = 'mk18_scope4',
        },
        ['scope5'] = {
            component = 'COMPONENT_MK18_SCOPE_05',
            item = 'mk18_scope5',
        },
        ['scope6'] = {
            component = 'COMPONENT_MK18_SCOPE_06',
            item = 'mk18_scope6',
        },
        ['scope7'] = {
            component = 'COMPONENT_MK18_SCOPE_07',
            item = 'mk18_scope7',
        },
        ['scope8'] = {
            component = 'COMPONENT_MK18_SCOPE_08',
            item = 'mk18_scope8',
        },
        ['scope9'] = {
            component = 'COMPONENT_MK18_SCOPE_09',
            item = 'mk18_scope9',
        },
        ['stock1'] = {
            component = 'COMPONENT_MK18_STOCK_01',
            item = 'mk18_stock1',
        },
        ['stock2'] = {
            component = 'COMPONENT_MK18_STOCK_02',
            item = 'mk18_stock2',
        },
        ['stock3'] = {
            component = 'COMPONENT_MK18_STOCK_03',
            item = 'mk18_stock3',
        },
        ['stock4'] = {
            component = 'COMPONENT_MK18_STOCK_04',
            item = 'mk18_stock4',
        },
        ['stock5'] = {
            component = 'COMPONENT_MK18_STOCK_05',
            item = 'mk18_stock5',
        },
        ['stock6'] = {
            component = 'COMPONENT_MK18_STOCK_06',
            item = 'mk18_stock6',
        },
        ['stock7'] = {
            component = 'COMPONENT_MK18_STOCK_07',
            item = 'mk18_stock7',
        },
        ['grip1'] = {
            component = 'COMPONENT_MK18_GRIP_01',
            item = 'mk18_grip1',
        },
        ['grip2'] = {
            component = 'COMPONENT_MK18_GRIP_02',
            item = 'mk18_grip2',
        },
        ['grip3'] = {
            component = 'COMPONENT_MK18_GRIP_03',
            item = 'mk18_grip3',
        },
        ['grip4'] = {
            component = 'COMPONENT_MK18_GRIP_04',
            item = 'mk18_grip4',
        },
        ['grip5'] = {
            component = 'COMPONENT_MK18_GRIP_05',
            item = 'mk18_grip5',
        },
    },
    ['WEAPON_STAFF'] = {
        ['luxfinish1'] = {
            component = 'COMPONENT_STAFF_02',
            item = 'staff_luxfinish1'
        },
        ['luxfinish2'] = {
            component = 'COMPONENT_STAFF_03',
            item = 'staff_luxfinish2'
        },
        ['luxfinish3'] = {
            component = 'COMPONENT_STAFF_04',
            item = 'staff_luxfinish3'
        },
        ['luxfinish4'] = {
            component = 'COMPONENT_STAFF_05',
            item = 'staff_luxfinish4'
        },
        ['luxfinish5'] = {
            component = 'COMPONENT_STAFF_06',
            item = 'staff_luxfinish5'
        },
        ['luxfinish6'] = {
            component = 'COMPONENT_STAFF_07',
            item = 'staff_luxfinish6'
        },
        ['luxfinish7'] = {
            component = 'COMPONENT_STAFF_08',
            item = 'staff_luxfinish7'
        },
        ['luxfinish8'] = {
            component = 'COMPONENT_STAFF_09',
            item = 'staff_luxfinish8'
        },
        ['luxfinish9'] = {
            component = 'COMPONENT_STAFF_10',
            item = 'staff_luxfinish9'
        },
        ['luxfinish10'] = {
            component = 'COMPONENT_STAFF_11',
            item = 'staff_luxfinish10'
        },
    },
}