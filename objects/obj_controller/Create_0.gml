scr_setIngredientDatalist()
scr_setWeaponsDataList()
scr_gamepad_vars()
scr_keybindings();
scr_load_enums()
scr_config()

global.screen_height_size = 360 // Tamanho 1x de Altura
global.screen_width_size = 640 // Tamanho 1x de Largura

//Lista de objetos essenciais para o funcionamento do jogo

draw_set_font(fnt_def_font1)

//Debug List

global.config_debug = false; 
global.config_debug_camera = false; 

global.game = false  //Se estiver em uma sala aonde existe jogo

global.reload = false; 

//World generation
global.world_generated = false //Define que o mundo ainda não foi gerado
global.world_gen_status = world_generation_status.non_started;
global.world = noone; //Atualmente o mundo é gerado aqui
global.map_surface = -1;


