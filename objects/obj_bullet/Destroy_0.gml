if(current_material == material.wather){
	repeat(8){
		var _a = instance_create_depth(x+random_range(-10,10),y+8+random_range(0,5),depth,obj_particle);
		_a.image_speed = 0;
		_a.sprite_index = spr_whiteParticle;
		_a.image_index = 1;
		_a.image_xscale = .6;
		_a.image_yscale = .6;
		_a.speed = random_range(0.5,1.5)
		_a.image_blend = choose(c_white,make_color_rgb(0,157,255));
		_a.direction = random(360);
		_a.alarm[0] = 10
	}
}