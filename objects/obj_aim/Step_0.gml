//device_mouse_x_to_gui(0)
//device_mouse_y_to_gui(0)
x = lerp(x,mouse_x,global.config_mouse_sense)
y = lerp(y,mouse_y,global.config_mouse_sense)

image_speed = .2;
depth = -999999
window_set_cursor(cr_none)