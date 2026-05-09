function scr_config(){
	
}

function scr_load_enums(){
	enum world_generation_status {
		non_started, //Quer dizer que a geração não iniciou ainda
		setting_border, //Doing grid and chunk cauculations base on world size
		placing_tiles, //Placing Tiles for each kind of biome
		finished, //World generated
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