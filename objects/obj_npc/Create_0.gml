
//Entity Behavior
#region Entity BEhavior
stateNames = ["gun_seeking","moving_at_player","moving_at_route","moving_randomly","idle"]

can_be_hited=true
max_vida = 10;
vida = 10; //Vida do inimigo 
spd = 0.5 // velocidade do inimigo por frame;


//Shooting / Attack condition
can_shoot = true
current_gun = noone //Id da arma que está com ele


//State machine
current_state = states.idle

//Drop Item 
can_drop_item = false
item_to_drop = noone

//Seek range (range de busca)
seeking_range = 200; 
//Attack range (onde deve parar para ataque)
atack_range = 90

#endregion

//NPC Behavior (Usually its good to subscribe on the children
#region NPC BEhavior

npc_name = "Pedro"
title_adjust = 8 //adjust for title distance from the character

// Behavior control

hasDialog = false
canWalk = false
specialBehavior = noone //Later uses functions to specify behavior

function fn_noone(){} //there's nothing in here, and it just says that an end function is empty

//The dialog is a collection of messages
dialog = [
	{
		content:"Hi i'm a dialog test",
		portrait:noone,
		choiceFunction: fn_noone, //If in the future we want to do that
		endFunction: fn_noone //a function that executes in the end of the dialog
	},
	{
		content:"i'm here to show you all the possibilities of this dialog system!!",
		portrait:noone,
		choiceFunction: fn_noone, //If in the future we want to do that
		endFunction: fn_noone //a function that executes in the end of the dialog
	}
]

showDialog = false //if it shold show any dialog
dialogPosition = 0 //the current dialog position 

//animation control (for typing) 
charIndex       = 0;        // How many characters are visible
typeSpeed       = 0.5;        // Characters per step (adjust speed)
typeTimer       = 0;        // Frame counter