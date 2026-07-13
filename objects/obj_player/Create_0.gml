
spd = 3; // Velocidade do jogador
vida = global.player_status.current_life;
max_vida = global.player_status.max_life;



//efeitos
genDust = true

//stats
can_dash = true
is_dashing = can_dash*-1
dash_delay = 20

can_be_hited = true


current_gun = noone //Id da arma que está com ele


//Create light source for player

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 50;
_l.secondary_light_radious = 120
_l.core_ligth_transparency = 1;