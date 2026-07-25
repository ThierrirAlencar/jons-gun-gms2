function scr_setWeaponsDataList(){
	global.gun_data_list = [
		{
			type:item_type.weapom,
			item_name:"shotgun",
			attack_range:250,
			cooldown:30,
			bulletCount:3,
			bullet_damage:6,
			bullet_speed:8
		},
		{
			type:item_type.weapom,
			item_name:"ak47",
			attack_range:250,
			cooldown:16,
			bulletCount:1,
			bullet_damage:6,
			bullet_speed:15
		},
		{
			type:item_type.weapom,
			item_name:"sword",
			attack_range:40,
			cooldown:20,
			bulletCount:0,
			bullet_damage:10,
			bullet_speed:0
		},
		{
			type:item_type.weapom,
			item_name:"uzi",
			attack_range:150,
			cooldown:6,
			bulletCount:1,
			bullet_damage:5,
			bullet_speed:20
		},
		{
			type:item_type.weapom,
			item_name:"frogun",
			attack_range:150,
			cooldown:10,
			bulletCount:1,
			bullet_damage:12,
			bullet_speed:-1//variavel
		},
		{
			type:item_type.weapom,
			item_name:"crabhand",
			attack_range:60,
			cooldown:40,
			bulletCount:3,
			bullet_damage:12,
			bullet_speed:6
		},
		{
			type:item_type.weapom,
			item_name:"anubis wand",
			attack_range:150,
			cooldown:25,
			bulletCount:1,
			bullet_damage:11,
			bullet_speed:4
		},
		{
			type:item_type.weapom,
			item_name:"oxford",
			attack_range:150,
			cooldown:10,
			bulletCount:1,
			bullet_damage:5,
			bullet_speed:22
		},
		{
			type:item_type.weapom,
			item_name:"Automatic Pulse Rifle",
			attack_range:150,
			cooldown:10,
			bulletCount:1,
			bullet_damage:6,
			bullet_speed:20
		},
		{
			type:item_type.weapom,
			item_name:"Project Hard M",
			attack_range:100,
			cooldown:20,
			bulletCount:2,
			bullet_damage:15,
			bullet_speed:7
		},
		{
			type:item_type.weapom,
			item_name:"Double Barrel Shotgun",
			attack_range:90,
			cooldown:35,
			bulletCount:6,
			bullet_damage:6,
			bullet_speed:8
		},
		{
			type:item_type.weapom,
			item_name:"m4a4",
			attack_range:250,
			cooldown:11,
			bulletCount:1,
			bullet_damage:6,
			bullet_speed:15
		},
		{
			type:item_type.weapom,
			item_name:"firethower",
			attack_range:90,
			cooldown:0,
			bulletCount:1,
			bullet_damage:2,
			bullet_speed:20
		},
		{
			type:item_type.weapom,
			item_name:"deers wand",
			attack_range:150,
			cooldown:30,
			bulletCount:1,
			bullet_damage:11,
			bullet_speed:5
		},
		{
			type:item_type.weapom,
			item_name:"Eagle's 21",
			attack_range:250,
			cooldown:35,
			bulletCount:1,
			bullet_damage:17,
			bullet_speed:20
		},
		{
			type:item_type.weapom,
			item_name:"G32",
			attack_range:250,
			cooldown:30,
			bulletCount:1,
			bullet_damage:10,
			bullet_speed:18
		},
	]
}

function scr_setIngredientDatalist(){
	/*
	    Uma Comida é definida pela soma dos valores dos ingredientes presentes nela
		Flavour = Define o sabor da comida
		texture = Define a textura
		
		Clientes vão ter gostos especifícos para o Flavour e texture e vão te retornar dinheiro baseado
		no quanto a comida entregue se adequa as espectativas deles
	*/
	global.ingredientDataList = [
		{
			type:item_type.ingridient,
			name:"haming",
			index:0,
			flavor:{
				Sweet:0, //Doce
				Salty:10,//Salgado
				Sour:1, //Azedo
				Bitter:2, //Amargo
				Spicy:1, //Apimentado
				Bittersweet:0, //agridoce
				Refreshing:-1, //refrescante
			},
			texture:{
				Crunchy:10,//Crocante
				Chewy:-10,//Borrachudo
				Greasy:10,//Oleoso
				Buttery:-5,//Amanteigado,
				Syrup:-15//Molhado/amanteigado
			}
		}
	]
}

function scr_setConstructionDataList(){
	//construction items are supposed to be used on construction 
	
	global.construction_data_list = [
		{
			name:"cauldron",
			craftable:true,
			operational:true,
		}
	] 
}

function scr_setCraftingMaterialsDataList(){
		//Itens used for crafting
		
		
}

function scr_defineItens(){
	
	//Loads all the itens data lists; 
	scr_setWeaponsDataList();
	scr_setIngredientDatalist();
	scr_setConstructionDataList()
	scr_setCraftingMaterialsDataList()
	
	//merge on one single list 
	//global.item_data_list = global.gun_data_list + global.ingredientDataList + global.construction_data_list;
}