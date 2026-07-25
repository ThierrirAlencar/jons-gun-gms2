
event_inherited(); //inheriths father definitions

// Wind shader setup
grass_shader = shd_grass_wind
u_time           = shader_get_uniform(grass_shader, "u_time")
u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
	
//Wind less potent cuz i guess so :)
		
grass_wind_speed    = 1.2
grass_wind_strength = 2.5
grass_wind_scale    = 0.02

can_hold_a_bullet = true;

repeat(random_range(6,10)){
	var _x = x+random_range(-16,16)
	var _y = y+random_range(-16,16)
	
	var _a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
	_a.image_speed = 0;
	_a.sprite_index = spr_leaf_remains;
	_a.image_index = 1
}