function scr_bullet_effects(){

}

function scr_whater_splash_effect(quantity){
		repeat(quantity){
			var _a = instance_create_depth(x+random_range(-10,10),y+8+random_range(0,5),depth,obj_particle);
			_a.image_speed = 0;
			_a.sprite_index = spr_whiteParticle;
			_a.image_index = 1;
			_a.image_xscale = .6;
			_a.image_yscale = .6;
			_a.speed = random_range(0.5,1.5)
			_a.image_blend = choose(c_white,make_color_rgb(0,157,255));
			_a.direction = random(360);
			_a.alarm[0] = 20
	}
}

function scr_magic_explosion_effect(quantity){
		repeat(quantity){
			var _a = instance_create_depth(x+random_range(-10,10),y+8+random_range(0,5),depth,obj_particle);
			_a.image_speed = 0;
			_a.sprite_index = spr_whiteParticle;
			_a.image_index = 1;
			_a.image_xscale = .8;
			_a.image_yscale = .8;
			_a.speed = random_range(0.5,1.5)
			_a.image_blend = choose(c_white,make_color_rgb(102,45,145));
			_a.direction = random(360);
			_a.alarm[0] = 10
	}
}

function scr_iron_destruction_ricochet(_amount){
	//Particula de detrito de bala
	repeat (_amount) {
	    var _a = instance_create_depth(x + lengthdir_x(4,other.direction+180), y+ lengthdir_y(4,other.direction+180), depth - 1, obj_particle);
	
	    _a.alarm[0] = irandom_range(6, 8); // Tempo de vida aleatório
	    _a.direction = random(360) //direction + 160 + random_range(-40, 40); // Direção variável para maior dispersão
	    _a.speed = random_range(3.5, 5.5); // Velocidade aleatória
	    _a.image_speed =0; // Velocidade de animação variável
	    _a.image_angle = _a.direction; // Ajustando ângulo da fagulha
	    _a.image_xscale = random_range(0.8, 1.2); // Pequena variação no tamanho
	    _a.image_yscale = _a.image_xscale; // Mantendo a proporção

	    _a.sprite_index = spr_bullet_spark;
	}
}

function scr_material_destruction_debris(_amount, wall_colour = c_white){
	var _debri_amount = random_range(4,_amount*2)

	repeat (_debri_amount) {
		
		var _x = x+random_range(-16,16)
	    var _y = y+random_range(-16,16)
		var _a = instance_create_depth(_x,_y, 99, obj_fixed_remain);
		_a.alpha_decay = 0.00001 //decay muito pequeno;
		_a.angle_variation = [-random(8),random(8)];
		_a.image_speed = 0;
	    _a.direction = direction + 160 + random_range(-40, 40); // Direção variável para maior dispersão
		_a.speed = random_range(3,9);
		_a.sprite_index = spr_wall_debris;
		_a.image_index = random(_a.image_number);
		_a.speed_decay = 0.1 //Variação de velocidade
		_a.image_blend = wall_colour
	}
}

function scr_material_destruction_smoke(_amount,_p_speed,_p_speed_decay,_scale,_direction){
	// Efeito de fagulha ao acertar a parede
	//var _amount = 3 // Aumentando a variação na quantidade
	var _smoke_amount = random_range(8,_amount*5)

	repeat (_smoke_amount) {
	    var _a = instance_create_depth(x, y, depth + 20, obj_particle);
    
	    //_a.alarm[0] = irandom_range(20, 30); // Tempo de vida aleatório
	    _a.direction = direction + 160 + random_range(_direction[0],_direction[1])//; // Direção variável para maior dispersão
	    _a.speed = _p_speed;  // Velocidade aleatória
		//_a.alarm[0] = random_range(10,20)
		_a.alphaDecay = random_range(0.01,0.1);
		_a.alarm[0] = 30;
		_a.speedDecay = random_range(_p_speed_decay[0], _p_speed_decay[1]);
		_a.image_speed = 0 //random_range(0.5, 1.5); // Velocidade de animação variável
	    _a.image_angle = _a.direction; // Ajustando ângulo da fagulha
	    _a.image_xscale = _scale;// Pequena variação no tamanho
	    _a.image_yscale = _a.image_xscale; // Mantendo a proporção
		_a.image_blend = make_colour_rgb(238,195,154);
	    _a.sprite_index = spr_whiteParticle;
	}


	
}