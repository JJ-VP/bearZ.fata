waituntil {!IsNull (findDisplay 46)};
(FindDisplay 46) displayAddEventHandler ["KeyDown","_this call keyPress"];

doAnimation = {
    _unit = _this select 0;
    _anim = _this select 1;
    _unit switchMove _anim;
};

keyPress = {
	private['_handled'];
	_handled = false;

	switch (_this select 1) do {
		case 11: //Holster weapon when player presses 0
		{
			player action ["SwitchWeapon",player,player,100];
			_handled = true;
		};
		case 57: //Jump when player presses space (if running)
		{
			if (speed player > 10.6 and speed player < 23.3) then {
				if  (player == vehicle player and isTouchingGround player) then  {

				_max_height = 4.3;// SET MAX JUMP HEIGHT
				_height = 6-((load player)*10);// REDUCE HEIGHT BASED ON WEIGHT
				_vel = velocity player;
				_dir = direction player;
				_speed = 0.4;
				if (_height > _max_height) then {_height = _max_height};// MAXIMUM HEIGHT OF JUMP 
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)+_height];
				
				[[player,"AovrPercMrunSrasWrflDf"],"doAnimation",nil,false] spawn BIS_fnc_MP; //BROADCAST ANIMATION
				};
			};
			_handled = true;
		};
		case 207: //toggle earplugs with END key
		{
    	    if (soundVolume <= 0.2) then { 0 fadeSound 1; }
			else { 0 fadeSound 0.2; };
			_handled = true;
		};
	};

	_handled;
};