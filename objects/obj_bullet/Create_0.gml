
function fn_noone(){}//initializes empty function


//Propriedades da bala
properties = {
	explosive:false,
	explosion_radius:0,
	collide_with_walls:true,
	bounciness:0, //Determina a quantidade de vezes que uma munição pode atingir a parede e ricochetear até ser destruída
	bounciness_speed_reduction:0, //Determina a redução de velocidade ao atingir uma parede 
	draw_halo:false, //determina se será desenhado uma aureóla ao redor da bala
	halo_color:c_white, //determina a cor da aureóla deenhada
	has_particle_function:false, //Determina se haverá uma função de partículas
	particle_generation_timeout:0, //Determina o período de tempo para executar a função de geração de partículas
	particle_function: fn_noone, //Particula a ser executada se houver uma função de geração de particulas.
}
//Tipo da munição (para controle de efeitos)
current_material=material.iron
damage=1
current_alegiance = bullet_alegiance.player
 //bullet damage

image_speed = 0
depth = -y-1000
rotation = 0
speed_variation = 0//variação de velocidade
xscale_variation = 0;
yscale_variation = 0;
direction_controled_variation = 0;
direction_uncontroled_variation = [0,0] //pequena variação que pode ser utilizada em um random_range

particle_emiter = noone

can_hit_objects = true //controle interno de hitting (Serve para controlar se a bala pode ou não atingir algo por um período específico de tempo)
last_hit = noone
alarm[2] = properties.particle_generation_timeout; 

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 16;
_l.core_ligth_transparency = 1;