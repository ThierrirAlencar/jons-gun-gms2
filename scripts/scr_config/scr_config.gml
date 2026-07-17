function scr_config(){
	global.grid_size = 32
	
	//Screen size stuff
	global.screen_height_size = 360 // Tamanho 1x de Altura
	global.screen_width_size = 640 // Tamanho 1x de Largura
	global.screen_scale = 3 // Define em quantas vezes altura e largura a tela está; 
	
	//interface size stuff
	global.ui_config_scale = 0.75
}

function scr_load_enums(){
	enum world_generation_status {
		not_needed, //não nescessário
		non_started, //Quer dizer que a geração não iniciou ainda
		deffining_grid, //Doing grid and chunk cauculations base on world size
		placing_tiles, //Placing Tiles for each kind of biome
		finished, //World generated
	}
	
	enum material {
		wather,
		iron, //munição normal efeitos normais
		magic, //Munições mágicas
		radioative, //munições radioativas
		fiire //munições de fogo
	}
	enum bullet_alegiance{ //Lealdade da bala (entre o player e o inimigo)
		player,
		enemy
	}
	
	enum item_type{
		weapom,
		construction,
		ingridient,
		crafting
	}
	enum world_generation_tiles {
		grass, 
		whater,
		sand,
		mountain,
		snow
	}
	#region itens 
		enum item_kind {
			shotgun,
			ak47,
			sword,
			uzi,
			frogun,
			crabhand,
			anubis_wand,
			oxford,
			automatic_pulse_rifle,
			HardM,
			double_barrel_shotgun,
			m4a4,
			firethrower,
			deers_wand,
			eagles_colt,
			g32
		}
		enum item_state {
			onground, //Quando a arma estiver no chão
			onhand, //Quando a arma estiver no slot do personagem
			onInventory, //Quando a arma estiver guardada em inventário
			onenemy // Quando a arma estiver nas mãos dos inimigos
		}
	#endregion

}