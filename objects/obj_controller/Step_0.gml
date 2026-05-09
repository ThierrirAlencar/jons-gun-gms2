




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

