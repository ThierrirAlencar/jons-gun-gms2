function firethrower(target_x,traget_y){
		var _dmg = 3

		//Config da bala
		var _a = instance_create_depth(x+random_range(-4,4), y+random_range(-4,4), depth-1, obj_bullet);
		_a.direction = point_direction(x,y,target_x,traget_y)+random_range(-10,10)-flame_direction_changer //Inprecisão da arma
		_a.image_angle = random(360);
		_a.speed = 5;
		_a.image_speed = choose(.5,.6,.7) 
		_a.sprite_index = spr_fire_particle;
		_a.damage = _dmg;
		
		if(alarm[2]>0  and flame_direction_changer<0){
			flame_direction_changer+=2.5
		}
		
		if(traget_y>y){
			_a.direction_controled_variation = -1
		}else{
			_a.direction_controled_variation = 1
		}
		_a.image_index = 0;
		_a.speed_variation = random_range(0.04,0.05)*-1
		_a.current_material = material.fiire
		_a.ligth_radious = 32
		_a.current_alegiance = bullet_alegiance.enemy;
		_a.image_xscale = 1 * random_range(1,2.0)
		_a.image_yscale = 1 * random_range(1,2.0)			
		//Particula de tiro
		var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
		_b.sprite_index = spr_explosion_effect
		_b.image_speed = 1;
		_b.image_xscale = .5;
		_b.image_yscale = .5;
		_b.image_blend = c_white
}


if(global.game_active and !global.game_paused){
	
	function default_state_machine(){
		
		if(shoot_cooldown_timer > 0){
			shoot_cooldown_timer -= 1;
		}

		if(instance_exists(obj_player)){
			var _dist = distance_to_point(obj_player.x,obj_player.y)
			if(_dist<=seeking_range or has_seen_player){
				if(_dist <= atack_range){
					current_state = states.attacking;
				}else if(_dist <= seeking_range and alarm[2]<0){
					alarm[2] = 180
				}else {
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
							
					firethrower(obj_player.x, obj_player.y)
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
}