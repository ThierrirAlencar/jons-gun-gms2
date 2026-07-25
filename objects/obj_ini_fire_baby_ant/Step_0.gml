// Inherit the parent event
event_inherited();


if(global.game_active and !global.game_paused){
	
	function default_state_machine(){
	
		if(attack_timer > 0){
			attack_timer -= 1;
		}
	
		//Decide the state
		if(instance_exists(obj_player)){
			if(distance_to_object(obj_player) <= melee_range){
				current_state = states.attacking;
			}else if(distance_to_object(obj_player) <= seeking_range or has_seen_player or on_fire){
				current_state = states.moving_at_player;
				has_seen_player = true;
			}
		}else{
			current_state = states.idle;
		}
	
		switch(current_state){
		
			case states.idle:
				image_angle = 0;
				is_winding_up = false;
				attack_state_timer = 0;
				break;
			
			case states.moving_at_player:
				is_winding_up = false;
				attack_state_timer = 0;
			
				if(instance_exists(obj_player)){
					scr_animacaoDeBalanco(0.005, 10)
					mp_potential_step_object(obj_player.x,obj_player.y,spd,obj_cos)
				}
				break;
			
			case states.attacking:
			
				// Stay put and prep the swing instead of instantly damaging on contact
				if(attack_timer <= 0){
				
					if(!is_winding_up){
						is_winding_up = true;
						attack_state_timer = 0;
						//scr_animacaoDeBalanco(0.02, 20); // bigger/faster swing = telegraph the hit
					}
				
					attack_state_timer += 1;
				
					if(attack_state_timer >= attack_windup){
						// Windup finished -> confirm player is STILL in range, then deal damage
						if(instance_exists(obj_player) && distance_to_object(obj_player) <= melee_range){
						
							with(obj_player){
								if(can_be_hited==true){
									image_blend = c_red;
									image_xscale = 0.3;
									image_yscale = 1.2
									alarm[1] = 10
									can_be_hited = false	
								}	
							}		
							var _b =instance_create_depth(x+choose(-16,16),y+random_range(-16,16),depth-2,obj_damage_display_number)
							_b.damage = melee_damage;
							_b.yspeed = random_range(0.5,1);
							_b.alarm[0] = 30
						
							//knockback 
							obj_player.direction = direction
							obj_player.speed = 0.5
							obj_player.vida-=melee_damage
						}
					
						is_winding_up = false;
						attack_timer = attack_cooldown; // lock out further attacks until cooldown ends
					}
				}
				break;
		}
	}
	//Run Faster if loose life
	if(vida!=max_vida or on_fire){

		//Short speed boost
		spd = 1.5 
		
		on_fire = true;
	}
	default_state_machine()
}

