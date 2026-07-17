
//Checks if game is happening (while in any room where the game is happening) 
if(global.game){
	//Assign binding for gamepad related functions (also by default intantiates all the controls of the game)
	if(instance_exists(obj_gamepad_input)){
		scr_keybindings();
	}else{
		show_debug_message("Since Instance obj_gamepad_input does not exists, creating it")
		instance_create_depth(x,y,depth,obj_gamepad_input)
	}
	
	//Creates the ambience object 
	if(instance_exists(obj_ambience_controller) == false){
		show_debug_message("Since Instance obj_ambience_controller does not exists, creating it")
		instance_create_depth(x,y,depth,obj_ambience_controller)
	}

	//Assign aim object (we gonna use that object to control guns ain and interactions whitin the game)
	if instance_exists(obj_aim) == false{
		show_debug_message("Since Instance obj_aim does not exists, creating it")
		instance_create_depth(x,y,depth,obj_aim)
	}
	
	//Creates a camera object for camera stuff
	if instance_exists(obj_camera) == false{
		show_debug_message("Since Instance obj_camera does not exists, creating it")
		var app = instance_create_depth(x,y,depth,obj_camera)
		if(instance_exists(obj_player)){
			app.target = obj_player.id; 
			
			app.camera = view_camera[0];
			app.cam_w = camera_get_view_width(app.camera);
			app.cam_h = camera_get_view_height(app.camera);

			app.x = camera_get_view_x(app.camera);
			app.y = camera_get_view_y(app.camera);
		}
	}
	//Creates the inventory controller for the player
	if (instance_exists(obj_inventory_controller) == false) {
		show_debug_message("Since Instance obj_inventory_controller does not exists, creating it")
		instance_create_depth(x,y,-99,obj_inventory_controller)
	}
	//Creates the base interface handler (this one is ONLY used for the basic interface of the game)
	if (instance_exists(obj_gui_interface_handler) == false) {
		show_debug_message("Since Instance obj_gui_interface_handler does not exists, creating it")
		instance_create_depth(x,y,-99,obj_gui_interface_handler)
	}

	
	//Created the pause menu if the global.pause is set to be true;
	if(global.pause_menu and !instance_exists(obj_on_game_pause_menu)){
		instance_create_depth(x,y,-99, obj_on_game_pause_menu);
		show_debug_message("Since Instance obj_on_game_pause_menu does not exists, creating it, trigered by keyboard input")
	}
	
	//Created the pause obj_player if the global.pause is set to be true;
	//if(global.game and !instance_exists(obj_player)){
	//	instance_create_depth(x,y,-99, obj_player);
	//	show_debug_message("Since Instance obj_player does not exists, creating it, trigered by keyboard input")
	//}
	
	//If reload is needed reload all main data and configs of the game
	if(global.reload){
		scr_defineItens() 
		scr_gamepad_vars()
		scr_keybindings();
		scr_load_enums()
		scr_config()
		
		global.reload = false; //desativa o reload
	}
		
	
	//check debug and functional keys
	if(keyboard_check_pressed(vk_anykey)){
		switch(keyboard_lastkey){
			case vk_f1:
				if(global.config_debug){
					global.config_debug = false
				}else{
					global.config_debug = true
				}
				show_debug_message("Detected debug key pressed:f1 -> debug infomations as:"+string(global.config_debug))
			break;
			case vk_f2: 
					if(global.config_debug_camera){
						global.config_debug_camera = false
					}else{
						global.config_debug_camera = true
					}
					show_debug_message("Detected debug key pressed:f2 -> setted debug camera as "+string(global.config_debug_camera))
					break;
			case vk_f3: 
				//Realiza um recarregamento de variaveis
				global.reload = true; 
				show_debug_message("Detected debug key pressed:f3 -> setted reload as true")
				break;
			case vk_escape:
				//ativa o menu de pause
					if(global.pause_menu){
						global.pause_menu = false
					}else{
						global.pause_menu = true
					}
					show_debug_message("Detected functional key pressed:Escape -> setted pause menu as "+string(global.pause_menu))
				break;
			case vk_f5:
				global.game = false;
				alarm[0] = 90
				show_debug_message("Detected functional key pressed:f5 -> reloading room ")
				room_restart() //Restart room
				break;
		}
	}

	if(global.config_debug_camera){
			var _cam_w = camera_get_view_width(view_camera[0]);
			var _cam_h = camera_get_view_height(view_camera[0]);

			// Center the camera on the aim object
			var _target_x = obj_aim.x - (_cam_w / 2);
			var _target_y = obj_aim.y - (_cam_h / 2);

			camera_set_view_pos(view_camera[0], _target_x, _target_y);
	}else{
		var _cam_w = camera_get_view_width(view_camera[0]);
		var _cam_h = camera_get_view_height(view_camera[0]);

		if(instance_exists(obj_player)){
		// Center the camera on the player (obj_player)
		var _target_x = obj_player.x - (_cam_w / 2);
		var _target_y = obj_player.y - (_cam_h / 2);

		camera_set_view_pos(view_camera[0], _target_x, _target_y);
		}
	}
	
	x = mouse_x
	y = mouse_y
	
	if(instance_exists(obj_player)){
		//atualiza os status do jogador
		global.player_status.current_life = obj_player.vida;
	}
	
	//Reset game
	global.game_ini_amount = instance_number(obj_inimigo); //Conta a quantidade de inimigos no game
	if(global.game_ini_amount == 0 and alarm[0]==-1){
		go_to_next_stage()
	}
	
} else if(!global.game){	
	//deleted the obj_gamepad_input  
	if(instance_exists(obj_gamepad_input)){
		with(obj_gamepad_input){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_gamepad_input")
		}	
	}
	
	//deleted the obj_ambience_controller  
	if(instance_exists(obj_ambience_controller)){
		with(obj_ambience_controller){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_ambience_controller")
		}	
	}
	
	//deleted the obj_aim  
	if(instance_exists(obj_aim)){
		with(obj_aim){
			window_set_cursor(cr_default)
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_aim")
		}	
	}
	
	//deleted the obj_gui_interface_handler  
	if(instance_exists(obj_camera)){
		with(obj_camera){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_camera")
		}	
	}
	
	//deleted the obj_gui_interface_handler  
	if(instance_exists(obj_inventory_controller)){
		with(obj_inventory_controller){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_inventory_controller")
		}	
	}
	
	//deleted the obj_gui_interface_handler  
	if(instance_exists(obj_gui_interface_handler)){
		with(obj_gui_interface_handler){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_gui_interface_handler")
		}	
	}
	
	//deleted the pause menu 
	//if(instance_exists(obj_on_game_pause_menu)){
	//	with(obj_on_game_pause_menu){
	//		instance_destroy()
	//		show_debug_message("Since game ended  deleting obj_on_game_pause_menu")
	//	}	
	//}
	
	if(global.pause_menu and !instance_exists(obj_on_game_pause_menu)){
		instance_create_depth(x,y,-99, obj_on_game_pause_menu);
		show_debug_message("Since Instance obj_on_game_pause_menu does not exists, creating it, trigered by keyboard input")
	}
	
	if(instance_exists(obj_on_game_pause_menu)){
			if(global.pause_menu){
					global.pause_menu = false
			}else{
				global.pause_menu = true
			}
			show_debug_message("Detected functional key pressed:Escape -> setted pause menu as "+string(global.pause_menu))
	}
	
	//deleted the pause obj_player i
	if(instance_exists(obj_player)){
		with(obj_player){
			instance_destroy()
			show_debug_message("Since game ended  deleting obj_player")
		}	
	}
}





