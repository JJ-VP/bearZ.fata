class TraderMenu{
	idd = 420;
	enableMoving = false;
	onload = "[] spawn{call dvl_fnc_populateShop;}";
	class controls{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;

			x = 0.323679 * safezoneW + safezoneX;
			y = 0.264902 * safezoneH + safezoneY;
			w = 0.352643 * safezoneW;
			h = 0.470196 * safezoneH;
		};
		class SelectItemType: RscListBox
		{
			idc = 1500;

			x = 0.336903 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.282118 * safezoneH;
		};
		class selectActualItem: RscListBox
		{
			idc = 1501;

			x = 0.394207 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.233626 * safezoneW;
			h = 0.413773 * safezoneH;
		};
		class BuyButton: RscButton
		{
			idc = 1600;
			action = "[] spawn{call dvl_fnc_buyItem;}";
			text = "BUY";
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.594039 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class SellButton: RscButton
		{
			idc = 1601;

			text = "SELL";
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.659867 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class prices: RscListbox
		{
			idc = 1502;
			x = 0.627833 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.413773 * safezoneH;
		};
	};
};

class adminMenu 
{
	idd = -1;
	enablemoving = false;

	class controls
	{
		class guiBackground: IGUIBack
		{
			idc = 2200;
			x = 0.314328 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtMenu: RscText
		{
			idc = 1000;
			text = "BearZ Admin Menu";
			x = 0.314328 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.278507 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnClose: RscButton
		{
			idc = 1600;
			onMouseButtonClick = "closeDialog 2;";
			text = "X";
			x = 0.592836 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0103151 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0};
			tooltip = "Close the menu";
		};
		class lstPlayers: RscListBox
		{
			idc = 1500;
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class txtPlayers: RscText
		{
			idc = 1001;
			text = "Players";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979933 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstFeatures: RscListBox
		{
			idc = 1501;
			x = 0.427794 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class txtFeatures: RscText
		{
			idc = 1002;
			text = "Features";
			x = 0.427794 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnSelect: RscButton
		{
			idc = 1601;
			onMouseButtonClick = "[(lbCurSel 1500), (lbCurSel 1501)] call jjx_admin_exec;";
			text = "Execute";
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnVariables: RscButton
		{
			idc = 1604;
			text = "Variable Menu";
			x = 0.391692 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnSpawn: RscButton
		{
			idc = 1606;
			onMouseButtonClick = "closeDialog 2;call jjx_fnc_spawnMenu;";
			text = "Spawn Menu";
			x = 0.463897 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnDebug: RscButton
		{
			idc = 1605;
			onMouseButtonClick = "closeDialog 2;call jjx_fnc_debugMenu;";
			text = "Debug Menu";
			x = 0.530945 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class guiBackgroundRight: IGUIBack
		{
			idc = 2201;
		
			x = 0.613466 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtLoadouts: RscText
		{
			idc = 1005;
			text = "Loadouts";
			x = 0.613466 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstLoadouts: RscListBox
		{
			idc = 1502;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class edtLoadoutName: RscEdit
		{
			idc = 1400;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnLoad: RscButton
		{
			idc = 1602;
			onMouseButtonClick = "call jjx_loadout_load;";
			text = "Load";
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnSave: RscButton
		{
			idc = 1603;
			onMouseButtonClick = "call jjx_loadout_save;";
			text = "Save";
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnDelete: RscButton
		{
			idc = 1607;
			onMouseButtonClick = "call jjx_loadout_delete;";
			text = "Delete";
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class guiBackgroundEdit: IGUIBack
		{
			idc = 2201;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class debugMenu 
{
	idd = -10;
	enablemoving = false;

	class controls
	{
		class guiBackground: IGUIBack
		{
			idc = 2200;
		
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtDebugMenu: RscText
		{
			idc = 1000;
			text = "BearZ Debug Menu";
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.278507 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnClose: RscButton
		{
			idc = 1600;
			text = "X";
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0103151 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtPlayers: RscText
		{
			idc = 1001;
			text = "Players";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstPlayers: RscListbox
		{
			idc = 1500;
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class txtDebug: RscText
		{
			idc = 1002;
			text = "Debug Console";
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class guiBackgroundCode: IGUIBack
		{
			idc = 2201;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.253 * safezoneH;
			colorText[] = {0.133,0.133,0.133,1};
		};
		class edtCode: RscEdit
		{
			idc = 1400;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class btnLocal: RscButton
		{
			idc = 1601;
			onMouseButtonClick = "[(ctrlText 1400)] call jjx_debug_localExec;";
			text = "Local Execute";
			x = 0.572207 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "You execute this code";
		};
		class btnServer: RscButton
		{
			idc = 1602;
			onMouseButtonClick = "[(ctrlText 1400), 2] call jjx_debug_serverExec;";
			text = "Server Execute";
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Server execute this code";
		};
		class btnGlobal: RscButton
		{
			idc = 1603;
			onMouseButtonClick = "[(ctrlText 1400), 0] call jjx_debug_serverExec;";
			text = "Global Execute";
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "All players and server execute this code";
		};
		class btnRemote: RscButton
		{
			idc = 1604;
			onMouseButtonClick = "[(ctrlText 1400), (lbCurSel 1500)] call jjx_debug_remoteExec;";
			text = "Remote Execute";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Execute this code on the selected player";
		};
	};
};

class spawnMenu 
{
	idd = -20;
	enablemoving = false;

	class controls
	{
		class guiBag: IGUIBack
		{
			idc = 2200;
			x = 0.195705 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class guiVeh: IGUIBack
		{
			idc = 2201;
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class guiObj: IGUIBack
		{
			idc = 2202;
		
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class guiWep: IGUIBack
		{
			idc = 2203;
		
			x = 0.567048 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class guiMag: IGUIBack
		{
			idc = 2204;
		
			x = 0.690829 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class txtBag: RscText
		{
			idc = 1000;
			text = "Backpacks";
			x = 0.195705 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtVeh: RscText
		{
			idc = 1001;
			text = "Vehicles";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtObj: RscText
		{
			idc = 1002;
			text = "Objects";
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtWep: RscText
		{
			idc = 1003;
			text = "Weapons";
			x = 0.567048 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtMag: RscText
		{
			idc = 1004;
			text = "Magazines";
			x = 0.690829 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstBag: RscListbox
		{
			idc = 1510;
			x = 0.195705 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class lstVeh: RscListbox
		{
			idc = 1511;
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class lstObj: RscListbox
		{
			idc = 1512;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class lstWep: RscListbox
		{
			idc = 1513;
			x = 0.567048 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class lstMag: RscListbox
		{
			idc = 1514;
			x = 0.690829 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class btnBag: RscButton
		{
			idc = 1600;
			text = "Spawn";
			x = 0.221493 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnVeh: RscButton
		{
			idc = 1601;
			text = "Spawn";
			x = 0.345274 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnObj: RscButton
		{
			idc = 1602;
			text = "Spawn";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnWep: RscButton
		{
			idc = 1603;
			text = "Spawn";
			x = 0.592836 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnMag: RscButton
		{
			idc = 1604;
			text = "Spawn";
			x = 0.716617 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class edn_fortification_dialogMenu
{
	idd = -1;
	movingenable = false;

	class controls
	{
		class RscText000 : RscText
		{
			text = "Fortification menu";
			x = 0.25;
			y = 0.14;
			h = 0.1;
			w = 0.5;
			colorBackground[] = {1,0.5,0,1};
			SizeEx = "2 * 0.024";
			style = ST_CENTER;
		};
		class GUIBack000 : IGUIBack
		{    
			x = 0.25; 
			y = 0.25;
			h = 0.5;
			w = 0.5;
			colorBackground[] = {0,0,0,0.75};
		};
		class RscButton000 : RscButton
		{
			text = "construction menu";
			x = 0.27; 
			y = 0.29;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "closeDialog 0; [player] call edn_fnc_openconstructionmenu;";
		};
		class RscButton001 : RscButton
		{
			idc = 1500;
			text = "build from chest";
			x = 0.52; 
			y = 0.29;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "closeDialog 0; [cursorTarget] call edn_fnc_openconstructionmenu";
		};
		class RscButton002 : RscButton
		{
			idc = 1501;
			text = "move object";
			x = 0.27; 
			y = 0.45;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "[cursorTarget] call edn_fnc_moveObject; closeDialog 0;";
		};
		class RscButton003 : RscButton
		{
			idc = 1502;
			text = "remove object";
			x = 0.52; 
			y = 0.45;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "[cursorTarget] call edn_fnc_removeObject; closeDialog 0;";
		};
		class RscButton004 : RscButton
		{
			idc = 1503;
			text = "align to ground";
			x = 0.27; 
			y = 0.61;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "[] call edn_fnc_alignObject; closeDialog 0;";
		};
		class RscButton005 : RscButton
		{
			text = "cancel";
			x = 0.52; 
			y = 0.61;
			h = 0.10;
			w = 0.21;
			style = ST_CENTER;
			action = "closeDialog 0;";
		};
	};
};

class edn_fortification_dialogConstructionMenu
{
	idd = -1;
	movingenable = false;
	enableSimulation = 1;
	
	onLoad = "uiNamespace setVariable ['edn_fortification_display',_this select 0];";
	
	class Objects
	{
		class Object
		{
			idc = 1503; 
			type = 82;
			model = "A3\Structures_F\Mil\BagFence\BagFence_Long_F.p3d";
			scale = 1;
			
			direction[] = {0, 0, 1};
			up[] = {0, 1, 1};
 
			x = 0.5;
			y = 0.5;
			z = 4.5;
 
			xBack = 0.825;
			yBack = 0.5;
			zBack = 1.2;
 
			inBack = 0;
			enableZoom = 1;
			zoomDuration = 0.001;
		};
	};
	class controls
	{
		class GUIBack001 : IGUIBack
		{    
			x = safeZoneX + 0.01 * 3 / 4; 
			y = safeZoneY + 0.12;
			h = safeZoneH - 0.13;
			w = 0.75 * 3 / 4;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class RscText000 : RscText
		{
			text = "Construction menu";
			x = safeZoneX + 0.01 * 3 / 4; 
			y = safeZoneY + 0.01;
			h = 0.1;
			w = 0.75 * 3 / 4;
			colorBackground[] = {1,0.5,0,1};
			SizeEx = "2 * 0.024";
			style = ST_CENTER;
		};
		
		class RscButton000 : RscButton
		{
			text = "cancel";
			x = safeZoneX + 0.035 * 3 / 4; 
			y = safeZoneY + safeZoneH - 0.12;
			h = 0.075;
			w = 0.3 * 3 / 4;
			style = ST_CENTER;
			action = "closeDialog 0";
		};
		class RscButton001 : RscButton
		{
			text = "build";
			x = safeZoneX + 0.425 * 3 / 4; 
			y = safeZoneY + safeZoneH - 0.12;
			h = 0.075;
			w = 0.3 * 3 / 4;
			style = ST_CENTER;
			action = "[] call edn_fnc_buildObject; closeDialog 0;";
		};
		
		class RscText002 : RscText
		{
			text = "Categorie:";
			x = safeZoneX + 0.02 * 3 / 4; 
			y = safeZoneY + 0.15;
			h = 0.04;
			w = 0.13 * 3 / 4;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			style = ST_LEFT;
		};
		
		class RscCombo000 : RscCombo
		{
			idc = 1500;
			x = safeZoneX + 0.15 * 3 / 4; 
			y = safeZoneY + 0.15;
			h = 0.04;
			w = 0.56 * 3 / 4;
			colorBackground[] = {0.1,0.1,0.1,1};
			
			onLBSelChanged = "[_this select 1,'Categorie'] call edn_fnc_updateConstructionMenu;";
		};
		class RscListBox000 : RscListBox
		{
			idc = 1501;
			x = safeZoneX + 0.04 * 3 / 4; 
			y = safeZoneY + 0.22;
			h = safeZoneH - 0.40;
			w = 0.68 * 3 / 4;
			colorBackground[] = {0,0,0,1};
			
			onLBSelChanged = "[_this select 1,'Classname'] call edn_fnc_updateConstructionMenu;";
			onLBDblClick = "[] call edn_fnc_buildObject; closeDialog 0;";
		};
		
		class GUIBack000 : RscListBox
		{    
			x = safeZoneX + 0.76 * 3 / 4; 
			y = safeZoneY;
			h = safeZoneH;
			w = safeZoneW - 0.76 * 3 / 4;
			colorBackground[] = {0,0,0,0};
		};
	};
	class controlsBackground
	{
		class GUIBack000 : IGUIBack
		{    
			x = safeZoneX; 
			y = safeZoneY;
			h = safeZoneH;
			w = safeZoneW;
			colorBackground[] = {0.5,0.5,0.5,1};
		};
	};
};
