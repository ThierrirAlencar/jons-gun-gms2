

//draws the damage on screen

draw_set_font(fnt_def_font1)
draw_set_color(image_blend)
draw_set_alpha(image_alpha)
draw_text_transformed(x,y,signal+string(damage),.8,.8,0)
draw_set_alpha(1);
draw_set_color(c_white)