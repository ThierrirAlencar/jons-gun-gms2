


global.gui_component_easy_access_inventory = {
		draw:true , //defines if the menu is gonna be draw
		amount:global.inventory_gun_slot_total, //defines the amount of sections to be draw,
		name:"easy_access_inventory",//Component's name
		selected_index:global.inventory_gun_slot_selected_current, //Selected Index of the component (as it is a list)
		sprite:spr_item_container_section
}

global.gui_component_player_status_easy_display = {
	draw:true,  //defines if the menu is gonna be draw
	amount:1, //defines the amount of sections to be draw,
	name:"easy_player_status_display",//Component's name,
	sprite_detail:noone, //sprite used for detailing the information
	hearthbar:{ //Hearthbar displays the user life
		max_value:100, //max value (full life of the player) update this on the step event
		current_value:100, //Current life of the player, updates this on the step event
		bar_colour:c_red // Colour of the bar
	},
	expbar:{
		max_value:999, //max exp the player can get, update this on the step event
		current_value:0, //current ext the player can get, update this on the step event
		bar_colour:c_blue //Colour of the bar
	}
}