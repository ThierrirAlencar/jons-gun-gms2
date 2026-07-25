
if(global.game_active){
	if(keyboard_check_pressed(vk_anykey)){
			switch(keyboard_lastkey){
				case ord("1"): global.inventory_gun_slot_selected_current = 0; break;
				case ord("2"): global.inventory_gun_slot_selected_current = 1 break;
				case ord("3"): global.inventory_gun_slot_selected_current = 2; break;
			}
	}

	if(mouse_wheel_up()){
		if(global.inventory_gun_slot_selected_current<2){
			global.inventory_gun_slot_selected_current++;
		}else{
			global.inventory_gun_slot_selected_current = 0;
		}
	}else if(mouse_wheel_down()){
		if(global.inventory_gun_slot_selected_current>0){
			global.inventory_gun_slot_selected_current--;
		}else{
			global.inventory_gun_slot_selected_current = 2;
		}
	}
}
