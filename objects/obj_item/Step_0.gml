image_xscale = 1
// Animação de flutuar
float_timer += float_speed;
depth = -y
y -= sin(float_timer) * float_amplitude;
image_angle += sin(float_timer-80) * float_amplitude*2; // Rotação leve para dar mais vida
if(distance_to_object(obj_player)<16 and keyboard_check_pressed(ord("E")) and instance_exists(obj_inventory_controller)){
	obj_inventory_controller.addItem(item_structue);	
	 instance_destroy();
}