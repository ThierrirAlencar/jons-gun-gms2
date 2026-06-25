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

//World generation
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

