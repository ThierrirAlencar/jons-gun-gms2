global.tileset_layer = layer_get_id("layer_tile_01")
global.tilemap = layer_tilemap_get_id(global.tileset_layer)

global.tilemap_w = tilemap_get_width(global.tilemap)
global.tilemap_h = tilemap_get_height(global.tilemap)