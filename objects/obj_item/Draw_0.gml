
if(current_state == item_state.onground){
	draw_sprite_ext(sprite_index,1,x,baseY+8,1,1,image_angle,c_black,.3)
}
if(global.config_debug){
	draw_set_font(fnt_def_font1)
	draw_text(x,y-16,"name:"+string(item_structue.name));
	draw_text(x,y-32,"quantity:"+string(item_structue.amount))
	draw_text(x,y-48,"type:"+string(item_structue.kind))
}
draw_self();