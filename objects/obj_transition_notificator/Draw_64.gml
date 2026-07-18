

var _h = global.screen_height_size * global.screen_scale;
var _w = global.screen_width_size * global.screen_scale;

draw_set_colour(c_black)
draw_set_alpha(image_alpha)
draw_circle(0,_h,700,false)
draw_circle(_w,_h,700,false)
draw_set_colour(c_white)
draw_set_alpha(1)

draw_set_font(fnt_def_font3)
draw_text_ext_transformed(40,_h-100,transit_to_area,4,_w,1,1,0)