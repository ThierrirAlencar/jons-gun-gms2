//Should be used on a create event
function scr_shire_pickup_setup(){
	shine_shader   = shd_pickup_shine;
	u_time         = shader_get_uniform(shine_shader, "u_time");
	u_uvRect       = shader_get_uniform(shine_shader, "u_uvRect");
	u_spriteSize   = shader_get_uniform(shine_shader, "u_spriteSize");
	u_interval     = shader_get_uniform(shine_shader, "u_interval");
	u_sweepWidth   = shader_get_uniform(shine_shader, "u_sweepWidth");
	u_sweepAngle   = shader_get_uniform(shine_shader, "u_sweepAngle");
	u_stepSpeed    = shader_get_uniform(shine_shader, "u_stepSpeed");

	shine_interval = 1.4; //Time interval
	shine_width    = 3.0;   // in pixels now, not 0-1 fraction
	shine_angle    = 0.6;
	shine_step     = 14;    // discrete steps per second — lower = chunkier/more retro

	shine_offset   = random(shine_interval);
}

//Should be used on a draw event
function scr_shire_pickup_draw(){
	var _uvs = sprite_get_uvs(sprite_index, image_index);
	var _spr_w = sprite_get_width(sprite_index);
	var _spr_h = sprite_get_height(sprite_index);

	shader_set(shine_shader);
	    shader_set_uniform_f(u_time, current_time/1000 + shine_offset);
	    shader_set_uniform_f(u_uvRect, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
	    shader_set_uniform_f(u_spriteSize, _spr_w, _spr_h);
	    shader_set_uniform_f(u_interval, shine_interval);
	    shader_set_uniform_f(u_sweepWidth, shine_width);
	    shader_set_uniform_f(u_sweepAngle, shine_angle);
	    shader_set_uniform_f(u_stepSpeed, shine_step);
	    draw_self();
	shader_reset();
}	
