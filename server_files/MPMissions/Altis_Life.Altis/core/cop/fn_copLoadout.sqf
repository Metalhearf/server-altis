/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";

player addWeapon "R3F_PAMAS";
player addMagazine "R3F_15Rnd_9x19_PAMAS";
player addMagazine "R3F_15Rnd_9x19_PAMAS";
player addMagazine "R3F_15Rnd_9x19_PAMAS";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "Binocular";
player assignItem "Binocular";
player addItem "ItemIphone";
player assignItem "ItemIphone";

[] call life_fnc_saveGear;