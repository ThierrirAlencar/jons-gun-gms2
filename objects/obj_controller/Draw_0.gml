

depth = -999999999999
if(global.config_debug and global.game){
	move_snap(global.grid_size,global.grid_size)
	// Horizontal lines
	for(var _y = 0; _y < array_length(global.world); _y++){
		var yy = _y * global.grid_size;
		draw_line(0, yy, room_width, yy);
	}

	// Vertical lines
	for(var _x = 0; _x < array_length(global.world[0]); _x++){
		var xx = _x * global.grid_size;
		draw_line(xx, 0, xx, room_height);
	}
	
	var _predict_grid_cell_x = floor(x/global.grid_size)
	var _predict_grid_cell_y = floor(y/global.grid_size)
		
	draw_set_colour(c_green)
	draw_set_alpha(.5)
	draw_rectangle(x,y,x+global.grid_size,y+global.grid_size,false)
	draw_set_alpha(1)
	draw_set_colour(c_white)
	
	draw_text(x,y-8,string(global.world[_predict_grid_cell_y][_predict_grid_cell_x].tile_name))
	draw_text(x,y-16,string(global.world[_predict_grid_cell_y][_predict_grid_cell_x].height_noise))
}