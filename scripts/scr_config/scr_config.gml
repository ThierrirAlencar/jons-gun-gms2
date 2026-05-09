function scr_config(){
	global.grid_size = 32
}

function scr_load_enums(){
	enum world_generation_status {
		non_started, //Quer dizer que a geração não iniciou ainda
		deffining_grid, //Doing grid and chunk cauculations base on world size
		placing_tiles, //Placing Tiles for each kind of biome
		finished, //World generated
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
		HardM
		}
		enum item_state {
			onground,
			onhand,
			onenemy
		}
	#endregion

}