class CfgSecondaryWeapons
{
	//Mod Settings
	DropWeaponOnDeath = "true";
	UseAddActions = "false";
	UseInventoryButtons = "true";
	
	SecondaryWeaponsBlockedWeapons[] = 
	{
		"cup_arifle_mega_sniper",
		"cup_arifle_big_sniper"
	};
	
	//OVERRIDES
	/*
		Example: 
		FileName = "path\to\override.sqf";
		This will override the file I created with your edits. Useful for MP gamemodes and missions if you need to tweak files.
		SecondaryWeapons_player_hook = "custom\dual_arms\SecondaryWeapons_player_hook.sqf"; is an example if you need to override the hook file.
		Any files can be overridden with this method!
	*/
	SecondaryWeapons_player_hook = "modules\dual_arms\SecondaryWeapons_player_hook.sqf";
	
};