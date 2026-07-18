


if(global.config_debug){

	draw_text(16,0,string(global.inventory_gun_slot_selected_current))
	for(var i = 0; i<array_length(global.inventory_gun_list);i++){
		var _item = global.inventory_gun_list[i];
		if(_item!=noone){
			draw_set_font(fnt_def_font1)
			draw_text(16,(i+1)*16,"name:"+string(_item.name))
			draw_text(16,(i+1)*32,"index:"+string(i))
		}
		//draw_text(16,48,"id:"+string(_item.id))
}
}