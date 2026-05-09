
//Get the grid side and stores it onto global list
function src_set_grid(){
	var _width = room_width;
	var _height = room_height;

	var CELL_SIZE = global.grid_size;

	var rows = floor(_height / CELL_SIZE);
	var cols = floor(_width / CELL_SIZE);

	var scale = 0.25;

	var _early_map = [];

	for(var _y = 0; _y < rows; _y++){

		_early_map[_y] = [];

		for(var _x = 0; _x < cols; _x++){

			var noise = scr_perlin_noise(_x , _y, 16);
			noise = (noise + 1) * 0.5;
			
			var tile_name;
			var tile_colour;
			var tile_type;
			var tile_index;
			
			if(noise < 0.3){
				tile_name = "water";
				tile_colour = c_blue;
				tile_type = world_generation_tiles.whater
				tile_index = 1
			}
			else if(noise < 0.4){
				tile_name = "sand";
				tile_colour = c_yellow;
				tile_type = world_generation_tiles.sand
				tile_index = 2
			}
			else if(noise < 0.8){
				tile_name = "grass";
				tile_colour = c_green;
				tile_type = world_generation_tiles.grass
				tile_index = 4
			}
			else{
				tile_name = "mountain";
				tile_colour = c_gray;
				tile_type = world_generation_tiles.mountain
				tile_index = 3
			}

			_early_map[_y][_x] = {
				height_noise: noise,
				tile_name: tile_name,
				tile_colour: tile_colour,
				tile_type:tile_type,
				tile_index:tile_index
			};

		}
	}

	return _early_map;
}

function scr_map_generation_processing(){
	
	global.world_gen_status = world_generation_status.deffining_grid
	global.world = src_set_grid()
	
	global.world_gen_status = world_generation_status.placing_tiles
	scr_place_tiles(global.world)
	
	if(global.config_debug){
		for(var _y=0;_y<array_length(global.world);_y++){
			for(var _x=0;_x<array_length(global.world[_y]);_x++){
					show_debug_message(global.world[_y][_x].tile_name)
				}
		}
	}
	global.world_gen_status = world_generation_status.finished
	global.world_generated = true
	
}