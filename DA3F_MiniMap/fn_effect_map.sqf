/*
	Aroun
	fn_effect_map.sqf
*/
disableSerialization;
private _display = uinameSpace getvariable ["DA3F_RadarMap", displayNull];
private _map = _display displayCtrl 1000;
ctrlMapAnimClear _map;
_map ctrlMapAnimAdd [0, 0.2, player];
ctrlMapAnimCommit _map;

_map ctrlMapAnimAdd [3, 0.03, player];
ctrlMapAnimCommit _map;