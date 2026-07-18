/// @description Clear Surfaces

if(surface_exists(global.ambient_surface_light)){
	surface_free(global.ambient_surface_light); //Limpa a surface
}