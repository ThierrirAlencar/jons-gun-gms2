if(
		other.current_gun==noone 
		and current_parent == noone 
		and current_state == item_state.onground 
		and other.can_pickup_guns
	){
		current_parent = other;
		current_state = item_state.onenemy;
		other.current_gun = id
		image_alpha = 1;
		image_xscale = 1;
		image_yscale = 1;
		decayment = 0;
}