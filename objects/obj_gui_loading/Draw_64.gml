var _w = global.screen_width_size*global.screen_scale;
var _h = global.screen_height_size*global.screen_scale;
draw_set_font(fnt_def_font3)

draw_rectangle_colour(0,0,_w,_h,c_purple,c_purple,c_purple,c_purple,false)
draw_sprite_ext(spr_slime_idle,0,_w/2,_h/2-80,5,5,rotate_slime,c_white,1)

var _str_scale = 2
var _str_length = string_length("loading...")*12

scr_text_wave((_w/2)-(_str_length/2),_h/2,10,10,"loading...")

_str_length = string_length(choosen_tip)*12;

scr_text_wave((_w/2)-(_str_length/2),(_h/2)+50,2,2,choosen_tip)


var _string = "Now heading towards: " + stages_labels[global.session.stage] + " - Level : " + string(global.session.stage)

_str_length = string_length(_string)*12;
scr_text_wave((_w/2)-(_str_length/2),(_h/2)+100,1,1,_string)
draw_set_colour(c_white)   