if(stage<last_stage){
	stage++
}else{
	instance_destroy()//hatch egg spawning new creatures
}

alarm[1] = stage*1000+random(1000); 