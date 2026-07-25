
switch(estado){
	case "fechando":
		y2 = lerp(y2, y2max, velocidade);
		_y2 = lerp(_y2, _y2max, velocidade);
		
		if(y2 >= y2max - 10){
			y2 = y2max;
			estado = "abrindo";	
			if(global.session.active==false){
				obj_game_controller._start_session()
			}
			room_goto(room_destino);
		}
		
	break;
	
	case "abrindo":
		y2 = lerp(y2, _y2max, velocidade);
		_y2 = lerp(_y2, y2max, velocidade);
		
		if(y2 < 2){
			instance_destroy();	
		}
	break;
}