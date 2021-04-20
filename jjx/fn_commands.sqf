/*
 * fn_commands.sqf
 * Author: JJ
 *
 * Args:
 * 0: Command to execute <STRING>
 *
 * Return Value:
 * nil (No return)
 *
 * This file is called whenever a custom chat command is used
 */

params ["_command"];

switch (_command) do {
	case "help":
	{
		systemChat "";
		systemChat "";
		systemChat " - BearZ Commands - ";
		systemChat "";
		systemChat "#help - Show a list of all commands. <- You are here";
		systemChat "#Menu - Open the player menu.";

		_adminState = call BIS_fnc_admin;
		_uid = getPlayerUID player;
		if ((_adminState isEqualTo 2) || (_uid in jjx_admin)) then {
			systemChat "";
			systemChat " - Admin Commands - ";
			systemChat "";
			systemChat "#saveMission - Save the current state of the mission.";
			systemChat "#loadMission - Load the last saved state of the mission.";
			systemChat "#loadAllPlayers - Loads all players data that are currently on the server.";
			systemChat "#loadPlayer <UID>/<NAME> - Loads the inputted players data.";
		};
	};

	case "menu" do {
		systemChat "Player menu not yet implemented!";
	};
};