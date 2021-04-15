[] spawn {
	_adjustLight = {
		BearZ_adjustBrightness = BearZ_adjustBrightness max 0 min 1;
		_brightness = if (BearZ_adjustBrightness > 0) then {200 * abs (1 - (2 ^ BearZ_adjustBrightness))} else {0};
		BearZ_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
		BearZ_light setLightAmbient BearZ_adjustColor;
	};
	
	waitUntil {time > 0};
	if (missionNamespace getVariable ["BearZ_running",false]) exitWith {systemChat "BearZ script is running. Addon disabled."};
	BearZ_running = true;
	
	BearZ_adjustBrightness = missionNamespace getVariable ["BearZ_adjustBrightness",0.13];
	BearZ_adjustColor = missionNamespace getVariable ["BearZ_adjustColor",[1,1,1]];

	if (!isNil "BearZ_light") then {deleteVehicle BearZ_light};
	BearZ_light = "#lightpoint" createVehicleLocal [0,0,0];
	BearZ_light setLightBrightness 1;
	BearZ_light setLightDayLight false;
	call _adjustLight;

	for "_i" from 0 to 1 step 0 do {
		_adjustBrightness = BearZ_adjustBrightness;
		_adjustColor = BearZ_adjustColor;
		waitUntil {!(_adjustBrightness isEqualTo BearZ_adjustBrightness) || !(_adjustColor isEqualTo BearZ_adjustColor)};
		call _adjustLight;
	};
};
