

var _gamepad = async_load[? "pad_index"] //checks if there's any gamepad and stores it inside pad_index

switch(async_load[? "event_type"]){ //loads a sswitch over the kind of event
	//detect gamepads being connected
	case "gamepad discovered":
			array_push(global.gamepads,_gamepad)
			gamepad_set_axis_deadzone(_gamepad,0.2) //Set switch deadzone of the gamepad
		break;
	//detect gamepads being disconnected 
	case "gamepad lost":
			var _array_index = array_get_index(global.gamepads,_gamepad);
			if(_array_index>=0){
				array_delete(global.gamepads,_array_index,1)
			}
		break;
}

show_debug_message("gamepad event:"+async_load[? "event_type"])

//Sets the main gamepad as the lowest value inside gamepads list
if(array_length(global.gamepads) > 0){
	global.gamepad_main = global.gamepads[0]
}



