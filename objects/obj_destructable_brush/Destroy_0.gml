// Inherit the parent event
event_inherited();

scr_brush_destruction_effect(random_range(3,6));


repeat(irandom_range(6,16)){
	var _x = x+irandom_range(-16,16);
	var _y = y+irandom_range(-6,6);
	
	var _a = instance_create_depth(_x,_y,depth-3,obj_particle);
	_a.direction = 90;
	_a.speed = random(3.0); //Specify as float
	_a.speedDecay = random_range(0.05,0.2);
	_a.minimun_barrier = -1;
	_a.image_angle = random(360);
	_a.angleDecay = random(2);
	_a.sprite_index = spr_leaf_particles;
	_a.image_index = random(_a.image_number-1);
	_a.image_speed = 0;
}