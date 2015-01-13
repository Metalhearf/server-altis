#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas policier !"};
			default
			{
				["Altis Cop Shop",
					[
						["R3F_PAMAS",nil,3000],
						["R3F_15Rnd_9x19_PAMAS",nil,100],

						//["arifle_sdar_F","Fusil Tazer",20000],
						//["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],

						["hgun_P07_snds_F","Tazer",200],
						["16Rnd_9x21_Mag","Munitions Tazer",50],

						["HandGrenade_Stone","Flashbang",1000],

						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["MineDetector",nil,1000],
						["B_UAVTerminal",nil,1500]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"Vous n'êtes pas Médecin !"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas policier !"};
			case (__GETC__(life_coplevel) < 2): {"Vous n'êtes pas assez gradé ! (Rang 2)"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["R3F_Famas_G2_HG",nil,10000],
						["R3F_30Rnd_556x45_TRACER_FAMAS",nil,100],
						//["R3F_SILENCIEUX_FAMAS",nil,2500],

						["R3F_MP5SD",nil,12500],
						["R3F_30Rnd_9x19_MP5",nil,100],

						["R3F_HK416M_HG",nil,15000],
						["R3F_30Rnd_556x45_TRACER_HK416",nil,100],
						["R3F_SILENCIEUX_HK416",nil,2500],

						["R3F_HK417L",nil,20000],
						["R3F_20Rnd_762x51_TRACER_HK417",nil,100],
						//["R3F_SILENCIEUX_HK417",nil,3500],

						["R3F_FRF2",nil,20000],
						["R3F_10Rnd_762x51_FRF2",nil,100],
						//["R3F_SILENCIEUX_FRF2",nil,5000],

						["R3F_AIMPOINT",nil,1000],
						["R3F_EOTECH",nil,1000],
						["R3F_LAMPE_SURB",nil,500],
						//["R3F_POINTEUR_SURB",nil,500],
						["R3F_PIRAT",nil,500],

						["R3F_J4",nil,1500],
						["R3F_J8_MILDOT",nil,1500],
						["R3F_J10_MILDOT",nil,1500],
						["R3F_NF",nil,1500],
						["R3F_NF42",nil,1500],
						["R3F_ZEISS",nil,1500],
						["R3F_OB50",nil,1500]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"Vous n'êtes pas assez gradé ! (Rang 3)"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["R3F_Minimi_762",nil,15000],
						["R3F_100Rnd_762x51_MINIMI",nil,500],

						["R3F_Famas_felin",nil,20000],
						["R3F_30Rnd_556x45_TRACER_FAMAS",nil,100],
						["R3F_FELIN",nil,700],

						["R3F_M107",nil,50000],
						["R3F_10Rnd_127x99_M107",nil,200]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas un Civil !"};
			case (!license_civ_rebel): {"Vous n'avez pas de Licence Rebelle !"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,275],
						["srifle_DMR_01_F",nil,50000],
						["10Rnd_762x51_Mag",nil,500],
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag",nil,125],
						["srifle_LRR_SOS_F",nil,80000],
	                    ["7Rnd_408_Mag",nil,500],
                        ["srifle_EBR_DMS_pointer_snds_F",nil,55000],
                        ["20Rnd_762x51_Mag",nil,700],
                        ["muzzle_snds_B",nil,4000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,7500],
                        ["acc_flashlight",nil,1000]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas un Civil !"};
			case (!license_civ_gun): {"Vous n'avez pas de Licence d'Armes !"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["6Rnd_45ACP_Cylinder",nil,50],
						["hgun_ACPC2_F",nil,11500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,75],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas Civil !"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["6Rnd_45ACP_Cylinder",nil,50],
						["hgun_ACPC2_F",nil,4500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,9500],
						["30Rnd_9x21_Mag",nil,75]
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
