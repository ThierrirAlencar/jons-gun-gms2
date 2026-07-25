

if(global.game_active and !global.game_paused){
	
	function default_state_machine(){
		
		if(instance_exists(obj_player)){
			var _dist = distance_to_point(obj_player.x,obj_player.y)
			if(_dist<=seeking_range or has_seen_player){
				if(_dist <= atack_range){
					current_state = states.attacking;
				}else if(_dist <= seeking_range and alarm[2]<0){
					alarm[2] = 180
				}else if(alarm[2]<0){
					current_state = states.moving_at_player
				}
			}
		}else{
			current_state = states.idle;
		}

		switch(current_state){
			
			case states.idle:
				image_angle = 0;
				break;
				
			case states.gun_seeking: //Will never reach that point
				break;
				
			case states.moving_at_player:
				if(instance_exists(obj_player)){
						//scr_animacaoDeBalanco(0.005, 10)
						mp_potential_step_object(obj_player.x,obj_player.y,spd,obj_cos)
				}
				break;
				
			case states.attacking:
				if(instance_exists(obj_player)){
							
					//firethrower(obj_player.x, obj_player.y)
					/*
					// Face the player so firethrower's aim direction is correct
					current_gun.image_angle = point_direction(current_gun.x, current_gun.y, obj_player.x, obj_player.y);
					
					var _trigger = (shoot_cooldown_timer <= 0);
					
					with(current_gun){
						firethrower(obj_player.x, obj_player.y, _trigger);
					}
					
					if(_trigger){
						shoot_cooldown_timer = global.gun_data_list[current_gun.current_type].cooldown;
					}
					*/
				}else{
					current_gun = noone;
				}
				break;
		}
	}
	
	default_state_machine()
	
	if(vida<=0){
		instance_destroy()
	}
	
	depth = -y;

	//Habilita o uso da maquina de estados padrão
	default_state_machine()
	if(instance_exists(obj_player)){
		image_xscale = floor(-obj_player.image_xscale)
	}
	if(current_state = states.idle and sprite_index != spr_piromancer_idle){
		sprite_index = spr_piromancer_idle
		image_speed = 1
	}else if(sprite_index!=spr_piromancer_walk){
		image_speed = 1
		sprite_index = spr_piromancer_walk
		
	}

}


