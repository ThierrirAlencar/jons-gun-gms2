


if(global.config_debug){

	draw_text(16,0,string(global.inventory_gun_slot_selected_current))
	for(var i = 0; i<array_length(global.inventory_gun_list);i++){
		var _item = global.inventory_gun_list[i];
		if(_item!=noone){
			draw_set_font(fnt_def_font1)
			draw_text(16,(i+1)*16,"name:"+string(_item.name))
			draw_text(16,(i+1)*32,"index:"+string(i))

		}
		
		draw_set_font(fnt_debug_font4)
		draw_text(0,200+(16*0),"Game Stage:"+string(global.game_stage))
		draw_text(0,200+(16*1),"Game Stage: Label:"+string(global.game_stage_labels[global.game_stage]))
		draw_text(0,200+(16*2),"Game Loading:"+string(global.game_loading));
		draw_text(0,200+(16*3),"Game INI amount:"+string(global.game_ini_amount));
		draw_text(0,200+(16*4),"Controler Alarm 1:"+string(obj_controller.alarm[1]));
		draw_text(0,200+(16*5),"Controler Alarm 0:"+string(obj_controller.alarm[0]));
		draw_text(0,200+(16*6),"Camera X:"+string(obj_camera.x));
		draw_text(0,200+(16*7),"Camera Y:"+string(obj_camera.y));
		draw_text(0,200+(16*8),"Camera Target:"+string(obj_camera.target.object_index));
		draw_text(0,200+(16*9),"Aim X:"+string(obj_aim.x));
		draw_text(0,200+(16*10),"Aim Y:"+string(obj_aim.y));
		//draw_text(16,48,"id:"+string(_item.id))
}
}