if(global.game){
	if(instance_exists(obj_gamepad_input)){
		scr_keybindings();
	}else{
		show_debug_message("Since Instance obj_gamepad_input does not exists, creating it")
		instance_create_depth(x,y,depth,obj_gamepad_input)
	}

	if instance_exists(obj_aim) == false{
		show_debug_message("Since Instance obj_aim does not exists, creating it")
		instance_create_depth(x,y,depth,obj_aim)
	}


	if(keyboard_check_pressed(vk_f1)){
		if(global.config_debug){
			global.config_debug = false
		}else{
			global.config_debug = true
		}
	}
	if(keyboard_check_pressed(vk_f2)){
		if(global.config_debug_camera){
			global.config_debug_camera = false
		}else{
			global.config_debug_camera = true
		}
	}
	
	if(global.config_debug_camera){
		var _cam_w = camera_get_view_width(view_camera[0]);
		var _cam_h = camera_get_view_height(view_camera[0]);

		// Center the camera on the player (obj_player)
		var _target_x = obj_aim.x - (_cam_w / 2);
		var _target_y = obj_aim.y - (_cam_h / 2);

		camera_set_view_pos(view_camera[0], _target_x, _target_y);
	}else{
		var _cam_w = camera_get_view_width(view_camera[0]);
		var _cam_h = camera_get_view_height(view_camera[0]);

		// Center the camera on the player (obj_player)
		var _target_x = obj_player.x - (_cam_w / 2);
		var _target_y = obj_player.y - (_cam_h / 2);

		camera_set_view_pos(view_camera[0], _target_x, _target_y);
	}
	
	x = mouse_x
	y = mouse_y
}





