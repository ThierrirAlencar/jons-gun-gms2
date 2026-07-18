if (hsp != 0 || vsp != 0) {
	//valor 1 = tempo de variação (do fim ao inicio) quanto maior menor a duração
	//valor 2  = potencia de variação (quanto maior maior será a animação)
    //image_angle = sin(current_time * 0.015) * 10; // Oscilação suave ao andar
	if(sprite_index!=spr_char_rave_walk){
		sprite_index = spr_char_rave_walk;
	}
} else {
    image_angle = 0; // Resetar ao parar
	if(sprite_index!=spr_char_rave_idle){
			sprite_index = spr_char_rave_idle;
	}
}
alarm[4] = 5