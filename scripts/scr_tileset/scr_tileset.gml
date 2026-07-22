//Should allow for controll of :
//change (larger numbers means lower criteria rounder areas) 
//to_mark (more cells to check usualy means larger areas)

function scr_tile_define_walls(){
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
	var _build_tile_set = tl_walls1;
	var _scan_tile_set = tl_debug_use_tile;
	var _main_layer = layer_get_id("layer_tile_01");
	var _build_layer = layer_get_id("layer_tile_02");
	var _build_tilemap = layer_tilemap_get_id(_build_layer)
	tilemap_tileset(_build_tilemap, _build_tile_set); //Sets the tileset 
	
	//If layer does not exists create one 
	if(!_main_layer){_main_layer = layer_create(depth+10,"layer_tile_01")};
	if(!_build_layer){_build_layer = layer_create(depth+20,"layer_tile_02")};

    for(var xx = 0; xx < global.tilemap_w; xx++){
        for(var yy = 0; yy < global.tilemap_h; yy++){
            if(tilemap_get(global.tilemap, xx, yy) == tile_definitions_struct.wall){
				tilemap_set(_build_tilemap,1,xx,yy) //Sets its owl 
            }
        }
    }
	
	
}

function scr_define_spawns(){
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
	var _grid_size = global.grid_size;
	
	if(instance_exists(obj_player)){
		var _allowed_x = -1;
		var _allowed_y = -1;
		
		while ( _allowed_x == -1 or _allowed_y == -1){
			var px = irandom_range(1, global.tilemap_w-2);
			var py = irandom_range(1, global.tilemap_h-2);
			
			
			//Detects a safe place 
			if(tilemap_get(global.tilemap,px,py) != tile_definitions_struct.wall){
				_allowed_y = py*32;
				_allowed_x = px*32;
				
				//clear unnallowed tiles around the player
				var _radius = 1;
				for(var xx = -_radius; xx <= _radius; xx++){
					for(var yy = -_radius; yy <= _radius; yy++){
						var _tx = px + xx;
				        var _ty = py + yy;
        
				        if(_tx < 1 || _tx > global.tilemap_w-2 || _ty < 1 || _ty > global.tilemap_h-2){
				            continue;
				        }
        
				        if(tilemap_get(global.tilemap,_tx,_ty)==tile_definitions_struct.wall){
				            tilemap_set(global.tilemap, tile_definitions_struct.walkable,_tx,_ty);
				        }
					}
				}
			}
		}
		
		var _main_layer = layer_get_id("layer_instances_active");
		obj_player.x = _allowed_x;
		obj_player.y = _allowed_y;
		//If layer does not exists create one 
		if(!_main_layer){_main_layer = layer_create(depth+10,"layer_instances_active")}
	
		var _weapom = instance_create_layer(obj_player.x, obj_player.y,_main_layer,obj_gun_item)
		_weapom.current_type = item_kind.eagles_colt;
		
	}
}

