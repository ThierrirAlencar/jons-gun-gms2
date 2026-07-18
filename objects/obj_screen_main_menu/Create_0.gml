function option_play(){
	global.world_gen_status = world_generation_status.not_needed;
	scr_reload()
	//room_goto(room_gmap_01)
	scr_gunbound_transition(c_black,0.1,room_gmap_01)
	obj_controller.alarm[0] = 180 //90 minutes to load game after transition
	global.game_stage = 1;
	global.game_loading = true;
}

function option_debug(){
	global.world_gen_status = world_generation_status.not_needed //Geração não nescessária (não será gerado nada)
	scr_reload()
	room_goto(room_debug)
	global.game = true; //Inicia o jogo
}

function option_blank(){
	show_message("Not implemented")
}

function option_quit(){
	game_end(); //Fecha o jogo;
}


menu_options = [
	{
		name:"Play",
		action: option_play
	},
	{
		name:"Credits",
		action: option_blank //Function kind
	},
	{
		name:"Options",
		action: option_blank //Function kind
	},
	{
		name:"Debug",
		action: option_blank //Function kind
	},
	{
		name:"Quit",
		action: option_blank
	}
]


time = 0;

selected_index = 0 // Opção do menu selecionado