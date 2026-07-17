
if(can_be_hited == true){
	speed = lerp(speed,0,1)
}


if(global.config_debug){
	draw_text(x-16,y-16,string(stateNames[current_state]))
}

if(alarm[0]!=-1){
	gpu_set_fog(true,c_white,0,0)
	draw_self();
	gpu_set_fog(false,c_white,0,0)
}else{
	draw_self()
}

if(vida<max_vida){
	var _amount = vida / max_vida*100
	draw_healthbar(x-8,y+18,x+8,y+20,_amount,c_black,c_red,c_red,0,true,true)
}

if(keyboard_check(vk_f1)){
	draw_text(x,y+32,"state:"+stateNames[current_state])
}