function scr_spawn_enemies(){
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
    var _max_enemies_amount = 36;
    var _enemies_spawned = 0;
    var _layer = layer_get_id("layer_instances_active");
    if(!_layer){_layer = layer_create(depth+10,"layer_instances_active")}
    
    // NEW: validity thresholds
    var _wall_check_radius = 32;
    var _min_player_distance = 128;
    
    var _possible_enemies = global.permanent_stage_configurations[global.game_stage].enemy_list
	
    var _valid_tiles = [];
    for(var xx = 0; xx < global.tilemap_w; xx++){
        for(var yy = 0; yy < global.tilemap_h; yy++){
            if(tilemap_get(global.tilemap, xx, yy) != tile_definitions_struct.wall){
                array_push(_valid_tiles, [xx*32, yy*32]);
            }
        }
    }
    
    if(array_length(_valid_tiles) == 0){
        show_debug_message("scr_spawn_enemies: no walkable tiles found, aborting spawn.");
        return;
    }
    
    // --- Weighted enemy picker ---
    var _total_weight = 0;
    for(var i = 0; i < array_length(_possible_enemies); i++){
        _total_weight += _possible_enemies[i].chance;
    }
    
    var _pick_enemy = function(_enemies, _total_weight){
        var _roll = random(_total_weight);
        var _accum = 0;
        for(var i = 0; i < array_length(_enemies); i++){
            _accum += _enemies[i].chance;
            if(_roll < _accum){
                return _enemies[i];
            }
        }
        return _enemies[array_length(_enemies) - 1];
    }
    
    // NEW: checks a candidate spawn point against both wall-proximity and player-distance
    var _is_spot_valid = function(_x, _y, _radius, _min_player_dist){
        // Reject if a wall collision marker overlaps the spawn radius
        if(collision_circle(_x, _y, _radius, obj_cos, false, true) != noone){
            return false;
        }
        
        // Reject if too close to the player
        if(instance_exists(obj_player)){
            if(point_distance(_x, _y, obj_player.x, obj_player.y) < _min_player_dist){
                return false;
            }
        }
        
        return true;
    }
    
    // --- Spawn loop ---
    var _safety = 0;
    var _safety_limit = _max_enemies_amount * 40; // raised since some rolls will now be rejected
    
    while(_enemies_spawned < _max_enemies_amount && _safety < _safety_limit){
        _safety++;
        
        var _tile = _valid_tiles[irandom(array_length(_valid_tiles)-1)];
        var _x = _tile[0];
        var _y = _tile[1];
        
        if(!_is_spot_valid(_x, _y, _wall_check_radius, _min_player_distance)){
            continue; // reroll a different tile instead of spawning here
        }
        
        var _chosen = _pick_enemy(_possible_enemies, _total_weight);
        _chosen.create_function(_x, _y);
        
        _enemies_spawned++;
    }
    
    if(_safety >= _safety_limit && _enemies_spawned < _max_enemies_amount){
        show_debug_message("scr_spawn_enemies: hit safety limit, spawned " + string(_enemies_spawned) + "/" + string(_max_enemies_amount));
    }
}

function scr_spawn_chests(){
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
    var _chests_spawned = 0;
    var _maximun_chests_allowed = 3;
    
    var _wall_check_radius = 32;
    var _min_player_distance = 128;
    
    var _possible_chests = [
        obj_chest_hollowed,
        obj_chest_itens,
        obj_chest_cursed
    ]
    
    var _layer = layer_get_id("layer_instances_active");
    if(!_layer){_layer = layer_create(depth+10,"layer_instances_active")}
    
    // Gather all valid walkable tiles ONCE, then pick randomly from them
    var _valid_tiles = [];
    for(var xx = 0; xx < global.tilemap_w; xx++){
        for(var yy = 0; yy < global.tilemap_h; yy++){
            if(tilemap_get(global.tilemap, xx, yy) != tile_definitions_struct.wall){
                array_push(_valid_tiles, [xx*32, yy*32]);
            }
        }
    }
    
    if(array_length(_valid_tiles) == 0){
        show_debug_message("scr_spawn_chests: no walkable tiles found, aborting spawn.");
        return;
    }
    
    var _is_spot_valid = function(_x, _y, _radius, _min_player_dist){
        if(collision_circle(_x, _y, _radius, obj_cos, false, true) != noone){
            return false;
        }
        if(instance_exists(obj_player)){
            if(point_distance(_x, _y, obj_player.x, obj_player.y) < _min_player_dist){
                return false;
            }
        }
        return true;
    }
    
    var _safety = 0;
    var _safety_limit = _maximun_chests_allowed * 60; // chests are rarer than enemies, give more attempts
    
    while(_chests_spawned < _maximun_chests_allowed && _safety < _safety_limit){
        _safety++;
        
        var _tile = _valid_tiles[irandom(array_length(_valid_tiles)-1)];
        var _x = _tile[0];
        var _y = _tile[1];
        
        if(!_is_spot_valid(_x, _y, _wall_check_radius, _min_player_distance)){
            continue;
        }
        
        var _choosen_chest = _possible_chests[irandom(array_length(_possible_chests)-1)];
        instance_create_layer(_x, _y, _layer, _choosen_chest);
        _chests_spawned++;
    }
    
    if(_safety >= _safety_limit && _chests_spawned < _maximun_chests_allowed){
        show_debug_message("scr_spawn_chests: hit safety limit, spawned " + string(_chests_spawned) + "/" + string(_maximun_chests_allowed));
    }
}

