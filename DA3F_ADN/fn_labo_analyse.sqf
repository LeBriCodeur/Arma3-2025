/*
	Aroun
	fn_labo_analyse.sqf
	[]spawn DA3F_fnc_labo_analyse
*/
private _DA3F_target = cursorObject;
if (_DA3F_target isKindOf "Man") exitWith {
	hint "Tu dois regarder le véhicule à analyser.";
};
private _info_veh = _DA3F_target getVariable ["DA3F_indices", []];
private _done = ["-Compte rendu d'analyse détaillé-\nAnalyse du véhicule en cours", 8] spawn DA3F_fnc_dot_anim_wait;
waitUntil {scriptDone _done};
hint "Analyse terminé !\nCompte rendu : ";
sleep 2;

if (_info_veh isEqualTo []) then {
	hintSilent "-Compte rendu d'analyse détaillé-\nAucun résultat";
}else{
	{
		_x params ["_DA3F_uid","_DA3F_name","_DA3F_role","_DA3F_MyGrpSang", "_DA3F_seqADN", "_DA3F_value"];
		hintSilent format["-Compte rendu d'analyse détaillé-\nuid : %1\nname : %2\nrôles : %3\nGrp sang :%4\nSeq. ADN :%5\nValue : %6", _DA3F_uid, _DA3F_name, _DA3F_role, _DA3F_MyGrpSang, _DA3F_seqADN, _DA3F_value];
		sleep 1;
	} forEach _info_veh;
};
