function scr_brush_destruction_effect(_amount, wall_colour = c_green){
	
	var _debri_amount = _amount*2
	
	repeat (_debri_amount) {
		
		var _x = x+random_range(-16,16)
	    var _y = y+random_range(-16,16)
		var _a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
		_a.alpha_decay = 0.00001 //decay muito pequeno;
		_a.angle_variation = [-random(8),random(8)];
		_a.image_speed = 0;
		_a.flamable = true
	    _a.direction = irandom(360) // Direção variável para maior dispersão
		_a.speed = random_range(2,6);
		_a.sprite_index = spr_leaf_particles;
		_a.image_index = random(_a.image_number);
		_a.speed_decay = choose(0.1,0.2) //Variação de velocidade

	  
		_a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
		_a.image_speed = 0;
		_a.flamable = true
		_a.sprite_index = spr_leaf_remains
	}
}

function scr_puple_brush_destruction_effect(_amount, wall_colour = c_green){
	
	var _debri_amount = _amount*2
	
	repeat (_debri_amount) {
		
		var _x = x+random_range(-16,16)
	    var _y = y+random_range(-16,16)
		var _a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
		_a.alpha_decay = 0.00001 //decay muito pequeno;
		_a.angle_variation = [-random(8),random(8)];
		_a.image_speed = 0;
		_a.flamable = true
	    _a.direction = irandom(360) // Direção variável para maior dispersão
		_a.speed = random_range(2,6);
		_a.sprite_index = spr_wall_debris;
		_a.image_blend = c_purple
		_a.image_index = random(_a.image_number);
		_a.speed_decay = choose(0.1,0.2) //Variação de velocidade

	  
		_a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
		_a.image_speed = 0;
		_a.sprite_index = spr_leaf_remains;
		_a.image_index = 1
	}
}