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
			text = "BUY"; //--- ToDo: Localize;
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.594039 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class SellButton: RscButton
		{
			idc = 1601;

			text = "SELL"; //--- ToDo: Localize;
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
