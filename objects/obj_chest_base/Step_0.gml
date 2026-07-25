

depth = -y;

if(has_itens and instance_exists(obj_player) and global.game_active){
	//colliding player allow interaction with player
	if(distance_to_object(obj_player)<=interaction_distance and global.key_interaction){
	
		spawn_itens(); //Run Spawn function
		has_itens = false;
		image_index = 1; 
		chest_open = true;
	}
}