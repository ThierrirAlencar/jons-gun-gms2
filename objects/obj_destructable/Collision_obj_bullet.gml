
if(breakeable == true){
	life -- 
}

if(other.current_material == material.fiire and flamable){
	repeat(irandom(3)){
		var _d = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),depth, obj_fixed_remain);
		_d.sprite_index = spr_tiny_fire;
		_d.image_angle = 0
		_d.alarm[0] = random_range(360,720)
		_d.image_blend  = c_white;
		_d.direction = random(360)
	}
	alarm[1] = 360
	flamable = false;
}