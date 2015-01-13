/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Beige";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge sombre";};
			case 5: {_color = "Bleu / Blanc"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Gendarmerie"};
			case 8: {_color = "Taxi"};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Vert";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu sombre";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Noir"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Bleu sombre"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Blanc / Noir"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Vert"};
			case 6: {_color = "Gendarmerie"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge sombre";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Argent";};
			case 3: {_color = "Orange";};
			case 4: {_color = "GIGN";};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Marron"};
			case 1: {_color = "Desert Digital"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Vert Digital"};
			case 7: {_color = "Camo Hunter"};
			case 8: {_color = "Camo Rebel"};
		};
	};

	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Bleu civil"};
			case 3: {_color = "Rouge civil"};
			case 4: {_color = "Vert Digital"};
			case 5: {_color = "Ligne bleue"};
			case 6: {_color = "Elliptique"};
			case 7: {_color = "Furieux"};
			case 8: {_color = "Jeans Bleu"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Vagues Bleues"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "EMS Blanc"};
			case 15: {_color = "GIGN"};
		};
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Vert Digital"};
			case 3: {_color = "Desert Digital"};
			case 4: {_color = "EMS Blanc"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GIGN"};
			case 1: {_color = "Noir"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};

	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "B_UGV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gris"};
		};
	};
};

_color;