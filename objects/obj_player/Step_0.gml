
#region Movimento Básico
// Movimento básico
if(!is_dashing){
hsp = (global.key_right - global.key_left) * spd;
vsp = (global.key_down - global.key_up) * spd;

// Checagem de colisão e movimentação
if (place_meeting(x + hsp, y, obj_cos)) {
    while (!place_meeting(x + sign(hsp), y, obj_cos)) {
        x += sign(hsp);
    }
    hsp = 0;
}

//Verificação de Colisão para o eixo Y
if (place_meeting(x, y + vsp, obj_cos)) {
    while (!place_meeting(x, y + sign(vsp), obj_cos)) {
        y += sign(vsp);
    }
    vsp = 0;
}

// Animação de balanço


// Aplicar movimento
x += hsp;
y += vsp;

if(instance_exists(obj_aim)){
	if(obj_aim.x > x){
		image_xscale = 1;//lerp(image_xscale,1,1);
	}else{
		image_xscale = -1;//lerp(image_xscale,-1,1);
	}
}




depth = -y; //Manter a altura alinhada


//Verificação para a geração de particulas 
if(hsp!=0 or vsp!=0){
	if(genDust){
		//Cria uma particula e configura ela para se parecer com a particula que queremos que pareça
		var _a = instance_create_depth(x+random_range(-10,10),y+8+random_range(0,5),depth,obj_particle);
		_a.image_speed = 0.2;
		_a.sprite_index = spr_whiteParticle;
		_a.image_xscale = .4;
		_a.image_yscale = .4;
		_a.image_alpha = .7; 
		_a.alarm[0] = 0
		genDust = false; // seta a geração de particulas como false	
		alarm[0] = 4; //tempo para gerar uma nova particula
	}
}


}

#endregion 

#region dashMovement
	
	if(is_dashing){
		//Cria uma particula e configura ela para se parecer com a particula que queremos que pareça
		if(alarm[2]%2==0){
			var _a = instance_create_depth(x+random_range(-10,10),y+8+random_range(0,5),depth+1,obj_particle);
			_a.image_speed = 0.2;
			_a.sprite_index = spr_whiteParticle;
			_a.image_xscale = .6;
			_a.image_yscale = .6;
			_a.image_alpha = .8; 
			_a.alarm[0] = 0
			
			var _z = instance_create_depth(x,y,depth,obj_particle);
			_z.image_speed = 0.2;
			_z.sprite_index = spr_player;
			_z.image_xscale = 1*sign(image_xscale);
			_z.image_yscale = 1;
			_z.image_alpha = .5;
			_z.image_blend = c_black
			_z.alarm[0] = 0
		}
	}

	if(global.key_dash and can_dash){
		if(instance_exists(obj_aim)){
			is_dashing = true
			can_dash = false
			can_be_hited = false		
			alarm[2] = 25
			direction = point_direction(x,y,obj_aim.x,obj_aim.y);
			speed = spd*2
		}
	}

#endregion


#region Player basic
if(vida<=0){
	global.game = false
	global.pause_menu = true
	instance_destroy()
}

//Spim player when loading
if(global.game ){
	if( !checked){
		image_angle = 0; 
		checked = true
	}
}else{
		image_angle ++
}

#endregion


