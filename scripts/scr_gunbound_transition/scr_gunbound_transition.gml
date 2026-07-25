///@arg cor
///@arg velocidade
///@arg room_destino
function scr_gunbound_transition(){
	if(!instance_exists(obj_gunbound_transition)){
		
		var _layer = layer_get_id("layer_instances_active");
		if(!_layer){_layer = layer_create(depth+10,"layer_instances_active")}
		
		var t = instance_create_layer(x, y, _layer, obj_gunbound_transition);
		t.cor = argument0;
		t.velocidade = argument1;
		t.room_destino = argument2;
		
	}
}