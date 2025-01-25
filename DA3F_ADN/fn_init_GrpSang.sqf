/*
	Aroun
	fn_init_GrpSang.sqf
	[player]spawn DA3F_fnc_init_GrpSang
*/

private _DA3F_Unit			= param[0, player, [objNull]];
if !(isNil {_DA3F_Unit getVariable "DA3F_Grp_Sang"}) exitWith {};// Qu'est ce que tu fou la !? déjà dans un groupe
/*Attibution du groupe sanguin*/
private _groupes_Sanguin 	= ["AB+","AB-","A+","A-","B+","B-","O+","O-"];
private _value 				= 0;
private _GrpSgUnit 			= "";
private _DA3F_Wait 			= FALSE;
_GrpSgUnit 			= _DA3F_Unit getVariable ["DA3F_Grp_Sang", ""];

scopeName "NeutreAdnScope";

waitUntil
{
	{
		_value = switch (_x) do
		{
			case "O-": {11}; case "O+": {42};
			case "A-": {10}; case "A+": {38};
			case "B-": {6}; case "B+": {13};
			case "AB-": {5}; case "AB+": {7};
		};

		if ((_GrpSgUnit isEqualTo "") && {round (random 100)<= _value}) then
			{
				_DA3F_Unit setVariable ["DA3F_Grp_Sang", _x, true];
				_DA3F_Wait = true;
				breakTo "NeutreAdnScope";
			};

	}foreach _groupes_Sanguin;
_DA3F_Wait
};

// hint format ["Votre groupe sanguin est le :\n%1", _DA3F_Unit getVariable ["DA3F_Grp_Sang", ""]];
