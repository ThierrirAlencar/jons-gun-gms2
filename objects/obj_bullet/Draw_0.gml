if(properties.draw_halo){
	var _scale_x  = image_xscale*1.5; 
	draw_sprite_ext(spr_bullet,0,x,y,_scale_x,1,image_angle,properties.halo_color,.4)
}


draw_self();