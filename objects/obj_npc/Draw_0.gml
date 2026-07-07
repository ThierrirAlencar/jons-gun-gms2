draw_self()

if(can_be_hited == true){
	speed = lerp(speed,0,1)
}

if(vida<max_vida){
	var _amount = vida / max_vida*100
	draw_healthbar(x-8,y+18,x+8,y+20,_amount,c_black,c_red,c_red,0,true,true)
}

if(global.config_debug){
	draw_text(x,y+32,"state:"+stateNames[current_state])
}


#region DIalogs

draw_text(x-string_length(npc_name)*3,y-sprite_height+(8)-title_adjust,string(npc_name))

// Floating offset
var float_offset = sin(current_time / 200) * 4;

// Icon Y position (with floating effect)
var icon_y = y + sprite_height/2 + float_offset;

//colliding player show interaction icon bellow foot
if(instance_exists(obj_player) and !showDialog and hasDialog){
	if(distance_to_object(obj_player)<=32){
		var _depth = depth
		depth = -9999999999
		draw_sprite_ext(global.icons.up_icon,0,x-16,icon_y,0.5,0.5,0,c_white,1)
		depth = _depth
	}
}

#endregion