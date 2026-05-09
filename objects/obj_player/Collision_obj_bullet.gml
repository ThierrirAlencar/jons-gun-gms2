if(other.current_alegiance == bullet_alegiance.enemy){
	if(can_be_hited==true){
		vida -= other.damage
		image_blend = c_red;
		image_xscale = 0.3;
		image_yscale = 1.2
		alarm[1] = 10
		can_be_hited = false

		var _b =instance_create_depth(x+choose(-16,16),y+random_range(-16,16),depth-2,obj_damage_display_number)
		_b.damage = other.damage;
		_b.yspeed = random_range(0.5,1);
		_b.alarm[0] = 30
	
		//knockback 
		direction = other.direction
		speed = 0.5
	}	
		
}