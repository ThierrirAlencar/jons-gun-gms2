
var _max_size = array_length(menu_options);
//global.key_up

if(keyboard_check_pressed(vk_down)){
	if(selected_index<_max_size-1){
		selected_index ++
	}else{
		selected_index = 0
	}
	
	show_debug_message(selected_index)
}
if(keyboard_check_pressed(vk_up)){
	if(selected_index>0){
			selected_index --
	}else{
		selected_index = _max_size-1
	}
}


if(keyboard_check_pressed(vk_space)){
	switch(selected_index){
		case 0: option_play(); break;
		case 3: option_debug();break;
		case 4: game_end() break;
		default:option_blank();
	}
}

time += delta_time / 1000000; // convert microseconds → seconds, grows every frame