Config = {}

Config.MinimalDoctors = 2
Config.WipeInventoryOnRespawn = true

Config.KnockoutWeapons = {
    ["Crowbar"]--[[Weapon name. Can be whatever its just a refrence]] = GetHashKey("weapon_crowbar")--[[weapon spawn name]],
    ["Baseball Bat"] = GetHashKey("weapon_bat"),
    ["Broken Bottle"] = GetHashKey("weapon_bottle"),
    ["Fist"] = GetHashKey("weapon_unarmed"),
    ["Flashlight"] = GetHashKey("weapon_flashlight"),
    ["Golf Club"] = GetHashKey("weapon_golfclub"),
    ["Hammer"] = GetHashKey("weapon_hammer"),
    ["Brass Knuckles"] = GetHashKey("weapon_knuckle"),
    ["Nightstick"] = GetHashKey("weapon_nightstick"),
    ["Pipe Wrench"] = GetHashKey("weapon_wrench"),
    ["Pool Cue"] = GetHashKey("weapon_poolcue"),
}

Config.Locations = {
    ["checking"] = {
	    [1] = vector3(306.9, -594.82, 43.28),
    },
    ["duty"] = {
        [1] = vector3(306.61, -597.74, 43.28),
    },
    ["vehicle"] = {
        [1] = vector4(294.578, -574.761, 43.179, 35.792),
    },
    ["helicopter"] = {
        [1] = vector4(351.58, -587.45, 74.16, 160.5),
    },
    ["armory"] = {
        [1] = vector3(306.62, -601.6, 43.28),
    },
    ["roof"] = {
        --[1] = vector4(338.5, -583.85, 74.16, 245.5),
    },
    ["main"] = {
        --[1] = vector3(298.44, -599.7, 43.29),
    },
    ["stash"] = {
        [1] = vector3(298.99, -598.22, 43.28),
    },
    ["beds"] = {
        [1] = {coords = vector4(309.25, -577.36, 44.2, 162.33), taken = false, model = 1631638868},
        [2] = {coords = vector4(313.81, -579.12, 44.2, 165.44), taken = false, model = 1631638868},
        [3] = {coords = vector4(319.41, -580.93, 44.2, 163.08), taken = false, model = 1631638868},
        [4] = {coords = vector4(324.24, -582.67, 44.2, 164.87), taken = false, model = 1631638868},

        [5] = {coords = vector4(322.72, -587.23, 44.2, 342.32), taken = false, model = 1631638868},
        [6] = {coords = vector4(317.67, -585.46, 44.2, 337.81), taken = false, model = 1631638868},
        [7] = {coords = vector4(314.51, -584.14, 44.2, 342.61), taken = false, model = 1631638868},
        [8] = {coords = vector4(310.98, -582.95, 44.2, 342.97), taken = false, model = 1631638868},
	    [9] = {coords = vector4(307.71, -581.91, 44.2, 342.95), taken = false, model = 1631638868},
    },
    ["stations"] = {
        [1] = {label = Lang:t('info.pb_hospital'), coords = vector4(304.27, -600.33, 43.28, 272.249)}
    }
}

Config.AuthorizedVehicles = {
	-- Grade 0
	[0] = {
		["ambulance"] = "Ambulance",
	},
	-- Grade 1
	[1] = {
		["ambulance"] = "Ambulance",

	},
	-- Grade 2
	[2] = {
		["ambulance"] = "Ambulance",
	},
	-- Grade 3
	[3] = {
		["ambulance"] = "Ambulance",
	},
	-- Grade 4
	[4] = {
		["ambulance"] = "Ambulance",
	}
}

Config.Helicopter = "polmav"

Config.Items = {
    label = Lang:t('info.safe'),
    slots = 30,
    items = {
        [1] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "painkillers",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "firstaid",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_fireextinguisher",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
    }
}

Config.BillCost = 2000
Config.DeathTime = 300
Config.CheckTime = 10

Config.PainkillerInterval = 60 -- seconds

--[[
    GENERAL SETTINGS | THESE WILL AFFECT YOUR ENTIRE SERVER SO BE SURE TO SET THESE CORRECTLY
    MaxHp : Maximum HP Allowed, set to -1 if you want to disable mythic_hospital from setting this
        NOTE: Anything under 100 and you are dead
    RegenRate :
]]
Config.MaxHp = 200
Config.RegenRate = 0.0