function scr_spawn_wall_collisions(){
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
    var _layer = layer_get_id("layer_instances_collisions");
    if(!_layer){_layer = layer_create(depth+10,"layer_instances_collisions")}
    
    for(var xx = 0; xx < global.tilemap_w; xx++){
        for(var yy = 0; yy < global.tilemap_h; yy++){
            if(tilemap_get(global.tilemap, xx, yy) == tile_definitions_struct.wall){
                // +16,+16 shifts spawn point to the tile's center, matching the origin
                instance_create_depth(xx*32 + 16, yy*32 + 16, _layer, obj_cos);
            }
        }
    }
}

function scr_spawn_map_delimitations(){
    var tileset_def_layer = tl_florest_tileset
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
    var _layer = layer_get_id("layer_instances_active");
    if(!_layer){_layer = layer_create(depth+10,"layer_instances_active")}
    
    for(var xx = 0; xx < global.tilemap_w; xx++){
        for(var yy = 0; yy < global.tilemap_h; yy++){
            if(
				tilemap_get(global.tilemap, xx, yy) == tile_definitions_struct.walkable or
				tilemap_get(global.tilemap, xx, yy) == tile_definitions_struct.walkable_variation or
				tilemap_get(global.tilemap, xx, yy) == tile_definitions_struct.walkable_variation_2
			){
                // +16,+16 shifts spawn point to the tile's center, matching the origin
               // instance_create_depth(xx*32 + 16, yy*32 + 16, _layer, obj_area_grassland);
				var _change = 15; //Chance of 60 percent to spawn something
				if(irandom(100)<=_change){
					var _spawn_x = (xx*32)//+irandom_range(-16,16)
					var _spawn_y = (yy*32)//+irandom_range(-16,16)
					//spawn destructable
					if(place_empty(_spawn_x,_spawn_y,obj_destructable) and place_empty(_spawn_x,_spawn_y,obj_cos)){
						var _a = instance_create_layer(_spawn_x,_spawn_y,_layer,obj_destructable_brush)
					}
				}
				
				var _change = 1; //Chance of 1 percent to spawn purple brush
				if(irandom(100)<=_change){
					var _spawn_x = (xx*32)//+irandom_range(-16,16)
					var _spawn_y = (yy*32)//+irandom_range(-16,16)
					//spawn destructable
					if(place_empty(_spawn_x,_spawn_y,obj_destructable) and place_empty(_spawn_x,_spawn_y,obj_cos)){
						var _a = instance_create_layer(_spawn_x,_spawn_y,_layer,obj_destructable_brush_purple)
					}
				}
				
				var _change = 0.5; //Chance of half percent to spawn tree
				if(random(100.0)<=_change){
					var _spawn_x = (xx*32)//+irandom_range(-16,16)
					var _spawn_y = (yy*32)//+irandom_range(-16,16)
					//spawn destructable
					if(place_empty(_spawn_x,_spawn_y,obj_destructable_tree) and place_empty(_spawn_x,_spawn_y,obj_cos)){
						var _a = instance_create_layer(_spawn_x,_spawn_y,_layer,obj_destructable_tree)
					}
				}
				
				
				_change = 0.1
				if(instance_exists(obj_destructable_egg)){
					var _nearest = instance_nearest(xx*32,yy*32,obj_destructable_egg);
					if(distance_to_point(_nearest.x,_nearest.y)<=80){
						_change+=90; //Increases change if theres any nearbie egg
					}
				}
				if(random(100.0) <= _change ){
					var _spawn_x = (xx*32)//+irandom_range(-16,16)
					var _spawn_y = (yy*32)//+irandom_range(-16,16)
					//spawn destructable
					if(place_empty(_spawn_x,_spawn_y,obj_destructable) and place_empty(_spawn_x,_spawn_y,obj_cos)){
						var _a = instance_create_layer(_spawn_x,_spawn_y,_layer,obj_destructable_egg)
					}	
				}
            }
        }
    }
}

