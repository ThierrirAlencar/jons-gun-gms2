/// @description clears every buffer and format


//Clears grass buffer
for(var _i=0; _i<array_length(list_of_drawable_buffers);_i++){
	vertex_delete_buffer(list_of_drawable_buffers[_i].buffer);
	vertex_format_delete(list_of_drawable_buffers[_i].format);
}
shader_reset();

//Clears tree buffer
//vertex_delete_buffer(tree_vertex_buffer)
//vertex_format_delete(tree_format)
