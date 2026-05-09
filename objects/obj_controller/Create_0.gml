scr_setIngredientDatalist()
scr_setWeaponsDataList()
scr_gamepad_vars()
scr_keybindings();
scr_load_enums()
scr_config()


//Lista de objetos essenciais para o funcionamento do jogo

draw_set_font(fnt_def_font1)

//Debug List

global.config_debug = false; 
global.game = true //Se estiver em uma sala aonde existe jogo

//World generation
global.world_generated = false //Define que o mundo ainda não foi gerado
global.world_gen_status = world_generation_status.non_started
global.world = src_set_grid()

for(var _y=0;_y<array_length(global.world);_y++){
	for(var _x=0;_x<array_length(global.world[_y]);_x++){
		show_debug_message(global.world[_y][_x].tile_name)
	}
}