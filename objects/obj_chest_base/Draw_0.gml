
//draw shadow of itself
draw_sprite_ext(sprite_index,1,x,y+16,image_xscale,.5,image_angle,c_black,.3)

// Floating offset
var _float_offset = sin(current_time / 200) * 4;
// Icon Y position (with floating effect)
var _icon_y = y + sprite_height/2 + _float_offset;

draw_self();

if(has_itens and instance_exists(obj_player)){
	//colliding player show interaction icon bellow foot
	if(distance_to_object(obj_player)<=interaction_distance){
		var _depth = depth
		depth = -9999999999
		draw_sprite_ext(global.icons.interaction_icon,0,x,_icon_y+8,0.5,0.5,0,c_white,1)
		draw_set_font(fnt_title_font2)
		draw_text_transformed(x+32,_icon_y,string("Open"),.5,.5,0)
		depth = _depth
	}
}
