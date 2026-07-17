
stateNames = ["gun_seeking","moving_at_player","moving_at_route","moving_randomly","idle","attacking"]
enum states {
	gun_seeking, //Procurar uma arma
	moving_at_player, // ir na direção do player
	moving_at_route, // seguir uma rota
	moving_randomly, //Mover aleatóriamente
	idle, // fazer nada
	attacking,
}


can_be_hited=true
max_vida = 10;
vida = 10; //Vida do inimigo 
spd = 0.5 // velocidade do inimigo por frame;


//Shooting / Attack condition
can_shoot = true
current_gun = noone //Id da arma que está com ele
can_pickup_guns = true //Define se um inimigo pode ou não pegar armas

//State machine
current_state = states.idle
has_seen_player = false
//Drop Item 
can_drop_item = false
item_to_drop = noone

//Seek range (range de busca)
seeking_range = 200; 
//Attack range (onde deve parar para ataque)
atack_range = 90

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 50;
_l.core_ligth_transparency = 1;