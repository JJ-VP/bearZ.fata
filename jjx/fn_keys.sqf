/*
 * fn_keys.sqf
 * Author: JJ
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This function adds keybind event handlers
 */

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
	_zeusKey = (actionKeys "curatorInterface") select 0;

	switch (_this select 1) do {
		case 59: //Open admin menu
		{
			_isAdmin = player call jjx_fnc_isAdmin;

			if (_isAdmin) then {
				call jjx_fnc_openMenu;
			};
		};
		case 11: //Holster weapon when player presses 0
		{
			player action ["SwitchWeapon",player,player,100];
			_handled = true;
		};
		case 25: //Remove the shift+P DLC window
		{
			if (_this select 2) then {
				_handled = true;
			};
		};
		case 57: //Jump when player presses space (if running)
		{
			if (speed player > 12 and speed player < 23.3) then {
				if  (player == vehicle player and isTouchingGround player) then  {

				_max_height = 4.3;// SET MAX JUMP HEIGHT
				_height = 6-((load player)*10);// REDUCE HEIGHT BASED ON WEIGHT
				_vel = velocity player;
				_dir = direction player;
				_speed = 0.4;
				if (_height > _max_height) then {_height = _max_height};// MAXIMUM HEIGHT OF JUMP 
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)+_height];
				
				[[player,"AovrPercMrunSrasWrflDf"],"doAnimation",nil,false] spawn BIS_fnc_MP; //BROADCAST ANIMATION
				_handled = true;
				};
			};
		};
		case 207: //loop through earplugs with END key
		{
    	    if (soundVolume == 1) then {
    	    	0 fadeSound 0.75;
    		} else {
    			if (soundVolume == 0.75) then {
    				0 fadeSound 0.5;
    			} else {
    				if (soundVolume == 0.5) then {
    					0 fadeSound 0.25;
    				} else {
    					0 fadeSound 1;
    				};
    			};
    		};
			_handled = true;
		};
		case _zeusKey: //Disable zeus pings
		{
			if (getPlayerUID player in jjx_zeus) then {
				openCuratorInterface;
			};
			_handled = true;
		}
	};

	_handled;
};