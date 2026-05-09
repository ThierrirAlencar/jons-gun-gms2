
repeat(random_range(3,6)) {
     var _a = instance_create_depth(x + random_range(-16,16), y + 8, depth, obj_particle);
	_a.image_speed = 0.3;
		var _range =  random(360);
     _a.direction = _range
	 _a.image_angle = _range
     _a.speed = random_range(0.2,3);
     _a.sprite_index = spr_whiteParticle;
     _a.image_xscale = random_range(1.0,1.3);
	 _a.image_blend = choose(c_aqua,c_blue,c_white)
      _a.image_yscale = random_range(0.1,0.5);
      _a.image_alpha = 1; 
	_a.alarm[0] = random_range(10,20);
}

var _b =instance_create_depth(x+choose(-16,16),y+random_range(-16,16),depth-2,obj_posittive_display_number)
_b.outcome = 1;
_b.signal = "+"
_b.text_colour = c_aqua
_b.image_xscale = .5
_b.image_yscale = .5 
_b.yspeed = random_range(0.5,1);
_b.alarm[0] = 30

instance_destroy()
