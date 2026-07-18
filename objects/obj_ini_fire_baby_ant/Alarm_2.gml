//If its on fire is gonna do this shit
if(on_fire){
	repeat(irandom(3)){
		var _d = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),depth, obj_fire_remain);
		_d.sprite_index = spr_tiny_fire;
		_d.image_angle = 0
		_d.alarm[0] = random_range(360,720)
		_d.image_blend  = c_white;
		_d.direction = random(360)
	}
	
	var a = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),depth+20,obj_particle)
	a.sprite_index = spr_explosion_effect;
	a.image_alpha = .5;
	a.image_blend = choose( c_orange, c_yellow, c_red)
	a.direction = 90;
	a.speed = 1.5;
	a.image_speed = 0;
	a.image_index = 0;
	a.image_xscale = .4;
	a.image_yscale = .4;
	a.speedDecay = 0.1
	a.directionDecay = irandom_range(-3,3)
}


alarm[2] = fire_spawn_rate;