
defined_tile_wall = 3; //Redefine on script later on


#region mushrooms
	#region general variables (For grass)
		mushroom_amount_multiplier = 0
		mushroom_sprite = spr_mushrooms
		mushroom_frames = sprite_get_number(mushroom_sprite)
		mushroom_texture = sprite_get_texture(mushroom_sprite, 0)
		mushroom_width = sprite_get_width(mushroom_sprite)
		mushroom_height = sprite_get_height(mushroom_sprite)
		
		var _chance = 10
		if(_chance <= random(100)){
			mushroom_amount_multiplier = 1
		}
		
		mushroom_count = 0;
		mushroom_color = c_white
		mushroom_alpha = 1
		
		// Wind shader setup
		//mushroom_shader = shd_grass_wind
		//u_time           = shader_get_uniform(grass_shader, "u_time")
		//u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
		//u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
		//u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
		
		//grass_wind_speed    = 2.2
		//grass_wind_strength = 3.5
		//grass_wind_scale    = 0.02
		
		// Tile check setup
		var _tile_size = 32; // adjust if your tiles aren't 32x32
		var _wall_tile = defined_tile_wall;  // matches tile_definitions_struct.wall elsewhere
		
	#endregion
	#region vertex buffer
		gpu_set_ztestenable(true);
		gpu_set_alphatestenable(true);
		
		vertex_format_begin()
		vertex_format_add_position_3d();
		vertex_format_add_texcoord();
		vertex_format_add_color();
		vertex_format_add_texcoord();
		mushroom_format = vertex_format_end();
		
		mushroom_vertex_buffer = vertex_create_buffer();
		vertex_begin(mushroom_vertex_buffer, mushroom_format)
		
		var _placed = 0;
		var _attempts = 0;
		var _max_attempts = mushroom_count * 200; // safety cap so this can't hang on a near-solid area
		
		while(_placed < mushroom_count && _attempts < _max_attempts){
			_attempts++;
			
			var _x1 = irandom_range(bbox_left, bbox_right)
			var _y1 = irandom_range(bbox_top, bbox_bottom)
			
			// Convert this pixel spot to tile coords and skip if it's a wall
			var _tx = _x1 div _tile_size;
			var _ty = _y1 div _tile_size;
			
			if(tilemap_get(global.tilemap, _tx, _ty) == _wall_tile){
				continue; // reroll a new spot instead of placing grass here
			}
			
			var _x2 = _x1 + mushroom_width;
			var _y2 = _y1 + mushroom_height;
			var _depth = -_y1;
			var _frame = irandom(mushroom_frames - 1)
			var _uvs = sprite_get_uvs(mushroom_sprite, _frame);
			
			var _phase = random(1000);
			
			// Triangle 1
			vertex_position_3d(mushroom_vertex_buffer, _x1, _y1, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[0], _uvs[1])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 1, _phase);
			
			vertex_position_3d(mushroom_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 1, _phase);
			
			vertex_position_3d(mushroom_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 0, _phase);
			
			// Triangle 2
			vertex_position_3d(mushroom_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 1, _phase);
			
			vertex_position_3d(mushroom_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 0, _phase);
			
			vertex_position_3d(mushroom_vertex_buffer, _x2, _y2, _depth);
			vertex_texcoord(mushroom_vertex_buffer, _uvs[2], _uvs[3])
			vertex_color(mushroom_vertex_buffer, mushroom_color, mushroom_alpha);
			vertex_texcoord(mushroom_vertex_buffer, 0, _phase);
			
			_placed++;
		}
		
		vertex_end(mushroom_vertex_buffer)
		vertex_freeze(mushroom_vertex_buffer)
	#endregion 
#endregion

