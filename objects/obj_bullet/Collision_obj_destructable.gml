
// Destroi a bala ou recocheteia 
if(properties.collide_with_walls and can_hit_objects and other.can_hold_a_bullet){
	if(properties.bounciness<=0){
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