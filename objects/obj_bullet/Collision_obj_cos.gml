if(current_material == material.iron){
	// Efeito de fagulha ao acertar a parede
	var _amount = 3 // Aumentando a variação na quantidade

	repeat (_amount) {
	    var _a = instance_create_depth(x + lengthdir_x(4,other.direction+180), y+ lengthdir_y(4,other.direction+180), depth - 1, obj_particle);
    
	    _a.alarm[0] = irandom_range(6, 8); // Tempo de vida aleatório
	    _a.direction = direction + 160 + random_range(-40, 40); // Direção variável para maior dispersão
	    _a.speed = random_range(3.5, 5.5); // Velocidade aleatória
	    _a.image_speed =0; // Velocidade de animação variável
	    _a.image_angle = _a.direction; // Ajustando ângulo da fagulha
	    _a.image_xscale = random_range(0.8, 1.2); // Pequena variação no tamanho
	    _a.image_yscale = _a.image_xscale; // Mantendo a proporção

	    _a.sprite_index = spr_bullet_spark;
	}

	var _smoke_amount = random_range(8,15)

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
}

// Destroi a bala
if(properties.collide_with_walls){
	instance_destroy();
}