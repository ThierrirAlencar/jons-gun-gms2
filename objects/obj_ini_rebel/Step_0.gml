// Inherit the parent event
event_inherited();

if(global.game_active and !global.game_paused){
	default_state_machine();
}
