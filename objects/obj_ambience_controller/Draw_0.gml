
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(1); // tweak if your sprite has semi-transparent pixels you want to keep

if(surface_exists(global.ambient_surface_light)){
	//Seta o target para  a surface que estamos usando
	surface_set_target(global.ambient_surface_light);

	draw_set_colour(c_black)
	draw_set_alpha(global.ambient_light_brightness)
	draw_rectangle(0,0, room_width,room_height,false);
	draw_set_alpha(1)
	draw_set_colour(c_white)
	//Reseta o draw para a surface padrão
	surface_reset_target();
	
	draw_surface(global.ambient_surface_light,0,0)
	
}else{
	show_debug_message("Since Surface Ambient Light does not exists, creating it!")
	//Caso não exista cria ela
	var _w = room_width
	var _h = room_height
	global.ambient_surface_light = surface_create(_w,_h); 
}

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_alphatestenable(false)
