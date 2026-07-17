
x -= xspeedDecay
y -= yspeedDecay
image_angle -= angleDecay
direction -= directionDecay
speed -= speedDecay
image_alpha -= alphaDecay


if(speed<minimun_barrier or image_alpha<=minimun_barrier){
	instance_destroy();
}