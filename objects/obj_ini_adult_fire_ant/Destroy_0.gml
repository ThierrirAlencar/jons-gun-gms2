// Inherit the parent event
event_inherited();

if(drop_weapon and current_gun){
	with(current_gun){
		instance_destroy()
	}
}
	

repeat(random_range(6,12)){
	var _a = instance_create_depth(x+random_range(-16,16),y+random_range(-8,8),10,obj_fixed_remain)
	_a.sprite_index = spr_fire_ant_gore
	_a.image_index = 0;
	_a.image_blend = c_white
	_a.image_speed = 0;
	_a.direction = random(360);
	_a.image_angle = _a.direction
}
repeat(irandom(5)){
var _d = instance_create_depth(x+random_range(-16,16),y+random_range(-8,8),9, obj_fixed_remain);
_d.sprite_index = spr_tiny_fire;
_d.image_angle = 0
_d.flamable = true
_d.image_blend  = c_white;
_d.alarm[0] = random_range(60,120)
_d.direction = random(360)
}