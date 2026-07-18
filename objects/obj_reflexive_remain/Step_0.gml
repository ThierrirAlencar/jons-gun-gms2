

speed = lerp(speed,0,speed_decay)
image_alpha -= alpha_decay 

if(speed>0){
	image_angle += choose(angle_variation[0],angle_variation[1])
}

if(image_alpha==0){
	instance_destroy()
}