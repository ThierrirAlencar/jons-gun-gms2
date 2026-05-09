
event_inherited();

//Habilita o uso da maquina de estados padrão
default_state_machine()

var len = 1
if(instance_exists(obj_player)){
	if(obj_player.x > x){
		len = 1
	}else{
		len = -1;
	}
}

//Efeito paper quando mudar de lado
image_xscale = lerp(image_xscale,len,0.2)
