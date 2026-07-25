
if(global.game_active and !global.game_paused){
#region jump_animation_and_movement
event_inherited();
// Definição do nível do chão baseado na posição inicial
ground_level = baseY;

// Se não estiver pulando, aguarde até o próximo pulo
if (!jumping) {
    sprite_index = spr_slime_idle;
    jumpTimer += 2 / 30;
    if (jumpTimer >= 1) {
        jumpTimer = 0;
        jumping = true;
        velocity_y = -jumpForce; // Define a força do pulo
        
        // Direção para o jogador
        move_direction = point_direction(x, y, obj_player.x, obj_player.y);
        velocity_x = lengthdir_x(move_speed, move_direction);
        
        // Stretch no início do pulo (esticando verticalmente)
        xscale = 0.7;
        yscale = 1.5;
    }
} else {
    // Aplicação da gravidade
    velocity_y += 0.2;
    sprite_index = spr_slime_hurt;
    
    // Movimento horizontal em direção ao jogador
    x += velocity_x;
    
    // Movimento vertical
    y += velocity_y;
    
    // Squash quando atingir o chão
    if (y >= ground_level) { 
        y = ground_level;
        jumping = false;
        velocity_y = 0;
        velocity_x = 0;
        
        repeat(random_range(3,6)) {
            var _a = instance_create_depth(x + random_range(-16,16), y + 8, depth, obj_particle);
            _a.image_speed = 0.3;
            _a.direction = 270 + random_range(-60,60);
            _a.speed = 1;
            _a.sprite_index = spr_whiteParticle;
            _a.image_xscale = .8;
            _a.image_yscale = .8;
            _a.image_alpha = .6; 
            _a.alarm[0] = 10;
        }
        
        // Squash ao aterrissar (achatamento)
        xscale = 1.4;
        yscale = 0.8;
    } else {
        // Retornar gradualmente ao tamanho normal no ar
        xscale = lerp(xscale, 1, 0.2);
        yscale = lerp(yscale, 1, 0.2);
    }
}

// Aplicar as escalas de transformação
image_xscale = xscale;
image_yscale = yscale;

#endregion
}