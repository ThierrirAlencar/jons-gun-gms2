
x -= xspeedDecay
y -= yspeedDecay
image_angle -= angleDecay
direction -= directionDecay
speed -= speedDecay


if(speed<0){
	instance_destroy();
}