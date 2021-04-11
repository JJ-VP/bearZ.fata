//trader table
_mags = [
	"CUP_30Rnd_556x45_Stanag",
	"CUP_30Rnd_Sa58_M",
	"150Rnd_762x54_Box",
	"CUP_30Rnd_9x19AP_Vityaz",
	"CUP_30Rnd_556x45_Stanag_Mk16_black",
	"CUP_30Rnd_762x39_AK47_M",
	"CUP_30Rnd_762x39_AK103_bakelite_M"
];

_price = 20;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_string = (_mags select _i);
	lbAdd [_sidebar, _string];
	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};
