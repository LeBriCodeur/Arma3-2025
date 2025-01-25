/*
    Aroun
    fn_init_ADN.sqf

    _veh setVariable ["DA3F_indice",[],true];
    _veh addEventHandler ["GetIn",{_this call DA3F_fnc_Set_Indice_ADN}];

*/

private _unikID = "";
private _RandomID = "";
private _newADN = "";
private _value = 15;

private _uid = getPlayerUID player;

private _is_finish = [player]spawn DA3F_fnc_init_GrpSang;
waitUntil { scriptDone _is_finish; };
private _grp_sang = player getVariable ["DA3F_Grp_Sang", ""];

if (_uid isEqualTo "_SP_PLAYER_") then {
    _uid = profileName;
    _value = ((count (profileName))- 3);
};

_unikID = format ["%1%2%3", _uid select [0,2], profileName select [0,2], _uid select [_value]];

_RandomID = format ["%1", toString[
    65 + (ceil (random 25)),
    65 + (ceil (random 25)),
    48 + (ceil (random 9)),
    48 + (ceil (random 9)),
    65 + (ceil (random 25))
]];

_newADN = format ["%1_%2%3",_unikID, _grp_sang, _RandomID];
player setVariable ["DA3F_seqAdn", _newADN, true];
hint format ["Séquence ADN : %1\nGroupe sanguin : %2", _newADN, _grp_sang];