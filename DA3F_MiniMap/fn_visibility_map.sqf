/*
	Aroun
	fn_visibility_map.sqf
*/
if (DA3F_visble) then {
	("DA3F_RadarMap" call BIS_fnc_rscLayer) cutFadeOut 0;
}else{
	[]spawn DA3F_fnc_onloadmap;
};
DA3F_visble = !DA3F_visble;