

if(vida<=0 and is_down == false){
	alarm[1] = 360
	image_angle = 270
	is_down = true
}

if(vida>=0 and is_down==false){
	image_angle = lerp(image_angle,0,0.1)
}
