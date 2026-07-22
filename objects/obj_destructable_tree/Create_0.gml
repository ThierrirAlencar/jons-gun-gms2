
event_inherited(); //inheriths father definitions

// Wind shader setup
grass_shader = shd_grass_wind
u_time           = shader_get_uniform(grass_shader, "u_time")
u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
	
//Wind less potent cuz i guess so :)
grass_wind_speed    = 1.2
grass_wind_strength = 2.3
grass_wind_scale    = 0.02

can_hold_a_bullet = false;

//Really huge life
life = 99