--[[
    HealthDamage : How Much Damage To Direct HP Must Be Applied Before Checks For Damage Happens
    ArmorDamage : How Much Damage To Armor Must Be Applied Before Checks For Damage Happens | NOTE: This will in turn make stagger effect with armor happen only after that damage occurs
]]
Config.HealthDamage = 5
Config.ArmorDamage = 5

--[[
    MaxInjuryChanceMulti : How many times the HealthDamage value above can divide into damage taken before damage is forced to be applied
    ForceInjury : Maximum amount of damage a player can take before limb damage & effects are forced to occur
]]
Config.MaxInjuryChanceMulti = 3
Config.ForceInjury = 35
Config.AlwaysBleedChance = 70

--[[
    Message Timer : How long it will take to display limb/bleed message
]]
Config.MessageTimer = 12

--[[
    AIHealTimer : How long it will take to be healed after checking in, in seconds
]]
Config.AIHealTimer = 20

--[[
    BleedTickRate : How much time, in seconds, between bleed ticks
]]
Config.BleedTickRate = 30

--[[
    BleedMovementTick : How many seconds is taken away from the bleed tick rate if the player is walking, jogging, or sprinting
    BleedMovementAdvance : How Much Time Moving While Bleeding Adds (This Adds This Value To The Tick Count, Meaing The Above BleedTickRate Will Be Reached Faster)
]]
Config.BleedMovementTick = 10
Config.BleedMovementAdvance = 3

--[[
    The Base Damage That Is Multiplied By Bleed Level Every Time A Bleed Tick Occurs
]]
Config.BleedTickDamage = 8

--[[
    FadeOutTimer : How many bleed ticks occur before fadeout happens
    BlackoutTimer : How many bleed ticks occur before blacking out
    AdvanceBleedTimer : How many bleed ticks occur before bleed level increases
]]
Config.FadeOutTimer = 2
Config.BlackoutTimer = 10
Config.AdvanceBleedTimer = 10

--[[
    HeadInjuryTimer : How much time, in seconds, do head injury effects chance occur
    ArmInjuryTimer : How much time, in seconds, do arm injury effects chance occur
    LegInjuryTimer : How much time, in seconds, do leg injury effects chance occur
]]
Config.HeadInjuryTimer = 30
Config.ArmInjuryTimer = 30
Config.LegInjuryTimer = 15

--[[
    The Chance, In Percent, That Certain Injury Side-Effects Get Applied
]]
Config.HeadInjuryChance = 25
Config.ArmInjuryChance = 25
Config.LegInjuryChance = {
    Running = 50,
    Walking = 15
}

