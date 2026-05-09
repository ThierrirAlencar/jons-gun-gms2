function scr_setWeaponsDataList(){
	global.item_data_list = [
		{
			item_name:"shotgun",
			attack_range:150,
			cooldown:30,
			bulletCount:3,
			bullet_damage:3,
			bullet_speed:8
		},
		{
			item_name:"ak47",
			attack_range:250,
			cooldown:2,
			bulletCount:3,
			bullet_damage:3,
			bullet_speed:10
		},
		{
			item_name:"sword",
			attack_range:40,
			cooldown:20,
			bulletCount:0,
			bullet_damage:6,
			bullet_speed:0
		},
		{
			item_name:"uzi",
			attack_range:250,
			cooldown:5,
			bulletCount:1,
			bullet_damage:2,
			bullet_speed:20
		},
		{
			item_name:"frogun",
			attack_range:150,
			cooldown:10,
			bulletCount:1,
			bullet_damage:8,
			bullet_speed:-1//variavel
		},
		{
			item_name:"crabhand",
			attack_range:60,
			cooldown:40,
			bulletCount:3,
			bullet_damage:7,
			bullet_speed:6
		},
		{
			item_name:"anubis wand",
			attack_range:200,
			cooldown:25,
			bulletCount:1,
			bullet_damage:10,
			bullet_speed:4
		},
		{
			item_name:"oxford",
			attack_range:160,
			cooldown:6,
			bulletCount:1,
			bullet_damage:5,
			bullet_speed:22
		},
		{
			item_name:"Automatic Pulse Rifle",
			attack_range:200,
			cooldown:10,
			bulletCount:1,
			bullet_damage:5,
			bullet_speed:20
		},
		{
			item_name:"Project Hard M",
			attack_range:100,
			cooldown:20,
			bulletCount:2,
			bullet_damage:12,
			bullet_speed:7
		}
	]
}

function scr_setIngredientDatalist(){
	/*
	    Uma Comida é definida pela soma dos valores dos ingredientes presentes nela
		Flavour = Define o sabor da comida, clientes
		texture = Define a textura
		
		Clientes vão ter gostos especifícos para o Flavour e texture e vão te retornar dinheiro baseado
		no quanto a comida entregue se adequa as espectativas deles
	*/
	global.ingredientDataList = [
		{
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