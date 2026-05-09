function scr_define_tile(){
	var _noise = argument0
	var _tile = {}
	if(_noise < 0.3){
		_tile = {
			height:0,
			temperature:0.1,
			tile_name:"whater",
			tile_index:1,
			tile_colour:c_blue
		}
	}
	else if(_noise < 0.45){
		_tile ={
				height:0.50,
				temperature:1.2,
				tile_name:"sand",
				tile_index:2,
				tile_colour:c_yellow
			}
	}
	else if(_noise < 0.75){
		_tile = {
				height:0.75,
				temperature:0.5,
				tile_name:"grass",
				tile_index:0,
				tile_colour:c_green
			}
	}
	else{
		tile = {
				height:5,
				temperature:0.2,
				tile_name:"mountain",
				tile_index:3,
				tile_colour:c_gray
			}
	}
}

function scr_place_tiles(){
	var _map = argument0
	
	//create a new layer so we can use
	global.ground_layer = layer_create(-1)
	global.ground_tilemap_layer = layer_tilemap_create(global.ground_layer,0,0,tl_debug_use_tile, room_width, room_height)
	
	var rows = array_length(_map)
	
	for(var _y = 0; _y < rows; _y++){
		var cols = array_length(_map[_y])
		for(var _x = 0; _x < cols; _x++){
			var xx = _x*global.grid_size;
			var yy = _y*global.grid_size
			var _kind = _map[_y][_x].tile_index;
			
			
			tilemap_set(global.ground_tilemap_layer,_kind,_x,_y)
		}
	}
}