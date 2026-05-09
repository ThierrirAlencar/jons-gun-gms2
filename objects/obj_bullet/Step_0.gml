

speed += speed_variation;
image_xscale+=xscale_variation
image_yscale+=yscale_variation
direction+=direction_controled_variation
image_angle += rotation


if(rotation==0){
	image_angle = direction
}

if(speed<=0){
	instance_destroy()
}
