
if(global.game_active){
	if(attatched_to){
		was_ever_attatched = true
		if(instance_exists(attatched_to)){
			x = attatched_to.x;
			y = attatched_to.y;
		}else{
			if(was_ever_attatched){
				instance_destroy()
			}
			attatched_to = noone;		
		}
	}else{
			if(was_ever_attatched){
				instance_destroy()
			}
	}

}