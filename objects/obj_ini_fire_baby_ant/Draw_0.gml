//Draw Shadow
draw_sprite_ext(sprite_index,1,x,y+8,image_xscale,1,image_angle,c_black,.3)

if(melee_attacker and global.config_debug){
	draw_set_alpha(.5)
		draw_circle(x,y,melee_range,false);
	draw_set_alpha(1)
}
// Inherit the parent event
event_inherited();

