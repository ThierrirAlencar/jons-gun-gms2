

speed_decay = 0 //from infinitly 
alpha_decay = 0 // 0 = infinite 
angle_variation = [0,0] //Two random values
alarm[0] = 0 //No alarm set

water_shader = shd_whater_reflection;
u_reflectionTex = shader_get_sampler_index(water_shader, "u_reflectionTex");
u_time          = shader_get_uniform(water_shader, "u_time");
u_waveSpeed     = shader_get_uniform(water_shader, "u_waveSpeed");
u_waveStrength  = shader_get_uniform(water_shader, "u_waveStrength");
u_waveScale     = shader_get_uniform(water_shader, "u_waveScale");
u_pixelSize     = shader_get_uniform(water_shader, "u_pixelSize");
u_waterColor    = shader_get_uniform(water_shader, "u_waterColor");
u_waterMix      = shader_get_uniform(water_shader, "u_waterMix");

// Tuning
water_wave_speed    = 0.6;
water_wave_strength = 0.015;
water_wave_scale    = 8;
water_pixel_size    = 64;   // match to your sprite resolution -- lower = chunkier pixel ripples
water_color         = [0.1, 0.25, 0.3, 0.75]; // dark teal, semi-transparent
water_mix           = 0.35; // how much flat tint vs pure reflection

// Surface that holds whatever is "above" the water, to be reflected
reflection_surface = -1;