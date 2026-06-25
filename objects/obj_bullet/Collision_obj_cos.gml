
// Destroi a bala ou recocheteia 
if(properties.collide_with_walls and can_hit_objects){
	if(properties.bounciness<=0){

		if(current_material == material.iron){
			var _wall = other;	
			var _direction = direction + 160 + random_range(-40, 40)
			scr_iron_destruction_ricochet(random_range(3,6));
			scr_material_destruction_debris(random_range(3,6));
			scr_material_destruction_smoke(random_range(4,12), random_range(1,2), [0.05,0.1],random(2),[-40,40]);
			
		}
		
		if(current_material == material.wather){
						scr_material_destruction_debris(random_range(2,4));
						scr_whater_splash_effect(random_range(6,20))
		}
		last_hit = other; //Defines the wall as the last hit
		instance_destroy()
	}else{
		direction=direction+180+random_range(-16,16) // ricocheteia para trás
		speed -= properties.bounciness_speed_reduction;
		speed_variation -= properties.bounciness_speed_reduction //Redução de velocidade parcial//
		can_hit_objects = false;
		alarm[1] = 10 //Resetar o hit de objetos
	}
}