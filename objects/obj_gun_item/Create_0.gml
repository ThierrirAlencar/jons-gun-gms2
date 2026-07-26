
//variavel que controla o tipo de um item
current_type = item_kind.shotgun
//variavel que controla o estado de um item
current_state = item_state.onground
//Variavel que define o parent atual do item (individuo que o segura)
current_parent = noone
//Variável que controla o slot de inventário aonde foi armazenado o item no inventário. 
current_inventory_slot = noone; //como é noone não está no inventário. 

//weapon stats (valores da arma
dmg = 3 //dano
multiplicador = 3 //quantidade de tiros
shooting_cooldown = 10
can_shoot = true;

is_meelee = false //Se a arma é meelee ou não (inimigos vao tomar dano ao colidir com armas meelee)
 

// Controle de recoil 
recoil_force = 2;       // Intensidade do recuo
recoil_duration = 8;   // Duração do recuo em frames
recoil_timer = 0;       // Timer para controlar a interpolação
recoil_x = 0;           // Armazena o deslocamento X
recoil_y = 0;           // Armazena o deslocamento Y

//Controle de spray
fire_mode = fire_mode_type.single // ou fire_mode_type.spray, dependendo da arma
trigger_previous = false; // guarda o estado do trigger do frame anterior, pra detectar o "clique"

// Controle da flutuação
float_amplitude = 0.3; // Intensidade do movimento vertical
float_speed = 0.05; // Velocidade da flutuação
float_timer = 0; // Timer para controlar o ciclo
baseY = y //posição inicial do objeto como item


//Setup the overlay effect
scr_shire_pickup_setup()

//Decaimento de um item (destruido quando chegar a zero)
decayment = 0
image_speed = 0
should_ever_be_visible = true

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 32;
_l.core_ligth_transparency = 1;