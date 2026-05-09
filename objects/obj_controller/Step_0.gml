
x = mouse_x
y = mouse_y




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