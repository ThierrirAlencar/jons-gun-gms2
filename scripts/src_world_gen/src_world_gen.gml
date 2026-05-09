
//Get the grid side and stores it onto global lists

function src_noise(){
	var _x = argument0
	var _y = argument1
	
	random_set_seed((_x * 928371 + _y * 12377));

	return random(1);
}

function src_set_grid(){

	var _width = room_width;
	var _height = room_height;

	var CELL_SIZE = global.grid_size;

	var rows = floor(_height / CELL_SIZE);
	var cols = floor(_width / CELL_SIZE);

	var scale = 0.08;

	var _early_map = [];

	for(var _y = 0; _y < rows; _y++){

		_early_map[_y] = [];

		for(var _x = 0; _x < cols; _x++){

			var noise = src_noise(_x * scale, _y * scale);

			var tile_name;
			var tile_colour;

			if(noise < 0.3){
				tile_name = "water";
				tile_colour = c_blue;
			}
			else if(noise < 0.4){
				tile_name = "sand";
				tile_colour = c_yellow;
			}
			else if(noise < 0.8){
				tile_name = "grass";
				tile_colour = c_green;
			}
			else{
				tile_name = "mountain";
				tile_colour = c_gray;
			}

			_early_map[_y][_x] = {
				height_noise: noise,
				tile_name: tile_name,
				tile_colour: tile_colour
			};

		}
	}

	return _early_map;
}

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

