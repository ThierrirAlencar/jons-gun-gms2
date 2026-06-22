
#region grass
	#region general variables (For grass)
		grass_amount_multiplier = 10
		grass_sprite = spr_grass
		grass_frames = sprite_get_number(grass_sprite)
		grass_texture = sprite_get_texture(grass_sprite, 0)

		grass_width = sprite_get_width(grass_sprite)
		grass_height = sprite_get_height(grass_sprite)
		
		
		grass_count = image_xscale*image_yscale*grass_amount_multiplier // grass density 
		grass_color = c_white
		grass_alpha = 1 

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

		grass_format = vertex_format_end();

		grass_vertex_buffer = vertex_create_buffer();

		vertex_begin(grass_vertex_buffer, grass_format)

		repeat(grass_count){
			var _x1 = irandom_range(bbox_left, bbox_right)
			var _y1 = irandom_range(bbox_top, bbox_bottom)
			var _x2 = _x1 + grass_width;
			var _y2 = _y1 + grass_height;

			var _depth = -_y1;

			//Texture coodinates
			var _frame = irandom(grass_frames -1)
			var _uvs = sprite_get_uvs(grass_sprite, _frame); 
	
			//Triangle 1
			vertex_position_3d(grass_vertex_buffer, _x1, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
	
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);	
	
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
	
			//Triangle 2
	
			vertex_position_3d(grass_vertex_buffer, _x2, _y1, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[1])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
	
			vertex_position_3d(grass_vertex_buffer, _x1, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[0], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);	
	
			vertex_position_3d(grass_vertex_buffer, _x2, _y2, _depth);
			vertex_texcoord(grass_vertex_buffer, _uvs[2], _uvs[3])
			vertex_color(grass_vertex_buffer, grass_color, grass_alpha);
	
		}

		vertex_end(grass_vertex_buffer)
		vertex_freeze(grass_vertex_buffer) //Since we dont need to change we freeze it

	#endregion 
#endregion

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

//This list has the regions that we want to submit (exclude or add a region here for change)
list_of_drawable_buffers = [
	{	
		name:"grass",
		buffer:grass_vertex_buffer,
		texture:grass_texture,
		format:grass_format
	},
	{
		name:"tree",
		buffer:tree_vertex_buffer,
		texture:tree_texture,
		format:tree_format
	}
]