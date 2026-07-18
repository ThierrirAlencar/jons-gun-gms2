
if(other.is_meelee and can_be_hited and other.current_state == item_state.onhand){
	vida -= other.dmg
	image_blend = c_red;
	image_xscale = 0.3;
	image_yscale = 1.2
	alarm[0] = 20 //Duas vezes maior que o de munição
	can_be_hited = false
	
	var _b =instance_create_depth(x+choose(-16,16),y+random_range(-16,16),depth-2,obj_damage_display_number)
	_b.damage = other.dmg;
	_b.yspeed = random_range(0.5,1);
	_b.alarm[0] = 30
	
	//Effeitos do dano meelee
	var _c = other
	repeat(random_range(2,6)){
		var _ee = instance_create_depth(x, y, depth-2, obj_particle);
		_ee.sprite_index = spr_explosion_effect
		_ee.image_xscale = .3;
		_ee.image_speed = 0;
		_ee.direction =  point_direction(x,y,_c.x,_c.y)+180+random_range(-16,16);
		_ee.image_angle = _ee.direction
		_ee.speed = random_range(2,4);
		_ee.speedDecay = random_range(0.08,0.1);
		_ee.image_yscale = .1;
		_ee.image_blend = c_white
	}

	//knockback 
	direction = other.image_angle
	speed = 0.5
}

