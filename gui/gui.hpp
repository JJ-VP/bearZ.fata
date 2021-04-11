class TraderMenu{
	idd = 420;
	enableMoving = false;
	onload = "[] spawn{call dvl_fnc_populateShop;}";
	class controls{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
		class SelectItemType: RscListbox
		{
			idc = 1500;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
		class selectActualItem: RscListbox
		{
			idc = 1501;
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 22 * GUI_GRID_H;
		};
		class BuyButton: RscButton
		{
			idc = 1600;
			text = "BUY"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class SellButton: RscButton
		{
			idc = 1601;
			text = "SELL"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
	};
};