
function scr_set_stage_configuration(){
	
	//Data driven implementation of information for the stage
	global.permanent_stage_configurations =  [
		{//Blank (Will never be used, hoppefully
		},
		{ //Ant's plains 1 
				level_name:"Ant's Plains - 1",
				world:1,
				enemy_list:[
								{
								            name:"witch",
								            chance: 20,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_bruxo);
								                var _weapons = [
								                     item_kind.anubis_wand,
													 item_kind.anubis_wand
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{//REMOVED
								            name:"rebel bandit",
								            chance: 0,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_rebel);
								                var _weapons = [
								                     item_kind.shotgun,
								                     item_kind.uzi
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{
								            name:"fire ant",
								            chance: 60,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_fire_baby_ant);
								            }
								        },
								{
								            name:"adult fire ant",
								            chance: 20,
											create_function: function (_x, _y){
											                var _layer = layer_get_id("layer_instances_active");
											                var _en = instance_create_layer(_x,_y,_layer, obj_ini_adult_fire_ant);
											                /*var _weapons = [
											                     item_kind.firethrower,
																 item_kind.firethrower
											                ]
											               //var _c_gun = _weapons[irandom(1)];
                
											                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
											                _w.current_parent = _en;
											                _w.current_state = item_state.onenemy;
											                _w.current_type = _c_gun;
															_w.should_ever_be_visible = false;
															_w.visible = false
											                _en.current_gun = _w;
															*/
											            },
								        },
				],
				wheater_stage_config:{ //Configurações de Clima
					ambient_light_brightness:.45, //Iluminação
					rain_height:40, //Altura da chuva
					number_of_rain: 20, //Número de particulas de chuva spawnadas
					is_raining:false, //Se a chuva é permanente ou não
				},
				generation_config:{ //Configurações de geração de mundo
					tileset:{ //Configurations of the specific tileset
						stage_prefered_tileset:tl_florest_tileset,
						stage_walls_tileset:tl_walls1,
						wall:3,
						walkable:6,
						walkable_variation:4,
						walkable_variation_2:5
					},
					g_data:{ //Configurations for generation of the tileset
						
					}
				}
			},
		{ //Ant's plains 2
				level_name:"Ant's Plains - 2",
				world:1,
				enemy_list:[
								{
								            name:"witch",
								            chance: 30,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_bruxo);
								                var _weapons = [
								                     item_kind.anubis_wand,
													 item_kind.anubis_wand
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{
								            name:"rebel bandit",
								            chance: 10,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_rebel);
								                var _weapons = [
								                     item_kind.shotgun,
								                     item_kind.uzi
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{
								            name:"fire ant",
								            chance: 50,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_fire_baby_ant);
								            }
								        },
								{
								            name:"adult fire ant",
								            chance: 10,
											create_function: function (_x, _y){
											                var _layer = layer_get_id("layer_instances_active");
											                var _en = instance_create_layer(_x,_y,_layer, obj_ini_adult_fire_ant);
											                /*var _weapons = [
											                     item_kind.firethrower,
																 item_kind.firethrower
											                ]
											               //var _c_gun = _weapons[irandom(1)];
                
											                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
											                _w.current_parent = _en;
											                _w.current_state = item_state.onenemy;
											                _w.current_type = _c_gun;
															_w.should_ever_be_visible = false;
															_w.visible = false
											                _en.current_gun = _w;
															*/
											            },
								        },
				],
				wheater_stage_config:{ //Configurações de Clima
					ambient_light_brightness:.45, //Iluminação
					rain_height:40, //Altura da chuva
					number_of_rain: 20, //Número de particulas de chuva spawnadas
					is_raining:true, //Se a chuva é permanente ou não
				},
				generation_config:{ //Configurações de geração de mundo
					tileset:{ //Configurations of the specific tileset
						stage_prefered_tileset:tl_florest_tileset,
						stage_walls_tileset:tl_walls1,
						wall:3,
						walkable:6,
						walkable_variation:4,
						walkable_variation_2:5
					},
					g_data:{ //Configurations for generation of the tileset
					
					}
				}
			},
		{ //Ant's plains 3 
				level_name:"Ant's Plains - 3",
				world:1,
				enemy_list:[
								{
								            name:"witch",
								            chance: 30,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_bruxo);
								                var _weapons = [
								                     item_kind.anubis_wand,
													 item_kind.anubis_wand
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{
								            name:"rebel bandit",
								            chance: 10,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_rebel);
								                var _weapons = [
								                     item_kind.shotgun,
								                     item_kind.uzi
								                ]
								                var _c_gun = _weapons[irandom(1)];
                
								                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
								                _w.current_parent = _en;
								                _w.current_state = item_state.onenemy;
								                _w.current_type = _c_gun;
                
								                _en.current_gun = _w;
								            },
								        },
								{
								            name:"fire ant",
								            chance: 50,
								            create_function: function (_x, _y){
								                var _layer = layer_get_id("layer_instances_active");
								                var _en = instance_create_layer(_x,_y,_layer, obj_ini_fire_baby_ant);
								            }
								        },
								{
								            name:"adult fire ant",
								            chance: 10,
											create_function: function (_x, _y){
											                var _layer = layer_get_id("layer_instances_active");
											                var _en = instance_create_layer(_x,_y,_layer, obj_ini_adult_fire_ant);
											                /*var _weapons = [
											                     item_kind.firethrower,
																 item_kind.firethrower
											                ]
											               //var _c_gun = _weapons[irandom(1)];
                
											                var _w = instance_create_layer(_x,_y,_layer, obj_gun_item)
											                _w.current_parent = _en;
											                _w.current_state = item_state.onenemy;
											                _w.current_type = _c_gun;
															_w.should_ever_be_visible = false;
															_w.visible = false
											                _en.current_gun = _w;
															*/
											            },
								        },
				],
				wheater_stage_config:{ //Configurações de Clima
					ambient_light_brightness:.6, //Iluminação
					rain_height:60, //Altura da chuva
					number_of_rain: 70, //Número de particulas de chuva spawnadas
					is_raining:true, //Se a chuva é permanente ou não
				},
				generation_config:{ //Configurações de geração de mundo
					tileset:{ //Configurations of the specific tileset
						stage_prefered_tileset:tl_florest_tileset,
						stage_walls_tileset:tl_walls1,
						wall:3,
						walkable:6,
						walkable_variation:4,
						walkable_variation_2:5
					},
					g_data:{ //Configurations for generation of the tileset
					
					}
				}
			},
	]

	/*
	"Blank ",
	"Ant's Plains",
	"Ant's Plains",
	"Ant's Plains",
	"Witche's Swamp", //Boss fight place
	"Robots Desert",
	"Robots Desert",
	"Robots Desert",
	"Magma Cave", //Boss Fight place
	*/
}
