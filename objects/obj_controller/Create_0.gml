//scr_setIngredientDatalist()
//scr_setWeaponsDataList()
scr_gamepad_vars()
scr_keybindings();
scr_load_enums()
scr_config()
scr_defineItens() 

//Lista de objetos essenciais para o funcionamento do jogo

draw_set_font(fnt_def_font1)

//Debug List


global.config_debug = false; 
global.config_debug_camera = false; 
global.pause_menu = false;
global.game = false  //Se estiver em uma sala aonde existe jogo

global.reload = false; //Used to reload game data while global.game = true


//Information from now on should be saved and loaded on the future;

//World generation (Proceduraly
global.world_generated = false //Define que o mundo ainda não foi gerado
global.world_gen_status = world_generation_status.non_started;
global.world = noone; //Atualmente o mundo é gerado aqui
global.map_surface = -1;



//Inventory
global.gui_component_easy_access_inventory = noone

//Player Status
global.player_status = {
	EXP:0, 
	max_exp:999,
	max_life:100,
	current_life:100
}

//Game Control
global.game_ini_amount = -1 //Unactive if -1
global.game_loading = false; //If false destroys any loading
global.game_stage = 0; //Defines wich stage of the game you are (each stage is one 'level'
global.game_stage_labels = [
	"Blank ",
	"Ant's Plains",
	"Ant's Plains",
	"Ant's Plains",
	"Witche's Swamp", //Boss fight place
	"Robots Desert",
	"Robots Desert",
	"Robots Desert",
	"Magma Cave", //Boss Fight place
]

function reload_game(){
	global.game_ini_amount = -1
	global.game = true;
	global.game_stage = 1;
	//scr_reload() //reload numeric data
	
	if(!instance_exists(obj_player)){
		var _p = instance_create_depth(x,y,depth,obj_player)	
	}
	
	scr_tileset_create()

	var a = instance_create_depth(0,0,0,obj_transition_notificator);
	a.transit_to_area = "Sweet Calm Florest -> 01"
	global.game_loading = false;
}

function go_to_next_stage(){
	if(global.game_stage<array_length(global.game_stage_labels)){
			global.game = false
			global.game_loading = true
			alarm[0] = 90;

			show_debug_message("All Enemies Killed-> reloading room current stage: "+string(global.game_stage))
			global.game_stage++
			room_restart() //Restart room (in the future should move to the next room
	}else{
		global.game = false;
		show_debug_message("All Enemies Killed-> No More Stages: "+string(global.game_stage))
		scr_gunbound_transition(c_black,.5,room_menu)
	}
		
}

