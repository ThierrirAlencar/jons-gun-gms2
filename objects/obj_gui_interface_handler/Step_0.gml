
/*
if(global.gui_component_easy_access_inventory.draw){
	if(keyboard_check(vk_anykey)){
		switch(keyboard_lastkey){
			case ord("1"): global.gui_component_easy_access_inventory.selected_index = 1; break;
			case ord("2"): global.gui_component_easy_access_inventory.selected_index = 2 break;
			case ord("3"): global.gui_component_easy_access_inventory.selected_index = 3; break;
		}
	}
}
*/

//Assign Inventory to my balls

//Updates display bars informations


if(global.gui_component_player_status_easy_display.draw){
	if(instance_exists(obj_player)){
		
		//LIFE
		global.gui_component_player_status_easy_display.hearthbar.current_value =global.player_status.current_life
		global.gui_component_player_status_easy_display.hearthbar.max_value = global.player_status.max_life;
		
		//EXP
		global.gui_component_player_status_easy_display.expbar.current_value =global.player_status.EXP;
		global.gui_component_player_status_easy_display.expbar.max_value =global.player_status.max_exp;
		
		
		if(instance_exists(obj_inventory_controller)){
			global.gui_component_easy_access_inventory.selected_index = global.inventory_gun_slot_selected_current ; 
		}
	}
}