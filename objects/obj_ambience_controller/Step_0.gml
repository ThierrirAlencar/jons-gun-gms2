depth = -9999
var _w = room_width
var _h = room_height

var _layer = layer_get_id("layer_ambience_active");
if(!_layer){_layer = layer_create(-10,"layer_ambience_active")}


if(global.game and is_raining){
	
	edge = 200
	
	var _cam = view_camera[0]; // the camera bound to view index 0
	var _cam_x = camera_get_view_x(_cam);
	var _cam_y = camera_get_view_y(_cam);
	var _cam_w = camera_get_view_width(_cam);
	var _cam_h = camera_get_view_height(_cam);

	repeat(number_of_rain) // number of drops to make each step
	{
	    var _rx = _cam_x - edge + random(_cam_w + edge*2);
	    var _ry = _cam_y - edge + random(_cam_h + edge*2);
	    instance_create_layer(_rx, _ry, _layer, obj_rain);
	}
}

/*
var _layer = layer_get_id("layer_ambience_core");
if(!_layer){_layer = layer_create(-10,"layer_ambience_core")}
effect_create_layer(_layer,ef_rain,x,y,_w,c_white)