function scr_gamepad_vars(){
	global.gamepads = [] // a array that stores gamepad connected (if multiplayer there'll be more than one
	global.gamepad_main = undefined //storer the main gamepad connected
}

function scr_keybindings(){
	var _gamepad = global.gamepad_main;	

	if(_gamepad!=undefined){
		scr_icon_key_change("gamepad")
		//this means that there's an gamepad connected (use gamepad)
		//show_debug_message("Since a gamepad was found using it")
		global.key_right = gamepad_button_check(_gamepad,gp_padr);
		global.key_left = gamepad_button_check(_gamepad,gp_padl);//retornara 0 ou 1 soq negativo
		global.key_dash = gamepad_button_check(_gamepad, gp_face2);	
		global.key_down  = gamepad_button_check(_gamepad,gp_padd);
		global.key_up  = gamepad_button_check(_gamepad,gp_padu);
		global.key_interaction = gamepad_button_check(_gamepad, gp_face3);	
		
	}else{
		scr_icon_key_change("keyboard")
		//this means that there's no gamepad connected (use keyboard)
		//show_debug_message("Since no gamepad was found using the keyboard")
		global.key_right = keyboard_check(ord("D"));
		global.key_left = keyboard_check(ord("A"));//retornara 0 ou 1 soq negativo
		global.key_dash = keyboard_check_pressed(vk_shift);
		global.key_down  = keyboard_check(ord("S"));
		global.key_up  = keyboard_check(ord("W"));
		global.key_interaction = keyboard_check(ord("E"));
	}
}

function scr_icon_key_change(){
	var behavior = argument0; //if is an gamepad or a cross
	
	
	global.icons = {
		cross_icon:undefined,
		jump_icon:undefined,
		attack_icon:undefined,
		up_icon:undefined,
		interaction_icon:undefined,
		dash_icon:undefined
	}
	
	switch(behavior){
		case "gamepad": 
			global.icons={
				cross_icon:spr_gamepad_cross,
				jump_icon:spr_gamepad_jump,
				attack_icon:spr_gamepad_attack,
				up_icon:spr_gamepad_up,
			}
		break;
		case "keyboard":
			global.icons={
				cross_icon:spr_keyboard_cross,
				jump_icon:spr_keyboard_icon_jump,
				attack_icon:spr_keyboard_icon_attack,
				up_icon:spr_keyboard_icon_up
			}
		break;
	}
}