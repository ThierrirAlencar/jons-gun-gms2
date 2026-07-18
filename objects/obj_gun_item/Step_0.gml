

function create_bullet_debri(b_m = material.iron){
	var _a = instance_create_depth(x+lengthdir_x(22,image_angle), y+lengthdir_y(20,image_angle), depth, obj_fixed_remain);
	_a.direction =  90 + random_range(-8,8);
	_a.speed = random_range(2,3);
	_a.speed_decay = random_range(-0.1,-0.05);
	_a.minimun_barrier = random(3)*-1;
	_a.alpha_decay = 0.00001;
	_a.angle_variation = [-5,-5]
	_a.sprite_index = spr_bullets_remains_iron;
	_a.image_speed = 0;
	_a.image_index = irandom(sprite_get_number(_a.sprite_index)-1);
	_a.image_angle = random(360);
	_a.image_xscale = choose(1,-1);
	_a.image_yscale = choose(1,-1);
}


//Anything happens when those things are true
if(global.game and !global.pause_menu){


#region guns_functions
function shotgun(target_x,traget_y,trigger){
		y = current_parent.y + 6;
		x = current_parent.x + (6 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		// Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);
		multiplicador = global.gun_data_list[current_type].bulletCount;
		
		if (trigger and can_shoot == true) {
			var _cooldown = global.gun_data_list[current_type].cooldown
			for (var _l = 0; _l < multiplicador; _l++) {
				var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
				_a.direction = image_angle - (4*(multiplicador/2)) + (_l * 4);
				_a.image_angle = image_angle;
				_a.image_index = 2 //Use shell image
				_a.speed = global.gun_data_list[current_type].bullet_speed;
				_a.damage = global.gun_data_list[current_type].bullet_damage;
				_a.properties.bounciness = 2 //Pode Ricochetear duas vezes na parede;
				_a.properties.bounciness_speed_reduction = 0.25 //Reduz em 0.5 a velocidade ao ricochetear
				_a.properties.draw_halo = true;
				_a.properties.halo_color = c_red; 
				
				
				if(current_state == item_state.onenemy){
					_a.current_alegiance = bullet_alegiance.enemy
					_cooldown*=2
					_a.speed=2.5
				}else{
					_a.current_alegiance = bullet_alegiance.player
				}
			}

			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force, recoil_dir);
			recoil_y = lengthdir_y(recoil_force, recoil_dir);
			recoil_timer = recoil_duration*4; // Inicia o timer
			
			//efeito de explosão ao tiro
			_b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 10
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,177,0);
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		
		//Animação de ScreenShake
		if(instance_exists(obj_camera)){
			var _cam = instance_nearest(x,y,obj_camera)
			_cam.shake.start(8,30) //Animação de screenshake usando a classe shaker
		}
		

		
}
function sword(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		
		y = current_parent.y + 6;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot = true) {
			is_meelee = true
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle;
			recoil_x = lengthdir_x(recoil_force*10, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*10, recoil_dir);
			recoil_timer = recoil_duration*2; // Inicia o timer
			
			can_shoot = false
			alarm[0] = shooting_cooldown
				
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function uzi(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		
		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-16,16) //Inprecisão da arma
			_a.image_angle = point_direction(x, y, target_x, traget_y);
			_a.properties.bounciness = 2 //Pode Ricochetear duas vezes na parede;
			_a.properties.bounciness_speed_reduction = random_range(2.0,3.0)//Reduz em 0.5 a velocidade ao ricochetear
			_a.properties.draw_halo = true;
			_a.properties.halo_color = make_color_rgb(255,177,0);
			
			if(target_x>x){
				_a.image_yscale = 0.7;
			}else{
				_a.image_yscale = -0.7;
			}
			
			_a.image_blend = make_color_rgb(255,177,0);
			_a.image_index = 3 // bullet image 
			_a.damage = dmg;
			var _cooldown = 5
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=3
				_a.speed = 3;
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = 20;
			}
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force, recoil_dir);
			recoil_y = lengthdir_y(recoil_force, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 5
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,177,0);
			
			create_bullet_debri()
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		

		
}
function crabhand(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 2;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;



		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {

			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle;
			recoil_x = lengthdir_x(recoil_force*11, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*11, recoil_dir);
			recoil_timer = recoil_duration*2; // Inicia o timer
			
			var _cooldown = global.gun_data_list[current_type].cooldown
			for (var _l = 0; _l < multiplicador; _l++) {
				var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
				_a.direction = image_angle - 16 + (_l * 8);
				_a.image_angle = image_angle;
				_a.image_index = 4
				_a.properties.explosive = true
				_a.properties.explosion_radius = 16
				_a.rotation = 4
				_a.direction_uncontroled_variation = [12,12]
				_a.current_material = material.wather
				_a.speed = global.gun_data_list[current_type].bullet_speed;
				_a.damage = global.gun_data_list[current_type].bullet_damage;
				_a.properties.draw_halo = true;
				_a.properties.halo_color = c_blue;
				_a.properties.has_particle_function = true; //Define que serão geradas partículas
				_a.properties.particle_generation_timeout = 1; //Tempo para gerar particula 
				_a.particle_function = scr_whater_splash_effect 
				
				if(current_state == item_state.onenemy){
					_a.current_alegiance = bullet_alegiance.enemy
					_cooldown*=2
					_a.speed=2.5
				}else{
					_a.current_alegiance = bullet_alegiance.player
				}
			}

			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false
		
			//efeito de explosão ao tiro
			_b = instance_create_depth(x+lengthdir_x(32,image_angle), y+lengthdir_y(32,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 10
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = c_aqua
			with(_b){
				scr_whater_splash_effect(random_range(16,20))
			}
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function frogun(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 2;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot) {
			image_index = 1
			
			//Config da bala
			var _a = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-16,16) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.speed = random_range(3.0,4.5);
			_a.damage = dmg;
			_a.image_index = 1 //buble sprite
			_a.speed_variation = random_range(0.04,0.05)*-1
			_a.current_material = material.wather
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
			}else{
				_a.current_alegiance = bullet_alegiance.player
			}
			
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle+180;
			recoil_x = lengthdir_x(recoil_force*2, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*2, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Cooldown de tiro
			alarm[0] = shooting_cooldown
			can_shoot = false 
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_speed = 1;
			_b.image_xscale = .5;
			_b.image_yscale = .5;
			_b.image_blend = make_color_rgb(41,173,255)
			with(_b){
				scr_whater_splash_effect(random_range(16,20))
			}
		}

		if(mouse_check_button(mb_left)){
			image_index = 1
		}else{
			image_index = 0
		}
		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function anubis_wand(target_x,traget_y,trigger){
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 2;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot) {
			image_index = 1
			
			//Config da bala
			var _a = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-4,4) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.sprite_index = spr_bullet
			_a.damage = dmg;
			_a.image_index = 1 //buble sprite
			_a.image_blend = c_purple
			_a.particle_emiter = "as"
			_a.speed_variation = -0.02
			_a.current_material = material.magic; //Define o material do projetil;
			
			
			var _cooldown = global.gun_data_list[current_type].cooldown
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_a.speed = global.gun_data_list[current_type].bullet_speed*.9
				_a.speed_variation =-0.001
				_cooldown*=3
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = global.gun_data_list[current_type].bullet_speed
			}
			
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle+180;
			recoil_x = lengthdir_x(recoil_force*2, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*2, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false 
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_speed = 1;
			_b.image_xscale = .5;
			_b.image_yscale = .5;
			_b.image_blend = c_purple
		}
		
		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function oxford(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		
		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-10,10) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.image_yscale = 0.6;
			_a.image_xscale = 1.2
			_a.image_blend = make_color_rgb(255,177,0);
			_a.damage = dmg;
			var _cooldown = shooting_cooldown
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=3
				_a.speed = global.gun_data_list[current_type].bullet_speed;
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = 20;
			}
			//Cooldown de tiro
			alarm[0] = global.gun_data_list[current_type].cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force*3, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*3, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 5
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,177,0);
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		

		
}
function hardM(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(22,image_angle), y+lengthdir_y(22,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-10,10) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.image_yscale = 0.6;
			_a.image_xscale = 1.2
			_a.image_blend = make_color_rgb(255,177,0);
			_a.damage = dmg;
			var _cooldown = shooting_cooldown
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=3
				_a.speed = global.gun_data_list[current_type].bullet_speed;
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = 20;
			}
			//Cooldown de tiro
			alarm[0] = global.gun_data_list[current_type].cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force*5, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*5, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			with(_a){
				//Particula de tiro
				var _b = instance_create_depth(x, y, depth-2, obj_particle);
				_b.sprite_index = spr_explosion_effect
				_b.image_xscale = .5;
				_b.image_speed = 0;
				_b.alarm[0] = 5
				_b.image_angle = image_angle+180
				_b.image_yscale = .5;
				_b.image_blend = make_color_rgb(255,177,0);
			}
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		

		
}
function auto_pulse_rifle(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		
		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-10,10) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.image_yscale = .2;
			_a.image_xscale = 1.5
			_a.image_blend = make_color_rgb(255,0,77);
			_a.image_alpha = 1;
			_a.damage = dmg;
			_a.properties.collide_with_walls = false; //Não colide com paredes
			var _cooldown = shooting_cooldown
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=4
				_a.speed = global.gun_data_list[current_type].bullet_speed/2;
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = global.gun_data_list[current_type].bullet_speed;
			}
			//Cooldown de tiro
			alarm[0] = global.gun_data_list[current_type].cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force*3, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*3, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 5
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,0,77);
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		

		
}
function m4o4(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage

		
		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-6,6) //Inprecisão da arma
			_a.image_angle = point_direction(x, y, target_x, traget_y);
			_a.properties.bounciness = 0
			_a.properties.draw_halo = true;
			_a.properties.halo_color = make_color_rgb(255,177,0);
			_a.damage = dmg
			
			if(target_x>x){
				_a.image_yscale = 0.7;
			}else{
				_a.image_yscale = -0.7;
			}
			
			_a.image_blend = make_color_rgb(255,177,0);
			_a.image_index = 3 // bullet image 
			_a.properties.damage = dmg;
			var _cooldown = 4
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=3
				_a.speed = 3;
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = 20;
			}
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force, recoil_dir);
			recoil_y = lengthdir_y(recoil_force, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 5
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,177,0);
			
			create_bullet_debri()
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
			
}
function firethrower(target_x,traget_y,trigger){
	
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 6;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot) {
			image_index = 1
			
			//Config da bala
			var _a = instance_create_depth(x+lengthdir_x(16,image_angle)+random_range(-4,4), y+lengthdir_y(16,image_angle)+random_range(-4,4), depth, obj_bullet);
			_a.direction = image_angle+random_range(-10,10) //Inprecisão da arma
			_a.image_angle = random(360);
			_a.speed = 6;
			_a.image_speed = choose(.7,.8,.9)
			_a.sprite_index = spr_fire_particle;
			_a.damage = dmg;
			_a.image_index = 0;
			_a.speed_variation = random_range(0.04,0.05)*-1
			_a.current_material = material.fiire
			_a.ligth_radious = 32
			_a.image_xscale = 1 * random_range(1,1.75)
			_a.image_yscale = 1 * random_range(1,1.75)
			
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_a.speed = 3
			}else{
				_a.current_alegiance = bullet_alegiance.player
			}
			
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle+180;
			recoil_x = lengthdir_x(recoil_force*2, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*2, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Cooldown de tiro
			//alarm[0] = 1
			//can_shoot = false 
			
			//Particula de tiro
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_speed = 1;
			_b.image_xscale = .5;
			_b.image_yscale = .5;
			_b.image_blend = c_white
			with(_b){

			}
		}

		if(mouse_check_button(mb_left)){
			image_index = 1
		}else{
			image_index = 0
		}
		
		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function deers_wand(target_x,traget_y,trigger){
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 6;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot) {
			image_index = 1
			
			//Config da bala
			var _a = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-4,4) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.sprite_index = spr_bullet
			_a.damage = dmg;
			_a.image_index = 1 //buble sprite
			_a.image_blend = c_purple
			_a.particle_emiter = "as"
			_a.speed_variation = -0.02
			_a.current_material = material.magic; //Define o material do projetil;
			
			
			var _cooldown = global.gun_data_list[current_type].cooldown
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_a.speed = global.gun_data_list[current_type].bullet_speed*.5
				_a.speed_variation =-0.001
				_cooldown*=3
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = global.gun_data_list[current_type].bullet_speed
			}
			
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle+180;
			recoil_x = lengthdir_x(recoil_force*2, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*2, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false 
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_speed = 1;
			_b.image_xscale = .5;
			_b.image_yscale = .5;
			_b.image_blend = c_purple
		}
		
		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function eagles_colt(target_x,traget_y,trigger){
		dmg = global.gun_data_list[current_type].bullet_damage
		y = current_parent.y + 6;
		x = current_parent.x + (4 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth -1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot==true) {
			image_index = 1
			
			//Config da bala
			var _a = instance_create_depth(x+lengthdir_x(22,image_angle), y+lengthdir_y(20,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-4,4) //Inprecisão da arma
			_a.image_angle = image_angle;
			_a.sprite_index = spr_bullet
			_a.damage = dmg;
			_a.image_xscale = 1.8;
			_a.image_yscale = .75
			_a.image_index = 0 
			_a.current_material = material.iron; //Define o material do projetil;
			_a.image_blend = c_yellow
			_a.speed_variation = - 0.01
			var _cooldown = 15//global.gun_data_list[current_type].cooldown;
			
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_a.speed = global.gun_data_list[current_type].bullet_speed*.5
				_a.speed_variation =-0.001
				_cooldown*=3
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = global.gun_data_list[current_type].bullet_speed
			}
			
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle+180;
			recoil_x = lengthdir_x(recoil_force*2, recoil_dir);
			recoil_y = lengthdir_y(recoil_force*2, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false 
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_speed = 1;
			_b.image_xscale = .5;
			_b.image_yscale = .5;
			_b.image_blend = c_yellow
			
			create_bullet_debri()
		}
		

		
		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
}
function ak47(target_x,traget_y,trigger){
		shooting_cooldown = global.gun_data_list[current_type].cooldown
		dmg = global.gun_data_list[current_type].bullet_damage
		var _spd = global.gun_data_list[current_type].bullet_speed
		
		y = current_parent.y + 5;
		x = current_parent.x + (8 * current_parent.image_xscale);
		image_yscale = current_parent.image_xscale;

		depth = current_parent.depth - 1; // Sempre estará acima do jogador

		image_angle = point_direction(x, y, target_x, traget_y);

		if (trigger and can_shoot == true) {
			var _a = instance_create_depth(x+lengthdir_x(10,image_angle), y+lengthdir_y(10,image_angle), depth, obj_bullet);
			_a.direction = image_angle+random_range(-2,2) //Inprecisão da arma
			_a.image_angle = point_direction(x, y, target_x, traget_y);
			_a.image_xscale = 1.5
			_a.image_yscale = .5;
			_a.ligth_radious = 16;
			_a.properties.bounciness = 1 //Pode Ricochetear duas vezes na parede;
			_a.properties.bounciness_speed_reduction = random_range(5.0,12.0)//Reduz em 0.5 a velocidade ao ricochetear
			_a.properties.draw_halo = true;
			_a.properties.halo_color = make_color_rgb(255,177,0);
			
			
			if(target_x>x){
				_a.image_yscale = _a.image_yscale;
			}else{
				_a.image_yscale = -_a.image_yscale;
			}
			
			_a.image_blend = make_color_rgb(255,177,0);
			_a.image_index = 3 // bullet image 
			_a.damage = dmg;
			var _cooldown = 5
			if(current_state == item_state.onenemy){
				_a.current_alegiance = bullet_alegiance.enemy
				_cooldown*=3
				_a.speed = floor(_spd/5);
			}else{
				_a.current_alegiance = bullet_alegiance.player
				_a.speed = _spd;
			}
			//Cooldown de tiro
			alarm[0] = _cooldown
			can_shoot = false
			
			// Calcula o deslocamento do recuo
			var recoil_dir = image_angle + 180;
			recoil_x = lengthdir_x(recoil_force, recoil_dir);
			recoil_y = lengthdir_y(recoil_force, recoil_dir);
			recoil_timer = recoil_duration; // Inicia o timer
			
			//Particula de tiro
			
			var _b = instance_create_depth(x+lengthdir_x(16,image_angle), y+lengthdir_y(16,image_angle), depth-2, obj_particle);
			_b.sprite_index = spr_explosion_effect
			_b.image_xscale = .4;
			_b.image_speed = 0;
			_b.alarm[0] = 5
			_b.image_angle = image_angle+180
			_b.image_yscale = .4;
			_b.image_blend = make_color_rgb(255,177,0);
		}

		// Animação do recuo
		if (recoil_timer > 0) {
			recoil_timer--;
			x += recoil_x * (recoil_timer / recoil_duration);
			y += recoil_y * (recoil_timer / recoil_duration);
		}
		

		
}
#endregion

#region states_effects

switch(current_state){
	case item_state.onground:
		visible = true
		image_xscale = 1
		// Animação de flutuar
		float_timer += float_speed;
		depth = -y
		y -= sin(float_timer) * float_amplitude;
		image_angle += sin(float_timer-80) * float_amplitude*2; // Rotação leve para dar mais vida
		
		
		if(distance_to_object(obj_player)<16 and keyboard_check_pressed(ord("E")) and instance_exists(obj_inventory_controller)){
			current_state = item_state.onhand;
			//adds to inventory and assigns current_inventory_slot to espected position
			current_inventory_slot = obj_inventory_controller.addWeaponToGunSlot({
				name:global.gun_data_list[current_type].item_name,
				item_id:id,
				kind: current_type,
				sprite:sprite_index
			})
			current_parent = instance_find(obj_player,0)
			obj_player.current_gun = id;
			image_alpha = 1
			image_xscale = 1;
			image_yscale = 1;
			decayment = 0;
		}
		
	
	break;
	case item_state.onInventory:
		visible = false;
		
		//Switch to onHand
		if(global.inventory_gun_slot_selected_current == current_inventory_slot){
			current_state = item_state.onhand
		}
	break;
	case item_state.onhand:
		visible = true
		depth = current_parent.depth - 8
		var aim_x = mouse_x;
		var aim_y = mouse_y
		if(instance_exists(obj_aim)){
			aim_x = obj_aim.x;
			aim_y = obj_aim.y;
		}
		//Switch to oninventory
		if(global.inventory_gun_slot_selected_current != current_inventory_slot){
			current_state = item_state.onInventory
		}
		if(current_parent){
			switch(current_type){
				case item_kind.shotgun: shotgun(aim_x,aim_y,mouse_check_button_pressed(mb_left)); break;
				case item_kind.sword: sword(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.uzi: uzi(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.frogun: frogun(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.crabhand: crabhand(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.anubis_wand: anubis_wand(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.oxford: oxford(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.automatic_pulse_rifle: auto_pulse_rifle(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.HardM: oxford(aim_x,aim_y,mouse_check_button(mb_left)) break;
				case item_kind.m4a4:m4o4(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.ak47:ak47(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.double_barrel_shotgun: shotgun(aim_x,aim_y,mouse_check_button_pressed(mb_left)); break;
				case item_kind.deers_wand: deers_wand(aim_x,aim_y,mouse_check_button_pressed(mb_left)); break;
				case item_kind.eagles_colt: eagles_colt(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.g32: eagles_colt(aim_x,aim_y,mouse_check_button(mb_left)); break;
				case item_kind.firethrower: firethrower(aim_x,aim_y,mouse_check_button(mb_left)); break;
			}
		}else{
			current_state = item_state.onground
		}

		if(keyboard_check_pressed(ord("Q"))){
			if(instance_exists(obj_inventory_controller)){
				obj_inventory_controller.removeWeaponFromGunSlot(current_inventory_slot);
				
			}
			current_inventory_slot = noone //redefine afirmando que não está mais conosco 	
			obj_player.current_gun = noone;
			current_state = item_state.onground;
			current_parent = noone;
			baseY = y+6
			image_xscale = 1
			image_yscale = 1
			image_angle = 0
		}
	break;
	
	case item_state.onenemy:
		visible = true
		if(instance_exists(current_parent)){
			var _condition = distance_to_object(obj_player)<=global.gun_data_list[current_type].attack_range
			switch(current_type){
				case item_kind.shotgun: shotgun(obj_player.x,obj_player.y,_condition); break;
				case item_kind.sword: sword(obj_player.x,obj_player.y,_condition); break;
				case item_kind.uzi: uzi(obj_player.x,obj_player.y,_condition); break;
				case item_kind.frogun: frogun(obj_player.x,obj_player.y,_condition); break;
				case item_kind.crabhand: crabhand(obj_player.x,obj_player.y,_condition); break;
				case item_kind.anubis_wand: anubis_wand(obj_player.x,obj_player.y,_condition); break;
				case item_kind.oxford: oxford(obj_player.x,obj_player.y,_condition); break;
				case item_kind.automatic_pulse_rifle: auto_pulse_rifle(obj_player.x,obj_player.y,_condition); break;
				case item_kind.HardM: oxford(obj_player.x,obj_player.y,_condition); break;
				case item_kind.m4a4: m4o4(obj_player.x,obj_player.y,_condition); break;
				case item_kind.double_barrel_shotgun: shotgun(obj_player.x,obj_player.y,_condition); break;
				case item_kind.firethrower: firethrower(obj_player.x,obj_player.y,_condition); break;
				case item_kind.ak47: ak47(obj_player.x,obj_player.y,_condition); break;
				case item_kind.deers_wand: deers_wand(obj_player.x,obj_player.y,_condition); break;
				case item_kind.eagles_colt: eagles_colt(obj_player.x,obj_player.y,_condition); break;
				case item_kind.g32: eagles_colt(obj_player.x,obj_player.y,_condition); break;
			}
		}else{
			
			baseY = y+6
			current_parent = noone
			current_state = item_state.onground
			decayment = 0.0005;
			image_xscale = 1
			image_yscale = 1
			image_alpha = 1
		}
		break;
}


#endregion 

switch(current_type){
	case item_kind.shotgun:
		sprite_index = spr_shotgun
	break;
	case item_kind.sword:
		sprite_index = spr_sword
	break;
	case item_kind.uzi:
		sprite_index = spr_uzi
	break;
	case item_kind.frogun:
		sprite_index = spr_frogun;
	break;
	case item_kind.crabhand:
		sprite_index = spr_crabhand;
	break;
	case item_kind.anubis_wand:
		sprite_index = spr_anubis_wand;
	break;
	case item_kind.oxford:
		sprite_index = spr_Oxford_gun;
	break;
	case item_kind.automatic_pulse_rifle:
		sprite_index = spr_atomatic_pulse_rifle;
	break;
	case item_kind.HardM:
		sprite_index = spr_hard_m 
	break;
	case item_kind.m4a4:
		sprite_index = spr_m4a4 
	break;
	case item_kind.double_barrel_shotgun:
		sprite_index = spr_double_barrel_shotgun 
	break;
	case item_kind.firethrower:
		sprite_index = spr_firethrower 
	break;
	case item_kind.ak47:
		sprite_index = spr_ak47 
	break;
	case item_kind.eagles_colt:
		sprite_index = spr_eagles_colt 
	break;
	case item_kind.deers_wand:
		sprite_index = spr_grishas_wand 
	break;
	case item_kind.g32:
		sprite_index = spr_g32 
	break;
}

image_alpha -= decayment
if(image_alpha <=0.2){
	repeat(random_range(6,9)){
			var _a = instance_create_depth(x+random_range(-16,16),y+8,depth,obj_particle);
			_a.image_speed = 0.3;
			_a.direction = random(360)
			_a.speed = 0.5
			_a.sprite_index = spr_whiteParticle;
			_a.image_xscale = .8;
			_a.image_yscale = .8;
			_a.image_alpha = 1; 
			_a.alarm[0] = 10
		}
	instance_destroy()
}
		
}
