
if(other.current_alegiance == bullet_alegiance.player){
	image_xscale = 0.3;
	image_yscale = 1.2
	alarm[0] = 10;
	var _b =instance_create_depth(x+choose(-16,16),y+random_range(-16,16),depth-2,obj_damage_display_number)
	_b.damage = other.damage;
	_b.yspeed = random_range(0.5,1);
	_b.alarm[0] = 30
	
	//KnockBack 
	direction = other.direction
	speed = 0.5

}
