/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Vous n'avez rien choisi à supprimer.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Vous n'avez pas entré de format de nombre valide."};
if(parseNumber(_value) <= 0) exitWith {hint "Vous devez entrer un montant à supprimer."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["C'est un objet illégal et des Gendarmes sont à proximité : vous NE POUVEZ PAS supprimer cette preuve.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Vous ne pouvez pas supprimer d'objets dans votre véhicule.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Impossible d'en supprimer autant. Vérifiez le montant d'objets à supprimer."};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Vous avez correctement supprimé %1 %2 de votre inventaire.",(parseNumber _value), _type];

[] call life_fnc_p_updateMenu;