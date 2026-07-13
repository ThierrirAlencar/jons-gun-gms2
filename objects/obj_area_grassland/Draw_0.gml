/// @description submit the buffers

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(1); // tweak if your sprite has semi-transparent pixels you want to keep

//Submits only the buffers added to the list, wich allows us to remove a certain buffer from the list if we need. 
for(var _i=0; _i<array_length(list_of_drawable_buffers);_i++){
	//If on debug draws the name of the allowed buffer
	if(global.config_debug){draw_text(x,y+(_i*6),list_of_drawable_buffers[_i].name)}
	
	if(list_of_drawable_buffers[_i].uses_shader){
		shader_set(grass_shader);
			shader_set_uniform_f(u_time, current_time / 1000);
			shader_set_uniform_f(u_windSpeed, grass_wind_speed);
			shader_set_uniform_f(u_windStrength, grass_wind_strength);
			shader_set_uniform_f(u_windScale, grass_wind_scale);
			
			vertex_submit(
				list_of_drawable_buffers[_i].buffer, 
				pr_trianglelist, 
				list_of_drawable_buffers[_i].texture
			);
		shader_reset();
	}else{
			vertex_submit(
				list_of_drawable_buffers[_i].buffer, 
				pr_trianglelist, 
				list_of_drawable_buffers[_i].texture
			);
	}
}
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_alphatestenable(false)

if(global.config_debug){
	draw_self();
}