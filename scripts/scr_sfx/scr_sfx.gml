function scr_sfx(){

}

function scr_sfx_play(audio_track, volume=0.5, pitch=1, pitch_variation=[0,0], priority=3, loop=false){
	
	var _global_volume = variable_global_exists("config_sfx_volume") ? global.config_sfx_volume : 1;
	var _final_volume = volume * _global_volume;
	
	var _final_pitch = pitch;
	
	if(pitch_variation[0] != 0){
		_final_pitch = random_range(pitch_variation[0], pitch_variation[1]);
	}
	
	var _inst = audio_play_sound(audio_track, priority, loop, _final_volume, 0, _final_pitch);
	
	return _inst; // retorna o audio_id, útil pra pausar/parar/ajustar esse som específico depois
}