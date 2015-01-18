/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Marché Civil",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Marché Rebel",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Marché Gang", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Cuisine de Tortues",["turtlesoup","turtle"]]};
	case "coffee": {["Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Dealer de Drogue",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Acheteur de Pétrole",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Marché de Poisson",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Acheteur de Verre",["glass"]]};
	case "iron": {["Acheteur de Fer et Cuivre",["iron_r","copper_r"]]};
	case "diamond": {["Acheteur de Diamants",["diamond","diamondc"]]};
	case "salt": {["Acheteur de Sel",["salt_r"]]};
	case "cop": {["Marché Gendarmerie",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit"]]};
	case "cement": {["Acheteur de Ciment",["cement"]]};
	case "gold": {["Acheteur d'Or",["goldbar"]]};
};