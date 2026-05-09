image_speed = 0.02


event_inherited()

vida = 9000

npc_name = "Frogkeeper"
title_adjust = 8 //adjust for title distance from the character

// Behavior control

hasDialog = true
canWalk = false
specialBehavior = noone //Later uses functions to specify behavior

function fn_noone(){} //there's nothing in here, and it just says that an end function is empty

//The dialog is a collection of messages
dialog = [
	{
		content:"Hi i'm the Frog Keeper!",
		portrait:noone,
		choiceFunction: fn_noone, //If in the future we want to do that
		endFunction: fn_noone //a function that executes in the end of the dialog
	},
	{
		content:"Do you have any bugs that i can put on my stomach?",
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