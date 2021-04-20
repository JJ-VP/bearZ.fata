jjx_unflip_check = {
	params ["_vehicle"];

	if (player distance _vehicle < 8 && ((vectorUp _vehicle select 0 >= 0.9) || (vectorUp _vehicle select 0 <= -0.9) || (vectorUp _vehicle select 1 >= 0.9) || (vectorUp _vehicle select 1 <= -0.9) || (vectorUp _vehicle select 2 < 0))) then {
		true;
	} else {
		false;
	};
};

jjx_unflip_exec_check = {
	[cursorTarget] call jjx_unflip_check;
};

jjx_unflip_exec = {
	_vehicle = cursorTarget;
	_normalVec = surfaceNormal getPos _vehicle;
	[_vehicle, _normalVec] spawn {
		params ["_vehicle", "_normalVec"];
		hint "Unflipping in 3 seconds!\nPlease move back!";
		sleep 3;
		if (!local _vehicle) then {
			[_vehicle, _normalVec] remoteExec ["setVectorUp", _vehicle];
		} else {
			_vehicle setVectorUp _normalVec;
		};
		_vehicle setPosATL [getPosATL _vehicle select 0, getPosATL _vehicle select 1, 0];
		hintSilent "";
	};
};

jjx_unflip_Action = {

	player addAction ["Unflip", { 
		[] call jjx_unflip_exec;
	}, nil, 0, false, true, "", "call jjx_unflip_exec_check"];

	player addEventHandler ["Respawn", {
		player setVariable ["unflip_Loaded",false];
	}];

};
