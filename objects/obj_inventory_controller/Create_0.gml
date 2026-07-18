/// @description the inventory controller manages the inventory system of the game

//loads the total size of the inventory. 
global.inventory_size = 12
global.inventory_row_size = 4 //Quantidade de slots por linha de inventário
global.inventory_items = []

//Controle
global.inventory_menu = false; //defines if we should show the inventory on screen 

//Slots de arma
global.inventory_gun_list = [
	noone,
	noone,
	noone
] //Lista de slots de arma
global.inventory_gun_slot_total = 3 //3 slots de itens (equivalente ao que a gente tem lá do outro lado)
global.inventory_gun_slot_selected_current = 0;

//Each Item should have: name, amount and type. 
function addItem(item){

	var _a = instance_create_depth(x, y,-99, obj_push_up_notification)
	_a.text_message = string(item.amount) + " of " + string(item.name) + " added to inventory" ;
	_a.alpha_degradation = -0.005
	
	array_push(global.inventory_items, item)
}

//Weapon has name, id, item_kind, sprite_index
function addWeaponToGunSlot(weapon){
	//It means that theres space for news guns

		
	var _b = instance_create_depth(x, y,-99, obj_push_up_notification)
	_b.text_message =  " New Gun  " + string(weapon.name) + " Added to Inventory!" ;
	_b.alpha_degradation = -0.005
		
	for(var i = 0; i<array_length(global.inventory_gun_list);i++){
		var _item = global.inventory_gun_list[i];
		if(_item==noone){
			show_debug_message("adding weapon to: "+string(i));
			global.inventory_gun_list[i] = weapon;
			return i
		}
	}
	return noone; //se não achar nenhum espaço vago limpa tudo
}

function removeWeaponFromGunSlot(index){
	global.inventory_gun_list[index] = noone
}
