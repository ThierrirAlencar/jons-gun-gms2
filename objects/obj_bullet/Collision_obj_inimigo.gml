// Efeito de fagulha ao acertar a parede

if(current_alegiance == bullet_alegiance.player){
	var _smoke_amount = random_range(2,4)

	repeat (_smoke_amount) {
	    var _a = instance_create_depth(x, y, depth - 2, obj_particle);
    
	    _a.alarm[0] = irandom_range(20, 30); // Tempo de vida aleatório
	    _a.direction = direction + 160 + random_range(-40, 40); // Direção variável para maior dispersão
	    _a.speed = random_range(1, 2); // Velocidade aleatória
		_a.speedDecay = random_range(0.05, 0.1);
	    _a.image_speed = random_range(0.5, 1.5); // Velocidade de animação variável
	    _a.image_angle = _a.direction; // Ajustando ângulo da fagulha
	    _a.image_xscale = random_range(1, 2)// Pequena variação no tamanho
	    _a.image_yscale = _a.image_xscale; // Mantendo a proporção
		_a.image_blend = choose(c_gray,c_ltgray,c_ltgrey)
	    _a.sprite_index = spr_whiteParticle;
	}
	last_hit = other; //Defines the enemy as the last hit
	// Destroi a bala
	instance_destroy();
}

