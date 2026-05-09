


if(vida<max_vida){
	var _amount = vida / max_vida*100
	draw_healthbar(x-8,y+18,x+8,y+20,_amount,c_black,c_red,c_red,0,true,true)
}

if(alarm[3]!=-1){
	var _amount = alarm[3] / dash_delay*100
	draw_healthbar(x-8,y+24,x+8,y+26,_amount,c_black,c_aqua,c_aqua,0,true,true)
}

draw_sprite_ext(spr_bullet,1,x,y+12,image_xscale,0.3,image_angle,c_black,.3)


draw_self();