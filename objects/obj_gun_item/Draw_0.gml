
if(should_ever_be_visible and visible){
	draw_self();
}

if(current_state == item_state.onground){
	draw_sprite_ext(sprite_index,1,x,baseY+8,1,1,image_angle,c_black,.3)
	scr_shire_pickup_draw(); // Draws the effect (and i hope for a low GPU use output)
}


//Draw Hands (for some reason)
if(current_state == item_state.onhand){
	var _angle = point_direction(x,y,mouse_x,mouse_y)
	var _height = sprite_get_width(sprite_index)/2;
	var _x = x;
	var _y = y+lengthdir_y(2,_angle)
	var _xx = x+lengthdir_x(_height,_angle)
	//Right hand
	draw_sprite_ext(spr_hands,0,_x,_y,image_xscale,1,image_angle,c_white,1)

//	if(is_meelee==false){
//		//left hand
//		draw_sprite_ext(spr_hands,0,_xx,_y,image_xscale,1,image_angle,c_white,1)
//	}
}
if(global.config_debug){
	draw_set_font(fnt_def_font1)
	draw_text(x,y-16,"state:"+string(current_state))
	draw_text(x,y-32,"parent:"+string(current_parent))
	draw_text(x,y-48,"type:"+string(current_type))
	draw_text(x,y-64,"inventory_assign:"+string(current_inventory_slot))
}


// Floating offset
var _float_offset = sin(current_time / 200) * 4;
// Icon Y position (with floating effect)
var _icon_y = y + sprite_height/2 + _float_offset;
if(instance_exists(obj_player) and current_state = item_state.onground){
	if(distance_to_object(obj_player)<=16){
		var _depth = depth
		depth = -9999999999
		draw_sprite_ext(global.icons.interaction_icon,0,x,_icon_y+8,0.5,0.5,0,c_white,1)
		draw_set_font(fnt_title_font2)
		draw_text_transformed(x+16,_icon_y,string(global.gun_data_list[current_type].item_name),.5,.5,0)
		depth = _depth
	}
}