Config.DamageAnimations = {
    ["melee@knife@streamed_core"] = {
        anims = {
            "non_melee_damage_walk_right",
            "melee_damage_front",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "non_melee_damage_left",
            "melee_damage_left",
        }
    },
    ["melee@knife@streamed_variations"] = {
        anims = {"melee_damage_front_var_a"}
    },
    ["melee@large_wpn@streamed_core"] = {
        anims = {
            "non_melee_damage_walk_right",
            "melee_damage_front",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "non_melee_damage_left",
            "melee_damage_left",
        }
    },
    ["melee@large_wpn@streamed_core_fps"] = {
        anims = {
            "non_melee_damage_walk_right",
            "melee_damage_front",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "melee_damage_front_var_a",
            "non_melee_damage_left",
            "melee_damage_left",
        }
    },
    ["melee@large_wpn@streamed_variations"] = {
        anims = {
            "melee_damage_front_var_a"
        }
    },
    ["melee@pistol@streamed_core"] = {
        anims = {
            "non_melee_damage_left",
            "non_melee_damage_front",
            "non_melee_damage_back",
            "non_melee_damage_right"
        }
    },
    ["melee@pistol@streamed_fps"] = {
        anims = {
            "non_melee_damage_back",
            "non_melee_damage_left",
            "non_melee_damage_right",
            "non_melee_damage_front"
        }
    },
    ["melee@rifle@streamed_core"] = {
        anims = {
            "non_melee_damage_left",
            "non_melee_damage_front",
            "non_melee_damage_back",
            "non_melee_damage_right"
        }
    },
    ["melee@rifle@streamed_fps"] = {
        anims = {
            "non_melee_damage_back",
            "non_melee_damage_left",
            "non_melee_damage_right",
            "non_melee_damage_front"
        }
    },
    ["melee@small_wpn@streamed_core"] = {
        anims = {
            "non_melee_damage_walk_right",
            "melee_damage_front",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "non_melee_damage_left",
            "melee_damage_left"
        }
    },
    ["melee@small_wpn@streamed_core_fps"] = {
        anims = {
            "non_melee_damage_walk_right",
            "melee_damage_front",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "melee_damage_front_var_a",
            "non_melee_damage_left",
            "melee_damage_left",
        }
    },
    ["melee@small_wpn@streamed_variations"] = {
        anims = {
            "melee_damage_front_var_a"
        }
    },
    ["melee@unarmed@streamed_core"] = {
        anims = {
            "non_melee_damage_walk_right",
            "non_melee_damage_front",
            "melee_damage_legs_a",
            "non_melee_damage_right",
            "melee_damage_right",
            "non_melee_damage_back",
            "non_melee_damage_walk_left",
            "melee_damage_legs_b",
            "melee_damage_back",
            "non_melee_damage_left",
            "melee_damage_left"
        }
    },
    ["melee@unarmed@streamed_core_fps"] = {
        anims = {
            "melee_damage_legs_a",
            "non_melee_damage_walk_right",
            "non_melee_damage_back",
            "non_melee_damage_right",
            "non_melee_damage_left",
            "non_melee_damage_walk_left",
            "non_melee_damage_front",
            "melee_damage_right",
            "melee_damage_back",
            "melee_damage_legs_b",
            "melee_damage_left"
        }
    },
    ["melee@unarmed@streamed_taunts"] = {
        anims = {
            "damage_02",
            "damage_03",
            "damage_01",
            "damage_04"
        }
    },
    ["stungun@sitting"] = {
        anims = {
            "damage_vehicle"
        }
    },
    ["stungun@standing"] = {
        anims = {
            "damage"
        }
    },
    ["get_up@directional@movement@from_knees@action"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_knees@injured"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_knees@panic"] = {
        anims = {
            "get_up_180",
            "get_up_-180",
            "get_up_0",
            "get_up_-90",
            "get_up_90"
        }
    },
    ["get_up@directional@movement@from_knees@standard"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_seated@action"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_seated@drunk"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_seated@injured"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },
    ["get_up@directional@movement@from_seated@panic"] = {
        anims = {
            "get_up_180",
            "get_up_-180",
            "get_up_0",
            "get_up_-90",
            "get_up_90"
        }
    },
    ["get_up@directional@movement@from_seated@standard"] = {
        anims = {
            "get_up_l_90",
            "get_up_r_90",
            "get_up_l_180",
            "get_up_l_0",
            "get_up_r_180",
            "get_up_r_0"
        }
    },
    ["get_up@first_person@directional@movement@from_knees@standard"] = {
        anims = {
            "getup_l_-180",
            "v_25_levnumbers_loda",
            "getup_l_-90",
            "getup_r_180",
            "getup_r_90",
            "getup_l_0"
        }
    },--[[
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },
    [""] = {
        anims = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        }
    },]]
}

--[[
    MajorArmoredBleedChance : The % Chance Someone Gets A Bleed Effect Applied When Taking Major Damage With Armor
    MajorDoubleBleed : % Chance You Have To Receive Double Bleed Effect From Major Damage, This % is halved if the player has armor
]]
Config.MajorArmoredBleedChance = 45

--[[
    DamgeMinorToMajor : How much damage would have to be applied for a minor weapon to be considered a major damage event. Put this at 100 if you want to disable it
]]
Config.DamageMinorToMajor = 35

--[[
    AlertShowInfo :
]]
Config.AlertShowInfo = 2

--[[
    These following lists uses tables defined in definitions.lua, you can technically use the hardcoded values but for sake
    of ensuring future updates doesn't break it I'd highly suggest you check that file for the index you're wanting to use.

    MinorInjurWeapons : Damage From These Weapons Will Apply Only Minor Injuries
    MajorInjurWeapons : Damage From These Weapons Will Apply Only Major Injuries
    AlwaysBleedChanceWeapons : Weapons that're in the included weapon classes will roll for a chance to apply a bleed effect if the damage wasn't enough to trigger an injury chance
    CriticalAreas :
    StaggerAreas : These are the body areas that would cause a stagger is hit by firearms,
        Table Values: Armored = Can This Cause Stagger If Wearing Armor, Major = % Chance You Get Staggered By Major Damage, Minor = % Chance You Get Staggered By Minor Damage
]]

