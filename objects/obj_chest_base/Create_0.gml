
//Pre definições
image_speed=0;
image_index = 0;

//função de criação de itens (substituir em cada baú)

function spawn_itens(){
	var _item = instance_create_depth(x,y+32,depth,obj_item);
	//Customizar o spawn do item;
}

//Controle de interação
has_itens = true; //Define se o baú tem itens
chest_open = false; //Define se o baú já foi aberto
interaction_distance = 32;

//Controle de animações
alpha_decay = 0; 


decay_after_open = false; //Se decay depois de aberto
decay_before_open = false; //Se decay antes de ser aberto

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 32;
_l.secondary_light_radious = 64
_l.core_ligth_transparency = 1;