
var _b = instance_create_depth(x, y, depth-2, obj_particle);
_b.sprite_index = spr_explosion_effect
_b.image_xscale = 1;
_b.image_speed = .25
_b.alarm[0] = 20
_b.image_angle = image_angle+180
_b.image_yscale = 1;
_b.image_blend = c_white



//Flashs que saem do inimigo morto na direção oposta para demonstrar impacto
repeat(random_range(9,15)){
	_b = instance_create_depth(x, y, depth-2, obj_particle);
	_b.sprite_index = spr_explosion_effect
	_b.image_xscale = .3;
	_b.image_speed = 0;
	_b.direction = point_direction(x,y,obj_player.x,obj_player.y)+180+random_range(-32,32);
	_b.image_angle = _b.direction
	_b.speed = random_range(2,4);
	_b.speedDecay = random_range(0.08,0.1);
	_b.image_yscale = .1;
	_b.image_blend = c_white
}

 repeat(random_range(3,6)) {
     var _a = instance_create_depth(x + random_range(-16,16), y + 8, depth, obj_particle);
	_a.image_speed = 0.3;
     _a.direction = random(360);
     _a.speed = 1;
     _a.sprite_index = spr_whiteParticle;
     _a.image_xscale = .8;
      _a.image_yscale = .8;
      _a.image_alpha = 1; 
      _a.alarm[0] = 10;
 }

var _c = instance_create_depth(x,y,depth+16, obj_fixed_remain);
_c.sprite_index = sprite_index;
_c.image_angle = choose(90,180)+random_range(-16,16);
_c.image_blend  = c_gray;
_c.speed_decay = 0.1;
_c.angle_variation = [-1,1]
_c.direction = random(360)
_c.speed = random_range(3,5);
_c.alpha_decay = 0.0005;
_c.image_alpha = .9
_c.image_speed = 0;



repeat(3){
	var _orb = instance_create_depth(x,y,depth,obj_xp_orb)
	_orb.image_angle = random(360)
}

