
if(room != room_menu){
	var _w = room_width
	var _h = room_height
	global.ambient_surface_light = surface_create(_w,_h); 

	//Each tick checks the Ambience wonce again providing changes to wheater
	alarm[0] = 500 + random(200)

	global.ambient_light_brightness = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.ambient_light_brightness; //Change dependending on map

	rain_height = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.rain_height;
	number_of_rain = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.number_of_rain;
	is_raining = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.is_raining;

}