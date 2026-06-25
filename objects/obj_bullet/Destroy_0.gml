if(last_hit == noone){
	switch(current_material){
	case material.iron :
			var _direction = random(360)
			scr_material_destruction_smoke(random_range(6,9), random_range(2,5), [0.5,0.9], 1.5,[0,360]);
		break; 
	case material.wather: 
			scr_whater_splash_effect(random_range(8,10));
		break;
	case material.magic: 
			scr_magic_explosion_effect(random_range(8,10));
		break;
	}
}
