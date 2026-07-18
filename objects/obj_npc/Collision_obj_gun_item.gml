
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
	
	//knockback 
	direction = other.image_angle
	speed = 0.5
}