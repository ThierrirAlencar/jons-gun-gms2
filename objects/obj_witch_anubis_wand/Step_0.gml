

if(instance_exists(obj_player)){
	image_angle = point_direction(x,y,obj_player.x,obj_player.y)
}
if(!instance_exists(related_witch)){
	instance_destroy(); //adicionar código para gerar item no chão
}else{
	x = related_witch.x+8*related_witch.image_xscale;
	y = related_witch.y+6;
}