Config.WeaponClasses = {
    ['SMALL_CALIBER'] = 1,
    ['MEDIUM_CALIBER'] = 2,
    ['HIGH_CALIBER'] = 3,
    ['SHOTGUN'] = 4,
    ['CUTTING'] = 5,
    ['LIGHT_IMPACT'] = 6,
    ['HEAVY_IMPACT'] = 7,
    ['EXPLOSIVE'] = 8,
    ['FIRE'] = 9,
    ['SUFFOCATING'] = 10,
    ['OTHER'] = 11,
    ['WILDLIFE'] = 12,
    ['NOTHING'] = 13
}

Config.MinorInjurWeapons = {
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = true,
    [Config.WeaponClasses['OTHER']] = true,
    [Config.WeaponClasses['LIGHT_IMPACT']] = true,
}

Config.MajorInjurWeapons = {
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['SHOTGUN']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.AlwaysBleedChanceWeapons = {
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = false,
}

Config.ForceInjuryWeapons = {
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.CriticalAreas = {
    ['UPPER_BODY'] = { armored = false },
    ['LOWER_BODY'] = { armored = true },
    ['SPINE'] = { armored = true },
}

Config.StaggerAreas = {
    ['SPINE'] = { armored = true, major = 60, minor = 30 },
    ['UPPER_BODY'] = { armored = false, major = 60, minor = 30 },
    ['LLEG'] = { armored = true, major = 100, minor = 85 },
    ['RLEG'] = { armored = true, major = 100, minor = 85 },
    ['LFOOT'] = { armored = true, major = 100, minor = 100 },
    ['RFOOT'] = { armored = true, major = 100, minor = 100 },
}

Config.WoundStates = {
    Lang:t('states.irritated'),
    Lang:t('states.quite_painful'),
    Lang:t('states.painful'),
    Lang:t('states.really_painful'),
}

Config.BleedingStates = {
    [1] = {label = Lang:t('states.little_bleed'), damage = 10, chance = 50},
    [2] = {label = Lang:t('states.bleed'), damage = 15, chance = 65},
    [3] = {label = Lang:t('states.lot_bleed'), damage = 20, chance = 65},
    [4] = {label = Lang:t('states.big_bleed'), damage = 25, chance = 75},
}

Config.MovementRate = {
    0.98,
    0.96,
    0.94,
    0.92,
}

Config.Bones = {
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089] = 'LFINGER',
    [4090] = 'LFINGER',
    [4137] = 'LFINGER',
    [4138] = 'LFINGER',
    [4153] = 'LFINGER',
    [4154] = 'LFINGER',
    [4169] = 'LFINGER',
    [4170] = 'LFINGER',
    [4185] = 'LFINGER',
    [4186] = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108] = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}

Config.BoneIndexes = {
    ['NONE'] = 0,
    -- ['HEAD'] = 31085,
    ['HEAD'] = 31086,
    ['NECK'] = 39317,
    -- ['SPINE'] = 57597,
    -- ['SPINE'] = 23553,
    -- ['SPINE'] = 24816,
    -- ['SPINE'] = 24817,
    ['SPINE'] = 24818,
    -- ['UPPER_BODY'] = 10706,
    ['UPPER_BODY'] = 64729,
    ['LOWER_BODY'] = 11816,
    -- ['LARM'] = 45509,
    ['LARM'] = 61163,
    ['LHAND'] = 18905,
    -- ['LFINGER'] = 4089,
    -- ['LFINGER'] = 4090,
    -- ['LFINGER'] = 4137,
    -- ['LFINGER'] = 4138,
    -- ['LFINGER'] = 4153,
    -- ['LFINGER'] = 4154,
    -- ['LFINGER'] = 4169,
    -- ['LFINGER'] = 4170,
    -- ['LFINGER'] = 4185,
    -- ['LFINGER'] = 4186,
    -- ['LFINGER'] = 26610,
    -- ['LFINGER'] = 26611,
    -- ['LFINGER'] = 26612,
    -- ['LFINGER'] = 26613,
    ['LFINGER'] = 26614,
    -- ['LLEG'] = 58271,
    ['LLEG'] = 63931,
    -- ['LFOOT'] = 2108,
    ['LFOOT'] = 14201,
    -- ['RARM'] = 40269,
    ['RARM'] = 28252,
    ['RHAND'] = 57005,
    -- ['RFINGER'] = 58866,
    -- ['RFINGER'] = 58867,
    -- ['RFINGER'] = 58868,
    -- ['RFINGER'] = 58869,
    -- ['RFINGER'] = 58870,
    -- ['RFINGER'] = 64016,
    -- ['RFINGER'] = 64017,
    -- ['RFINGER'] = 64064,
    -- ['RFINGER'] = 64065,
    -- ['RFINGER'] = 64080,
    -- ['RFINGER'] = 64081,
    -- ['RFINGER'] = 64096,
    -- ['RFINGER'] = 64097,
    -- ['RFINGER'] = 64112,
    ['RFINGER'] = 64113,
    -- ['RLEG'] = 36864,
    ['RLEG'] = 51826,
    -- ['RFOOT'] = 20781,
    ['RFOOT'] = 52301,
}

