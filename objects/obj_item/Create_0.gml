

//Define o estado do item
current_state = item_state.onground

item_structue = {
	name:"potato",
	amount:32,
	kind:item_type.ingridient
}


// Controle da flutuação
float_amplitude = 0.3; // Intensidade do movimento vertical
float_speed = 0.05; // Velocidade da flutuação
float_timer = 0; // Timer para controlar o ciclo
baseY = y //posição inicial do objeto como item

scr_shire_pickup_setup()

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 16;
_l.core_ligth_transparency = 1;