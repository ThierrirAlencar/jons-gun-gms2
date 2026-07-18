
//destruction explosion
var _b = instance_create_depth(x, y, depth-2, obj_particle);
_b.sprite_index = spr_explosion_effect
_b.image_xscale = 1;
_b.image_speed = .5
_b.alarm[0] = 20
_b.image_angle = image_angle+180
_b.image_yscale = 1;
_b.image_blend = c_white