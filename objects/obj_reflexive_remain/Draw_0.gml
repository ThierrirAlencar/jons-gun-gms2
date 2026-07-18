// Recreate the surface if it's lost (common after alt-tab or GPU reset)
if(!surface_exists(reflection_surface)){
    reflection_surface = surface_create(sprite_width, sprite_height);
}

surface_set_target(reflection_surface);
    draw_clear_alpha(c_black, 0); // transparent background
    
    // Draw only the strip of world that sits directly above this water tile,
    // offset so it lines up with this object's local sprite space
    draw_sprite_part(spr_player, 0, 0, 0, sprite_width, sprite_height, 0, -sprite_height);
    
    // In practice you likely want to redraw actual instances (trees, player, etc.)
    // that are near the water rather than a static sprite -- see note below.
surface_reset_target();

shader_set(water_shader);
    texture_set_stage(u_reflectionTex, surface_get_texture(reflection_surface));
    shader_set_uniform_f(u_time, current_time/1000);
    shader_set_uniform_f(u_waveSpeed, water_wave_speed);
    shader_set_uniform_f(u_waveStrength, water_wave_strength);
    shader_set_uniform_f(u_waveScale, water_wave_scale);
    shader_set_uniform_f(u_pixelSize, water_pixel_size);
    shader_set_uniform_f(u_waterColor, water_color[0], water_color[1], water_color[2], water_color[3]);
    shader_set_uniform_f(u_waterMix, water_mix);
    draw_self();
shader_reset();