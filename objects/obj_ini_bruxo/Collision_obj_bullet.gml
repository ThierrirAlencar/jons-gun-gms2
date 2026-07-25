// Inherit the parent event
event_inherited();

if(other.current_alegiance == bullet_alegiance.player){
	repeat(irandom_range(3,6)){
		var _a = instance_create_depth(x+random_range(-8,8),y+random_range(-8,8),10,obj_fixed_remain)
		_a.speed = random_range(.1, 2.5)
		_a.image_index = random(_a.image_number-1)
		_a.image_speed = 0;
		_a.direction = random(360);
		_a.image_angle = _a.direction
		_a.speed_decay = random_range(0.05, 0.09)
		_a.alpha_decay = 0 // 0 = infinite 
		_a.angle_variation = [-1,1] //Two random values
	}
}