
if(stage = last_stage){
	instance_create_depth(x,y,depth,obj_ini_fire_baby_ant)
}

// Inherit the parent event
event_inherited();

//Let reamins behind
repeat(random_range(3,6)){
	var _a = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),10,obj_fixed_remain)
	_a.sprite_index = spr_fire_ant_gore
	_a.image_index = 0;
	_a.image_blend = c_white
	_a.image_speed = 0;
	_a.direction = random(360);
	_a.image_angle = _a.direction
}

//let special remain behind
var _a = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),9,obj_fixed_remain)
_a.sprite_index = spr_fire_ant_eggs
_a.image_index = 2;
_a.image_blend = c_white
_a.image_speed = 0;
