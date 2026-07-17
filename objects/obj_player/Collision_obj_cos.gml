if(is_dashing){
	repeat(6){
		var _a = instance_create_depth(x,y,depth,obj_particle);
		_a.image_speed = 0.2;
		_a.direction = other.direction+180
		_a.sprite_index = spr_whiteParticle;
		_a.image_xscale = .6;
		_a.image_yscale = .6;
		_a.image_alpha = .8; 
		_a.alarm[0] = 0
		
	}
	direction +=180;
	speed= spd*2
	alarm[2] = 14;
}else{
	direction = 0;
	speed = 0;
}