#region leafs
	#region general variables (For grass)
		grass_amount_multiplier = 2
		grass_sprite = spr_grass
		grass_frames = sprite_get_number(grass_sprite)
		grass_texture = sprite_get_texture(grass_sprite, 0)
		grass_width = sprite_get_width(grass_sprite)
		grass_height = sprite_get_height(grass_sprite)
		
		grass_count = image_xscale*image_yscale*grass_amount_multiplier
		grass_color = c_white
		grass_alpha = 1
		
		// Wind shader setup
		grass_shader = shd_grass_wind
		u_time           = shader_get_uniform(grass_shader, "u_time")
		u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
		u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
		u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
		
		grass_wind_speed    = 2.2
		grass_wind_strength = 3.5
		grass_wind_scale    = 0.02
		
		// Tile check setup
		var _tile_size = 32; // adjust if your tiles aren't 32x32
		var _wall_tile = defined_tile_wall;  // matches tile_definitions_struct.wall elsewhere
		
		
	#endregion
	#region vertex buffer
		gpu_set_ztestenable(true);
		gpu_set_alphatestenable(true);
		
		vertex_format_begin()
		vertex_format_add_position_3d();
		vertex_format_add_texcoord();
		vertex_format_add_color();
		vertex_format_add_texcoord();
		grass_format = vertex_format_end();
		
		grass_vertex_buffer = vertex_create_buffer();
		vertex_begin(grass_vertex_buffer, grass_format)
		
		var _placed = 0;
		var _attempts = 0;
		var _max_attempts = grass_count * 200; // safety cap so this can't hang on a near-solid area
		
		while(_placed < grass_count && _attempts < _max_attempts){
			_attempts++;
			
			var _x1 = irandom_range(bbox_left, bbox_right)
			var _y1 = irandom_range(bbox_top, bbox_bottom)
			
			// Convert this pixel spot to tile coords and skip if it's a wall
			var _tx = _x1 div _tile_size;
			var _ty = _y1 div _tile_size;
			
			if(tilemap_get(global.tilemap, _tx, _ty) == _wall_tile){
				continue; // reroll a new spot instead of placing grass here
			}
			
			var _x2 = _x1 + grass_width;
			var _y2 = _y1 + grass_height;
			var _depth = -_y1;
			var _frame = irandom(grass_frames - 1)
			var _uvs = sprite_get_uvs(grass_sprite, _frame);
			
			var _phase = random(1000);
			
			// Triangle 1
			vertex_position_3d(grass_vertex_buffer, _x1, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase);
			
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase);
			
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase);
			
			// Triangle 2
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase);
			
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase);
			
			vertex_position_3d(grass_vertex_buffer, _x2, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase);
			
			_placed++;
		}
		
		vertex_end(grass_vertex_buffer)
		vertex_freeze(grass_vertex_buffer)
	#endregion 
#endregion