function scr_tileset_create(){
	randomize(); //Reseeds game random functions
	
	var tileset_def_layer = tl_florest_tileset
	var tile_definitions_struct = global.permanent_stage_configurations[global.game_stage].generation_config.tileset;
	
	global.tileset_layer = layer_get_id("layer_tile_01")
	global.tilemap = layer_tilemap_get_id(global.tileset_layer)

	global.tilemap_w = tilemap_get_width(global.tilemap)
	global.tilemap_h = tilemap_get_height(global.tilemap)
	tilemap_tileset(global.tilemap, tileset_def_layer); //Sets the tileset 
	// 1 = wall
	// 2 = empty
	// 3 = detail
	tilemap_clear(global.tilemap, tile_definitions_struct.wall); //filed tiles
	
	var _vector = {
		vx:0,
		vy:0,
		reset: function(){
				    if(vx != 0){
				        vx = 0;
				        vy = choose(-1,1);
				    } else {
				        vy = 0;
				        vx = choose(-1,1);
				    }
		}
	}
	
	_vector.reset();
	
	var _change = 40  //irandom_range(25,50); //Lower -= Corridors; Larger = Larger areas
	
	var px = irandom_range(1, global.tilemap_w-2);
	var py = irandom_range(1, global.tilemap_h-2);
	
	var marked = 0;
	var _max_cells = (global.tilemap_w - 2) * (global.tilemap_h - 2);
	var to_mark = min(900, _max_cells * 0.6);
	var _walker_count = 1;
	var _cells_per_walker = to_mark / _walker_count ;
	var marked = 0;
	var _safety = 0;
	var _safety_limit = 1000000;

	for(var w = 0; w < _walker_count; w++){
	    var px = irandom_range(1, global.tilemap_w-2);
	    var py = irandom_range(1, global.tilemap_h-2);
	    var _marked_this_walker = 0;
    
	    _vector.reset();
    
	    while (_marked_this_walker < _cells_per_walker && _safety < _safety_limit){
	        _safety++;
        
		
			/*
	        if(tilemap_get(global.tilemap,px,py)==1){
	            tilemap_set(global.tilemap, irandom_range(2,3),px,py);
	            marked++
	            _marked_this_walker++
	        }
			
			*/
			
			var _radius = choose(0,1,1,1,2); // 0 = corridors only, 1-2 = wider rooms
			for(var xx = -_radius; xx <= _radius; xx++){
			    for(var yy = -_radius; yy <= _radius; yy++){
			        var _tx = px + xx;
			        var _ty = py + yy;
        
			        if(_tx < 1 || _tx > global.tilemap_w-2 || _ty < 1 || _ty > global.tilemap_h-2){
			            continue;
			        }
        
			        if(tilemap_get(global.tilemap,_tx,_ty)==tile_definitions_struct.wall){
			            tilemap_set(global.tilemap, choose(
							tile_definitions_struct.walkable,
							tile_definitions_struct.walkable_variation,
							tile_definitions_struct.walkable_variation
						),_tx,_ty);
			            marked++
			            _marked_this_walker++     
			        }
			    }
			}
        
	        if(random_range(0,100)<_change){
	            _vector.reset();
	        }
        
	        px = clamp(px+_vector.vx, 1, global.tilemap_w-2);
	        py = clamp(py+_vector.vy, 1, global.tilemap_h-2);
	    }
	}

	//spawns stuff on world
	scr_define_spawns();
	//spawns collisions on world
	scr_spawn_wall_collisions();
	//spawns map details
	scr_spawn_map_delimitations()
	//spawn enemies
	scr_spawn_enemies()
	//Spawn chests
	scr_spawn_chests()
}
