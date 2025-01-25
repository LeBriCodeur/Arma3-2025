/*
	Aroun
	fn_CheckCompatible_ADN.sqf
*/

		/* Tableau Compatibilité des groupes sanguins */
	_compatible = [
	["O-",["AB+","AB-","A+","A-","B+","B-","O+","O-"]],
	["O+",["AB+","A+","B+","O+"]],
	["B-",["AB+","AB-","B+","B-"]],
	["B+",["AB+","B+"]],
	["A-",["AB+","AB-","A+","A-"]],
	["A+",["AB+","A+"]],
	["AB-",["AB+","AB-"]],
	["AB+",["AB+"]]
	];

	disableSerialization;

	_display = findDisplay 46 createDisplay "RscDisplayEmpty";

	_backG = _display ctrlCreate ["RscText", -1];
	_backG ctrlSetPosition [0.520625 * safezoneW + safezoneX,0.423 * safezoneH + safezoneY,0.175313 * safezoneW,0.308 * safezoneH];
	_backG ctrlSetBackgroundColor [0,0,0,1];
	_backG ctrlCommit 0;
	_txtHead = _display ctrlCreate ["RscText", -1];
	_txtHead ctrlSetPosition [0.530937 * safezoneW + safezoneX,0.440 * safezoneH + safezoneY,0.154687 * safezoneW,0.022 * safezoneH];
	_txtHead ctrlSetText "Recherche Compatibilité :";
	_txtHead ctrlSetBackgroundColor [-1,-1,-1,-1];
	_txtHead ctrlCommit 0;
	_edit = _display ctrlCreate ["RscEdit", 645];
	_edit ctrlSetPosition [0.530937 * safezoneW + safezoneX,0.467 * safezoneH + safezoneY,0.154687 * safezoneW,0.022 * safezoneH];
	_edit ctrlSetBackgroundColor [0,0,0,1];
	_edit ctrlCommit 0;
	_tv = _display ctrlCreate ["RscTreeSearch", -1];
	_tv ctrlSetFont "EtelkaMonospacePro";
	_tv ctrlSetFontHeight 0.04;
	_tv ctrlSetPosition [0.530937 * safezoneW + safezoneX,0.511 * safezoneH + safezoneY,0.154687 * safezoneW,0.198 * safezoneH];
	_tv ctrlSetBackgroundColor [0,0,0,1];
	_tv ctrlCommit 0;


	_All_grp=[];
	for "_a" from 0 to (count _compatible-1) do {
	_grp = (_compatible select _a)select 0;
	_Compa = (_compatible select _a)select 1;
	_tv tvAdd [[],_grp];
	for "_b" from 0 to (count _Compa-1) do {
	_tv tvAdd [[_a],_Compa select _b];
		};
	};