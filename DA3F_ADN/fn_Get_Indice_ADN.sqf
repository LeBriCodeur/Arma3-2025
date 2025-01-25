/*
    Aroun
    fn_Get_Indice_ADN.sqf
    []spawn DA3F_fnc_Get_Indice_ADN
*/

private _DA3F_Target 	= cursorObject;
private _DA3F_Indices	= [];
private _DA3F_Cnt		= 0;
if (_DA3F_Target isKindOf "Man") exitWith {};

_DA3F_Indices = _DA3F_Target getVariable ["DA3F_indices", []];

_DA3F_Cnt = count _DA3F_Indices;

private _done = ["-Analyse rapide-\nAnalyse en cours", 8] spawn DA3F_fnc_dot_anim_wait;
waitUntil {scriptDone _done};

hintSilent format ["-Compte rendu d'analyse rapide-\nLe véhicule est porteur d'au moins %1 trace ADN.\nApportez le véhicule au labo pour analyse",ceil random(_DA3F_Cnt)];