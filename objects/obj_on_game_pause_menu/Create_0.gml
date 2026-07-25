function resume_game(){
	if(instance_exists(obj_player)){
		global.game_paused = false; //reinicia o jogo
	}
}
function option_return_to_main_menu(){
	//Finaliza a sessão
	obj_game_controller._end_session();
	room_goto(room_menu)

}
function option_blank(){
	show_message("Not implemented")
	global.game_paused =false; //reinicia o jogo
}
function option_cofigs(){
	show_message("Not implemented")
	global.game_paused =false; //reinicia o jogo
}
function option_quit(){
	game_end(); //Fecha o jogo;
}


menu_options = [
	{
		name:"Resume",
		action: resume_game
	},
	{
		name:"Options",
		action: option_blank //Function kind
	},
	{
		name:"Main Menu",
		action: option_return_to_main_menu //Function kind
	},
	{
		name:"Quit",
		action: option_quit
	}
]

time = 0;

selected_index = 0 // Opção do menu selecionado