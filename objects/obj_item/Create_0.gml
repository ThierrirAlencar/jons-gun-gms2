
//variavel que controla o tipo de um item
current_type = item_kind.shotgun
//variavel que controla o estado de um item
current_state = item_state.onground
//Variavel que define o parent atual do item (individuo que o segura)
current_parent = noone

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


// Controle da flutuação
float_amplitude = 0.3; // Intensidade do movimento vertical
float_speed = 0.05; // Velocidade da flutuação
float_timer = 0; // Timer para controlar o ciclo
baseY = y //posição inicial do objeto como item


//Decaimento de um item (destruido quando chegar a zero)
decayment = 0
image_speed = 0