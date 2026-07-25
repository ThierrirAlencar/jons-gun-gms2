
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(1); // tweak if your sprite has semi-transparent pixels you want to keep

//draw shadow of itself
draw_sprite_ext(sprite_index,1,x,y+16,image_xscale,.5,image_angle,c_black,.3)
	
draw_set_alpha(image_alpha)
shader_set(grass_shader);
	shader_set_uniform_f(u_time, current_time / 1000);
	shader_set_uniform_f(u_windSpeed, grass_wind_speed);
	shader_set_uniform_f(u_windStrength, grass_wind_strength);
	shader_set_uniform_f(u_windScale, grass_wind_scale);
	draw_sprite(spr_tree_head,image_index,x,y)
shader_reset();

draw_set_alpha(1);

draw_sprite(spr_tree_base,image_index,x,y)

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_alphatestenable(false)
