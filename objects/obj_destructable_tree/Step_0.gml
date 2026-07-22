depth = -y;

//iNHERITH PARENT
event_inherited()


if(instance_exists(obj_player)){
	if(collision_rectangle(x+16,y+16,x-16,y-16,obj_player,true,true)){
		//Está acima 
		if(obj_player.y<y){
			image_alpha = lerp(image_alpha,0.5,0.02)
		}
	}else{
		image_alpha = lerp(image_alpha,1,0.02)
	}
}