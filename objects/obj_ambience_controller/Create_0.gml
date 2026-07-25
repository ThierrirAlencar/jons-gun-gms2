





if(global.session.stage>0){
	global.ambient_light_brightness = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.ambient_light_brightness; //Change dependending on map

	rain_height = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.rain_height;
	number_of_rain = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.number_of_rain;
	is_raining = global.permanent_stage_configurations[global.session.stage].wheater_stage_config.is_raining;
}else{
	global.ambient_light_brightness = .1;
	rain_height = 0;
	number_of_rain =0;
	is_raining = 0;
}
