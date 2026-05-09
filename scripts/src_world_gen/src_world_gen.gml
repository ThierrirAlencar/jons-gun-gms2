
//Get the grid side and stores it onto global list

function src_get_biome(_elevation, _temperature, _moisture){

	// Ocean
	if(_elevation < 0.35){
		return {
			tile_index:1,
			name: "water",
			colour: c_blue
		};
	}

	// Beach
	if(_elevation < 0.4){
		return {
			tile_index:3,
			name: "sand",
			colour: c_yellow
		};
	}

	// Mountains
	if(_elevation > 0.8){

		if(_temperature < 0.4){
			return {
				tile_index:4,
				name: "snow_mountain",
				colour: c_white
			};
		}

		return {
			tile_index:4,
			name: "mountain",
			colour: c_gray
		};
	}

	// Hot areas
	if(_temperature > 0.7){

		if(_moisture < 0.3){
			return {
				tile_index:3,
				name: "desert",
				colour: make_color_rgb(220, 190, 120)
			};
		}

		return {
			tile_index:4,
			name: "jungle",
			colour: make_color_rgb(20, 120, 20)
		};
	}

	// Cold areas
	if(_temperature < 0.3){

		return {
			tile_index:4,
			name: "taiga",
			colour: make_color_rgb(50, 120, 80)
		};
	}

	// Dry areas
	if(_moisture < 0.3){

		return {
			tile_index:4,
			name: "plains",
			colour: make_color_rgb(140, 180, 80)
		};
	}

	// Default
	return {
		tile_index:4,
		name: "forest",
		colour: c_green
	};

}

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
			
			var elevation = src_fractal_noise(_x, _y);
			var moisture = src_fractal_noise(_x + 1000, _y + 1000);
			var temperature = src_fractal_noise(_x - 1000, _y - 1000);
			
			elevation = (elevation + 1) * 0.5;
			moisture = (moisture + 1) * 0.5;
			temperature = (temperature + 1) * 0.5;

			var biome = src_get_biome(
				elevation,
				temperature,
				moisture
			);

			_early_map[_y][_x] = {
				height_noise: elevation,
				temperature: temperature,
				moisture: moisture,
				tile_index:biome.tile_index,
				tile_name: biome.name,
				tile_colour: biome.colour
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
	
	//create surface with map
	scr_generate_map_surface();
	
	global.world_gen_status = world_generation_status.finished
	global.world_generated = true
	
}