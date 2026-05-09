

if(current_state == item_state.onground){
	draw_sprite_ext(sprite_index,1,x,baseY+8,1,1,image_angle,c_black,.3)
}
if(keyboard_check(vk_f1)){
	draw_set_font(fnt_def_font1)
	draw_text(x,y-16,"state:"+string(current_state))
	draw_text(x,y-32,"parent:"+string(current_parent))
	draw_text(x,y-48,"type:"+string(current_type))
}
draw_self();

