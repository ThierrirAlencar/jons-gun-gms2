function scr_animacaoDeBalanco(timer,magnitude){
	// Animação de balanço
	var _a = timer
	var _b = magnitude
	//valor 1 = tempo de variação (do fim ao inicio) quanto maior menor a duração
	//valor 2  = potencia de variação (quanto maior maior será a animação)
	image_angle = sin(current_time * _a) * magnitude; // Oscilação suave ao andar
}