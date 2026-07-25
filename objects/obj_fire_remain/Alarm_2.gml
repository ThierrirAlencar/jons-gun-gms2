
var _p = instance_create_depth(x+random_range(-6,6),y+random_range(-6,6),depth,obj_particle);
_p.direction = 90 +random_range(-16,16);
_p.speed = random_range(1,3);
_p.speedDecay = -0.1
_p.sprite_index = spr_fire_unit;
_p.image_speed = 1;
_p.image_xscale = 1;
_p.image_yscale = 1;

alarm[2] = irandom_range(5,10)