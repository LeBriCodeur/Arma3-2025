/*
	Aroun
	fn_onloadmap.sqf
	init.sqf :
		DA3F_visble = true;
		DA3F_zoom_actif = false;
		[]spawn DA3F_fnc_onloadmap;
*/
disableSerialization;
// 1000 cutRsc ["DA3F_RadarMap", "PLAIN"];
// ("DA3F_RadarMap" call BIS_fnc_rscLayer) cutRsc ["", "PLAIN", 0]; // remove

if (!(isNull (uinameSpace getvariable ["DA3F_RadarMap", displayNull]))) exitWith {};
("DA3F_RadarMap" call BIS_fnc_rscLayer) cutRsc ["DA3F_RadarMap", "PLAIN"];
sleep 0.05;
private _display = uinameSpace getvariable ["DA3F_RadarMap", displayNull];
private _map = _display displayCtrl 1000;
private _txt = _display displayCtrl 1100;
private _p_eat = _display displayCtrl 1001;
private _p_water = _display displayCtrl 1002;
_p_water progressSetPosition 0.7;
_p_eat progressSetPosition 0.4;
DA3F_radar_map = _map;

// respawn map
[_display]spawn {
	params["_display"];
	disableSerialization;
	waitUntil {
		sleep 0.1;
		isNull _display;
	};
	sleep 1;
	DA3F_zoom_actif = false;
	if (!DA3F_visble) exitWith {};
	[]spawn DA3F_fnc_onloadmap;
};

private _DA3F_local_mrk = createMarkerLocal [format["mrk_%1", position player], (position player)];
_DA3F_local_mrk setMarkerShapeLocal "ICON";
_DA3F_local_mrk setMarkerTypeLocal "mil_arrow";
_DA3F_local_mrk setMarkerSizeLocal [(getMarkerSize _DA3F_local_mrk)#0/2,(getMarkerSize _DA3F_local_mrk)#1/2];

private _format_value = {
	params["_value"];
	if (_value isEqualType 0) then {
		_value = str _value;
	};
	if (count _value != 6) exitWith {};
	format["%1-%2", _value select[0,3], _value select[3,6]];
};

for "_i" from 0 to 1 step 0 do {
	if (!DA3F_zoom_actif) then {
		DA3F_radar_map ctrlMapAnimAdd [0, 0.03, player];
		ctrlMapAnimCommit DA3F_radar_map;
	};
	_DA3F_local_mrk setMarkerPosLocal (position player);
	_DA3F_local_mrk setMarkerDirLocal (getDir player);
	_txt ctrlSetStructuredText parseText format ["<t align='center' color='#FEFEFE' >%1</t>",[(mapGridPosition player)] call _format_value];
	sleep 0.05;
	if (!DA3F_visble) exitWith {};
};
deleteMarkerLocal _DA3F_local_mrk;