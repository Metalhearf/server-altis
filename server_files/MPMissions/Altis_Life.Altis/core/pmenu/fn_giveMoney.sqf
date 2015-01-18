/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Personne n'est selectionné !";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Vous avez récemment braqué une banque. Vous ne pouvez pas rendre d'argent aussi vite.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous devez un format de nombre valide.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Vous devez entrer une valeur positive d'argent à offrir.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_cash) exitWith {hint "Vous n'avez pas assez d'argent à donner !";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Le joueur sélectionné n'est pas à portée.";};
hint format["Vous avez donné $%1 à %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
life_cash = life_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];