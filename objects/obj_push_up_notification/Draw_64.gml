

//draws the damage on screen

draw_set_font(fnt_def_font1)
draw_set_color(c_white)

var _screen_height = global.screen_height_size *global.screen_scale;

var _count_previous_notifications = instance_number(obj_push_up_notification)
var _x = 32 // espaçamento de 22 após a borda
var _y = _screen_height - 32 - (22*current_count);
var _scale = 2


draw_set_font(fnt_title_font2)
draw_text_ext_transformed(_x,_y,text_message, 3,600,_scale,_scale,0)

draw_set_color(c_white)