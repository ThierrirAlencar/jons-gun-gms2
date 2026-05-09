

image_xscale = lerp(image_xscale,1,0.1)
image_yscale = lerp(image_yscale,1,0.1)
if(is_down==false){
	draw_sprite_ext(spr_whiteParticle,1,x-3,y+16,2,1.5,image_angle,c_black,.3)
}

event_inherited();

draw_self()