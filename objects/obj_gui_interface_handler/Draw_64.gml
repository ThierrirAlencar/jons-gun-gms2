draw_self();

/*
if(global.pause_menu){
	visible = false
}else{
	visible = true;
}
*/


if(global.game_active){
	#region component easy access inventory
	if(is_struct(global.gui_component_easy_access_inventory)){
	
		var _scale = 2*global.ui_config_scale; //1 if its not selected
		var _amount = 3;
		var _index = global.inventory_gun_slot_selected_current+1;
		var _sprite =  global.gui_component_easy_access_inventory.sprite;

		for(var i=1;i<=_amount;i++){
			//var _padding = sprite_get_width(_sprite)*1 //Padding is the space between the sprites
			var _draw_space = sprite_get_width(_sprite)*_scale //Draw space is the space each section is gonna take;
			var _screen_width = global.screen_width_size*global.screen_scale
			var _screen_height = global.screen_height_size*global.screen_scale
			var _x = (_screen_width / 2)-(floor(_amount/2)*_draw_space) + (i*_draw_space)  //_screen_width - 64  
			var _y = _screen_height-64 // - (i*_padding);
			var _item  = global.inventory_gun_list[i-1]; 
		

		
			if(i==_index){_y -= 8}
		
			draw_sprite_ext(_sprite,0, _x, _y,_scale,_scale,0,c_white,1);

		
		
			if(i==_index){
				depth = depth -1
				draw_sprite_ext(spr_item_container_section,1, _x, _y,_scale,_scale,0,c_white,1);
				//draw_sprite_ext(_sprite,2, _x, _y,_scale,_scale,0,c_white,1);
				depth = depth + 1 
			}
			draw_set_colour(c_white)
			draw_set_font(fnt_title_font2)
			draw_text_transformed(_x+16,_y+16,string(i),2,2,0);
			if(_item!=noone){
				depth-=2
				var _weapon_icon = _item.sprite; 
				draw_sprite_ext(_weapon_icon,1, _x, _y,_scale*1.5,_scale*1.5,0,c_white,1);
				depth += 2
			}
		}
	}

	#endregion

	#region easy access player status display

		if(global.gui_component_player_status_easy_display.draw){
	
			var _scale = global.ui_config_scale; //Set on the main configs
			var _screen_width = global.screen_width_size*global.screen_scale //gets ui config scale times width
			var _screen_height = global.screen_height_size*global.screen_scale //gets ui config scale times height 
			var _x = 128;
			var _y = 100; 
			var _bar_size_x = 256*global.ui_config_scale
			var _bar_size_y = 32*global.ui_config_scale
		
			//Draw current Weapon's name
			if(global.inventory_gun_list[global.inventory_gun_slot_selected_current] != noone){
				draw_set_font(fnt_def_font3)
				draw_set_colour(c_white)
				scr_text_wave(_x,_y+_bar_size_y+40,6,6,string(global.inventory_gun_list[global.inventory_gun_slot_selected_current].name))
			}
			
		
	
			//draw life bar
			var _max_life = global.gui_component_player_status_easy_display.hearthbar.max_value;
			var _current_life = global.gui_component_player_status_easy_display.hearthbar.current_value; 
			var _total = (_max_life*100)/_current_life; //defines value as percentage
			
			var _color = make_colour_rgb(180,32,42)
			draw_healthbar(_x,_y,_x+_bar_size_x+2,_y+_bar_size_y,_total,_color,_color,_color,0,true,false);
			_color = make_colour_rgb(223,62,35)
			draw_healthbar(_x,_y,_x+_bar_size_x+2,_y+_bar_size_y-8,_total,_color,_color,_color,0,true,false);
			//Draw life
			draw_sprite_stretched(spr_graphical_user_interface_life_and_exp,0,117,70,_bar_size_x+24,80)
		
		
			//draw exp bar
			var _max_exp = global.gui_component_player_status_easy_display.expbar.max_value;
			var _current_exp = global.gui_component_player_status_easy_display.expbar.current_value; 
			_total = (_max_exp*100)/_current_exp; //defines value as percentage
			_color = global.gui_component_player_status_easy_display.expbar.bar_colour;
			_y = 182*global.ui_config_scale; 
			_bar_size_x = 168
			_bar_size_y = 16*global.ui_config_scale
			draw_healthbar(_x,_y,_x+_bar_size_x+2,_y+_bar_size_y,_total,_color,_color,_color,0,true,false);
			_color = make_colour_rgb(40,92,196)
			draw_healthbar(_x,_y,_x+_bar_size_x+2,_y+_bar_size_y-4,_total,_color,_color,_color,0,true,false);
			draw_sprite_stretched(spr_graphical_user_interface_life_and_exp,0,117,106,_bar_size_x+24,70)
					

		}
	
	
	#endregion

}