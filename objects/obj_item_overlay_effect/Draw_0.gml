/// @description 
//Create surface
if (!surface_exists(surf)){
	surf = surface_create(sprite_width, sprite_height);
}

//Set target
surface_set_target(surf);

//Draw sprite
draw_sprite(sprite_index, image_index, sprite_xoffset, sprite_yoffset);

//Draw overlap
gpu_set_colorwriteenable(1, 1, 1, 0);

draw_sprite_ext(spr_overlay, 0, 0, 0, 1, 1, 0, -1, 0.6);

gpu_set_colorwriteenable(1, 1, 1, 1);

//Reset target
surface_reset_target();

//Draw surface
draw_surface(surf, x - sprite_xoffset, y - sprite_yoffset);