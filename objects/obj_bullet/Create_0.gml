

enum material {
	wather,
	iron //munição normal efeitos normais
}
enum bullet_alegiance{ //Lealdade da bala (entre o player e o inimigo)
	player,
	enemy
}
properties = {
	explosive:false,
	explosion_radius:0,
	collide_with_walls:true,
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