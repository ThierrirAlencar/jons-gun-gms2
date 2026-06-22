
x -= xspeedDecay
y -= yspeedDecay
image_angle -= angleDecay
direction -= directionDecay
speed -= speedDecay
image_alpha -= alphaDecay


if(speed<0 or image_alpha<=0){
	instance_destroy();
}