/// @description submit the buffers

//Submits only the buffers added to the list, wich allows us to remove a certain buffer from the list if we need. 
for(var _i=0; _i<array_length(list_of_drawable_buffers);_i++){
	//If on debug draws the name of the allowed buffer
	if(global.config_debug){draw_text(x,y+(_i*6),list_of_drawable_buffers[_i].name)}
	vertex_submit(
		list_of_drawable_buffers[_i].buffer, 
		pr_trianglelist, 
		list_of_drawable_buffers[_i].texture
	);
}
