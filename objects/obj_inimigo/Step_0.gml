
//feito no formato de função para que apenas aqueles que usarem os states sejam afetados
function default_state_machine(){
	if(current_gun == noone){
		current_state = states.gun_seeking; //Procurando uma arma se nao tiver nenhuma
	}else{
		current_state = states.idle
		if(instance_exists(obj_player)){
			current_state = states.moving_at_player
		}else{
			current_state = states.idle
		}
	}
	
	switch(current_state){
		case states.idle:
			 image_angle = 0; // Resetar ao parar
			break;
		case states.gun_seeking:
				if(instance_exists(obj_item)){
					var _nearest_item = instance_nearest(x,y,obj_item);
					if(_nearest_item.current_state == item_state.onground){
						mp_potential_step_object(_nearest_item.x,_nearest_item.y,spd,obj_cos)	
					}
				}
			break;
		case states.moving_at_player:{
				if(instance_exists(current_gun)){
					var _current_gun_data = global.item_data_list[current_gun.current_type]
					if(instance_exists(obj_player)){
						if(distance_to_object(obj_player)<=_current_gun_data.attack_range*2 and distance_to_object(obj_player)>_current_gun_data.attack_range){
							scr_animacaoDeBalanco(0.005, 10)
							mp_potential_step_object(obj_player.x,obj_player.y,spd,obj_cos)	
						}else{
							image_angle = lerp(image_angle,0,0.02);
						}
					}
				}else{
					current_gun = noone;
				}
		}
		
	}
}


if(vida<=0){
	instance_destroy()
}