Config.Weapons = {
    [`WEAPON_STUNGUN`] = Config.WeaponClasses['NONE'],
    [`WEAPON_STUNGUN_MP`] = Config.WeaponClasses['NONE'],
    --[[ Small Caliber ]]--
    [`WEAPON_PISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_APPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPDW`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MACHINEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MICROSMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MINISMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_VINTAGEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],

    --[[ Medium Caliber ]]--
    [`WEAPON_ADVANCEDRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_ASSAULTSMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_COMPACTRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_DOUBLEACTION`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_GUSENBERG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_HEAVYPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_MARKSMANPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_PISTOL50`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],

    --[[ High Caliber ]]--
    [`WEAPON_ASSAULTRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_ASSAULTRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MINIGUN`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MUSKET`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RAILGUN`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],

    --[[ Shotguns ]]--
    [`WEAPON_ASSAULTSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_BULLUPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_DBSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_HEAVYSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN_MK2`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SAWNOFFSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SWEEPERSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],

    --[[ Animals ]]--
    [`WEAPON_ANIMAL`] = Config.WeaponClasses['WILDLIFE'], -- Animal
    [`WEAPON_COUGAR`] = Config.WeaponClasses['WILDLIFE'], -- Cougar
    [`WEAPON_BARBED_WIRE`] = Config.WeaponClasses['WILDLIFE'], -- Barbed Wire

    --[[ Cutting Weapons ]]--
    [`WEAPON_BATTLEAXE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_BOTTLE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_DAGGER`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_HATCHET`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_KNIFE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MACHETE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_SWITCHBLADE`] = Config.WeaponClasses['CUTTING'],

    --[[ Light Impact ]]--
    [`WEAPON_KNUCKLE`] = Config.WeaponClasses['LIGHT_IMPACT'],

    --[[ Heavy Impact ]]--
    [`WEAPON_BAT`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_CROWBAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIREEXTINGUISHER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIRWORK`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_GOLFLCUB`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_HAMMER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_PETROLCAN`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_POOLCUE`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_WRENCH`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RAMMED_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RUN_OVER_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],

    --[[ Explosives ]]--
    [`WEAPON_EXPLOSION`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_GRENADE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_COMPACTLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HOMINGLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PIPEBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PROXMINE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_RPG`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_STICKYBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HELI_CRASH`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_EMPLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],

    --[[ Other ]]--
    [`WEAPON_FALL`] = Config.WeaponClasses['OTHER'], -- Fall
    [`WEAPON_HIT_BY_WATER_CANNON`] = Config.WeaponClasses['OTHER'], -- Water Cannon

    --[[ Fire ]]--
    [`WEAPON_ELECTRIC_FENCE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FIRE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_MOLOTOV`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLARE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLAREGUN`] = Config.WeaponClasses['FIRE'],

    --[[ Suffocate ]]--
    [`WEAPON_DROWNING`] = Config.WeaponClasses['SUFFOCATING'], -- Drowning
    [`WEAPON_DROWNING_IN_VEHICLE`] = Config.WeaponClasses['SUFFOCATING'], -- Drowning Veh
    [`WEAPON_EXHAUSTION`] = Config.WeaponClasses['SUFFOCATING'], -- Exhaust
    [`WEAPON_BZGAS`] = Config.WeaponClasses['SUFFOCATING'],
    [`WEAPON_SMOKEGRENADE`] = Config.WeaponClasses['SUFFOCATING'],
}

Config.VehicleSettings = {
    ["car1"] = { -- Model name
        ["extras"] = {
            ["1"] = false, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    },
    ["car2"] = {
        ["extras"] = {
            ["1"] = false,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    }
}