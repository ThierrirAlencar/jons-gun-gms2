

//should stop the rain?
var _chance = 30
if(irandom(100)<=_chance){
	is_raining = false
}else{
	//Should rain less?
	_chance = 40 
	if(irandom(100)<=_chance){
		number_of_rain = 20
	}
}

alarm[0] = 500 + random(200)