/*
	Aroun
	fn_Set_Indice_ADN.sqf
	_veh setVariable ["DA3F_indice",[],true];
    _veh addEventHandler ["GetIn",{_this call DA3F_fnc_Set_Indice_ADN}];
	[]call DA3F_fnc_Set_Indice_ADN;
*/

// params ["_DA3F_unit", "_DA3F_role", "_DA3F_vehicle"];
params [
	["_DA3F_vehicle", cursorObject],
	["_DA3F_role", ["inconnu"]],
	["_DA3F_unit", player]
];

private _DA3F_AdnInVehicle = _DA3F_vehicle getVariable ["DA3F_indices", []];
private	_DA3F_MyGrpSang = _DA3F_unit getVariable ["DA3F_Grp_Sang", ""];
private	_DA3F_seqADN = player getVariable ["DA3F_seqAdn", ""];
private _DA3F_uid = getPlayerUID _DA3F_unit;
private _DA3F_name = name _DA3F_unit;
private _DA3F_Idx = -1;
private _DA3F_Value = 0;
private _DA3F_Array = [];
private _DA3F_AddInfos = [_DA3F_uid, _DA3F_name, [_DA3F_role], _DA3F_MyGrpSang, _DA3F_seqADN, 1];

_DA3F_Idx = _DA3F_AdnInVehicle findIf {
	_DA3F_Array = _x;
	((_DA3F_Array param[0, "", [""]])isEqualTo (_DA3F_uid))
};

if (_DA3F_Idx isEqualTo -1) exitWith {
	_DA3F_AdnInVehicle pushBack _DA3F_AddInfos;
	_DA3F_vehicle setVariable ["DA3F_indices", _DA3F_AdnInVehicle, true];
};

_DA3F_Array = _DA3F_AdnInVehicle # _DA3F_Idx;
_DA3F_ArrRole = _DA3F_Array param[2, [], [[]]];
_DA3F_Value = _DA3F_Array param[4, 0, [0]];
_DA3F_Value = _DA3F_Value + 1;

if !(_DA3F_role in _DA3F_ArrRole) then {
	_DA3F_ArrRole pushBack _DA3F_role;
};

_DA3F_Array set [4,_DA3F_Value];
_DA3F_AdnInVehicle set[_DA3F_Idx, _DA3F_Array];

_DA3F_vehicle setVariable ["DA3F_indices", _DA3F_AdnInVehicle, true];