var _bg_01 = layer_get_id("Backgrounds_1");
var _bg_02 = layer_get_id("Backgrounds_2");
var _bg_03 = layer_get_id("Backgrounds_3");


var _bg_01_b = layer_background_get_id(_bg_01)
var _bg_02_b = layer_background_get_id(_bg_02)
var _bg_03_b = layer_background_get_id(_bg_03)

var _options = [
	{
		v1:spr_night_clouds_1,
		v2:spr_night_clouds_3,
		v3:spr_night_clouds_2
	},
	{
		v1:spr_summer_clouds_1,
		v2:spr_summer_clouds_3,
		v3:spr_summer_clouds_2
	}
]


var _bg_sprites = _options[irandom(array_length(_options)-1)]

layer_background_sprite(_bg_01_b, _bg_sprites.v1)
layer_background_sprite(_bg_02_b, _bg_sprites.v2)
layer_background_sprite(_bg_03_b, _bg_sprites.v3)
