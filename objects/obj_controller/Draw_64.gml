if(
	global.config_debug and 
	global.game and 
	surface_exists(global.map_surface) and 
	global.world_gen_status == world_generation_status.finished
	){
		draw_surface(global.map_surface,0,global.screen_height_size)
}



