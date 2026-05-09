function scr_generate_map_surface(){

    var map_width  = array_length(global.world[0]);
    var map_height = array_length(global.world);

    // recreate surface if needed
    if (surface_exists(global.map_surface)) {
        surface_free(global.map_surface);
    }

    global.map_surface = surface_create(map_width, map_height);

    surface_set_target(global.map_surface);

    draw_clear_alpha(c_black, 0);
	show_debug_message("Map surface created")
    // draw every cell as one pixel
    for (var _y = 0; _y < map_height; _y++) {

        for (var _x = 0; _x < map_width; _x++) {

            var cell = global.world[_y][_x];

            draw_point_color(
                _x,
                _y,
                cell.tile_colour
            );
        }
    }

    surface_reset_target();
}