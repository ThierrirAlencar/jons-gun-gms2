
if(global.game){
	if(surface_exists(global.ambient_surface_light)){
		if(fluctuate){
			float_timer += float_speed;
			depth = -y
			radious_change -= sin(float_timer) * float_amplitude;
		}
		//Seta o target para  a surface que estamos usando
		surface_set_target(global.ambient_surface_light);
		
		gpu_set_blendmode(bm_subtract)
		//Draw Core Ligth
		draw_set_alpha(1)
	
		if(attatched_to){
			if(instance_exists(attatched_to)){
				var _x = attatched_to.x;
				var _y = attatched_to.y;
				draw_circle(_x,_y,core_light_radius+radious_change,false);
			
				draw_set_alpha(.6)
			
				draw_circle(_x,_y,secondary_light_radious+radious_change,false);
			}else
			{
				attatched_to = noone;
			}
		}else
		{
			draw_circle(x,y,core_light_radius+radious_change,false);
		}
	
		//Draw Secondary light
		//draw_set_alpha(secondary_light_radious)
		//draw_circle(x,y,secondary_light_radious+radious_change,false);
	
	
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal)
		//Reseta o draw para a surface padrão
		surface_reset_target();
	}
}