#region grass
	#region general variables (For grass)
		leaf_amount_multiplier = 1
		leaf_sprite = spr_leaf_remains
		leaf_frames = sprite_get_number(leaf_sprite)
		leaf_texture = sprite_get_texture(leaf_sprite, 0)
		leaf_width = sprite_get_width(leaf_sprite)
		leaf_height = sprite_get_height(leaf_sprite)
		
		leaft_count = image_xscale*image_yscale*leaf_amount_multiplier
		leaf_color = c_white
		leaf_alpha = 1
		
		// Wind shader setup (don't apply shader)
		//grass_shader = shd_grass_wind
		//u_time           = shader_get_uniform(grass_shader, "u_time")
		//u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
		//u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
		//u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
		
		//Change that with globals on the future
		//grass_wind_speed    = 2.2   // how fast it oscillates
		//grass_wind_strength = 3.5   // how many pixels the tip swings
		//grass_wind_scale    = 0.02  // spatial variance so waves ripple across the field
		
		
	#endregion
	#region vertex buffer
		gpu_set_ztestenable(true);
		gpu_set_alphatestenable(true);
		
		vertex_format_begin()
		vertex_format_add_position_3d();
		vertex_format_add_texcoord();   // real UV
		vertex_format_add_color();
		vertex_format_add_texcoord();   // wind data: x = sway weight, y = phase
		leaf_format = vertex_format_end();
		
		leaf_vertex_buffer = vertex_create_buffer();
		vertex_begin(leaf_vertex_buffer, leaf_format)
		repeat(leaft_count){
			var _x1 = irandom_range(bbox_left, bbox_right)
			var _y1 = irandom_range(bbox_top, bbox_bottom)
			var _x2 = _x1 + leaf_width;
			var _y2 = _y1 + leaf_height;
			var _depth = -_y1;
			var _frame = irandom(leaf_frames - 1)
			var _uvs = sprite_get_uvs(leaf_sprite, _frame);
			
			var _phase = random(1000); // unique per blade so they don't sync up
			
			// Triangle 1
			vertex_position_3d(leaf_vertex_buffer, _x1, _y1, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[0], _uvs[1])
			vertex_color(leaf_vertex_buffer, leaf_color, leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 1, _phase); // tip -> full sway
			
			vertex_position_3d(leaf_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(leaf_vertex_buffer, leaf_color, leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 1, _phase); // tip
			
			vertex_position_3d(leaf_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(leaf_vertex_buffer, leaf_color,leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 0, _phase); // base -> anchored
			
			// Triangle 2
			vertex_position_3d(leaf_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(leaf_vertex_buffer, leaf_color, leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 1, _phase); // tip
			
			vertex_position_3d(leaf_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(leaf_vertex_buffer, leaf_color, leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 0, _phase); // base
			
			vertex_position_3d(leaf_vertex_buffer, _x2, _y2, _depth);
			vertex_texcoord(leaf_vertex_buffer, _uvs[2], _uvs[3])
			vertex_color(leaf_vertex_buffer, grass_color, leaf_alpha);
			vertex_texcoord(leaf_vertex_buffer, 0, _phase); // base
		}
		vertex_end(leaf_vertex_buffer)
		vertex_freeze(leaf_vertex_buffer)
	#endregion 
#endregion


/*
#region grass
	#region general variables (For grass)
		grass_amount_multiplier = 2
		grass_sprite = spr_grass
		grass_frames = sprite_get_number(grass_sprite)
		grass_texture = sprite_get_texture(grass_sprite, 0)
		grass_width = sprite_get_width(grass_sprite)
		grass_height = sprite_get_height(grass_sprite)
		
		grass_count = image_xscale*image_yscale*grass_amount_multiplier
		grass_color = c_white
		grass_alpha = 1
		
		// Wind shader setup
		grass_shader = shd_grass_wind
		u_time           = shader_get_uniform(grass_shader, "u_time")
		u_windSpeed      = shader_get_uniform(grass_shader, "u_windSpeed")
		u_windStrength   = shader_get_uniform(grass_shader, "u_windStrength")
		u_windScale      = shader_get_uniform(grass_shader, "u_windScale")
		
		//Change that with globals on the future
		grass_wind_speed    = 2.2   // how fast it oscillates
		grass_wind_strength = 3.5   // how many pixels the tip swings
		grass_wind_scale    = 0.02  // spatial variance so waves ripple across the field
		
		
	#endregion
	#region vertex buffer
		gpu_set_ztestenable(true);
		gpu_set_alphatestenable(true);
		
		vertex_format_begin()
		vertex_format_add_position_3d();
		vertex_format_add_texcoord();   // real UV
		vertex_format_add_color();
		vertex_format_add_texcoord();   // wind data: x = sway weight, y = phase
		grass_format = vertex_format_end();
		
		grass_vertex_buffer = vertex_create_buffer();
		vertex_begin(grass_vertex_buffer, grass_format)
		repeat(grass_count){
			var _x1 = irandom_range(bbox_left, bbox_right)
			var _y1 = irandom_range(bbox_top, bbox_bottom)
			var _x2 = _x1 + grass_width;
			var _y2 = _y1 + grass_height;
			var _depth = -_y1;
			var _frame = irandom(grass_frames - 1)
			var _uvs = sprite_get_uvs(grass_sprite, _frame);
			
			var _phase = random(1000); // unique per blade so they don't sync up
			
			// Triangle 1
			vertex_position_3d(grass_vertex_buffer, _x1, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase); // tip -> full sway
			
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase); // tip
			
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase); // base -> anchored
			
			// Triangle 2
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 1, _phase); // tip
			
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase); // base
			
			vertex_position_3d(grass_vertex_buffer, _x2, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
			vertex_texcoord(grass_vertex_buffer, 0, _phase); // base
		}
		vertex_end(grass_vertex_buffer)
		vertex_freeze(grass_vertex_buffer) // still fine to freeze — shader animates it, not the data
	#endregion 
#endregion

/*
#region trees
	#region general variables
	tree_sprite = spr_tree
	tree_frames = sprite_get_number(tree_sprite)
	tree_texture = sprite_get_texture(tree_sprite, 0)

	tree_width = sprite_get_width(tree_sprite)
	tree_height = sprite_get_height(tree_sprite)

	tree_grass_count = floor(tree_width/4); // grass density 
	tree_color = c_white
	tree_alpha = 1 

	#endregion

	#region vertex buffer

	//3D
	gpu_set_ztestenable(true);
	gpu_set_alphatestenable(true);

	//Vertex Format
	vertex_format_begin()

	vertex_format_add_position_3d();
	vertex_format_add_texcoord();
	vertex_format_add_color();

	tree_format = vertex_format_end();

	tree_vertex_buffer = vertex_create_buffer();

	vertex_begin(tree_vertex_buffer, tree_format)

	repeat(tree_grass_count){
		var _x1 = irandom_range(bbox_left, bbox_right)
		var _y1 = irandom_range(bbox_top, bbox_bottom)
		var _x2 = _x1 + tree_width;
		var _y2 = _y1 + tree_height;

		var _depth = -_y2;

		//Texture coodinates
		var _frame = irandom(tree_frames -1)
		var _uvs = sprite_get_uvs(tree_sprite, _frame); 
	
		//Triangle 1
		vertex_position_3d(tree_vertex_buffer, _x1, _y1, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[0], _uvs[1])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);
	
		vertex_position_3d(tree_vertex_buffer, _x2, _y1, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[2], _uvs[1])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);	
	
		vertex_position_3d(tree_vertex_buffer, _x1, _y2, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[0], _uvs[3])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);
	
		//Triangle 2
	
		vertex_position_3d(tree_vertex_buffer, _x2, _y1, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[2], _uvs[1])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);
	
		vertex_position_3d(tree_vertex_buffer, _x1, _y2, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[0], _uvs[3])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);	
	
		vertex_position_3d(tree_vertex_buffer, _x2, _y2, _depth);
		vertex_texcoord(tree_vertex_buffer, _uvs[2], _uvs[3])
		vertex_color(tree_vertex_buffer, tree_color, tree_alpha);
	
	}

	vertex_end(tree_vertex_buffer)
	vertex_freeze(tree_vertex_buffer) //Since we dont need to change we freeze it

	#endregion 
#endregion 

*/
//This list has the regions that we want to submit (exclude or add a region here for change)
list_of_drawable_buffers = [
	/*{	
		name:"leafs",
		buffer:leaf_vertex_buffer,
		texture:leaf_texture,
		format:leaf_format,
		uses_shader:false
	},
	*/
	//{	
	//	name:"mushrooms",
	//	buffer:mushroom_vertex_buffer,
	//	texture:mushroom_texture,
	//	format:mushroom_format,
	//	uses_shader:false
	//},
	{	
		name:"grass",
		buffer:grass_vertex_buffer,
		texture:grass_texture,
		format:grass_format,
		uses_shader:true
	}
	
/*	,
	{
		name:"tree",
		buffer:tree_vertex_buffer,
		texture:tree_texture,
		format:tree_format
	}
*/
]