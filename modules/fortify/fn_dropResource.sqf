params ["_object"];

{
	{
		if (!(_foreachindex == 0)) then
		{
			if ((_x select 0) == typeOf _object) then
			{
				{
					_itemtype = (_x select 0);
					_counter = (_x select 1);
					if (player canAdd [_itemtype,_counter]) then {
						for "_i" from 1 to _counter do {
							player addItem _itemtype;
						};
					} else {
						_box = createVehicle ["groundweaponHolder", getPos player,[],0,""];
						_box setPos (getPos _object);
						_box addItemCargoGlobal [_itemtype,_counter];
					};
				}
				foreach (_x select 1);
			};
		};
	} foreach _x;
} foreach edn_fortification_array;

deleteVehicle _object;