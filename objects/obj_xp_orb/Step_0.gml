

if(instance_exists(obj_player)){
	if(distance_to_object(obj_player)<=follow_distance){
			direction = point_direction(x,y,obj_player.x,obj_player.y)
			speed = lerp(speed,max_speed, 0.05);
	}else{
			speed = lerp(speed,0, 0.1);
	}
}