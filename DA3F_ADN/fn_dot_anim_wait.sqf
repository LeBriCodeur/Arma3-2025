/*
	Aroun
	fn_dot_anim_wait.sqf
	exemple :
	private _done = ["ton message ici", 8] spawn DA3F_fnc_dot_anim_wait;
	waitUntil {scriptDone _done};
*/
params[
	["_msg", "", [""]],
	["_time_wait", 5, [0]]
];

if (_msg isEqualTo "") exitWith {};
private _sign_wait = "";
private _wait = time + _time_wait;
for "_i" from 0 to 1 step 0 do {
	if (count _sign_wait < 3) then {
		_sign_wait = _sign_wait + ".";
	} else {
		if (count _sign_wait == 3) then {
			_sign_wait = ""
		};
	};
	hintSilent format["%1%2", _msg, _sign_wait];
	sleep (.2 + random 1);
	if (time >= _wait) exitWith {};
};
hintSilent "";