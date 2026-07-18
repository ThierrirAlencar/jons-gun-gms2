
//set drawing data
draw_set_color(c_gray);
draw_set_alpha(.6);

var length; //length of drop
var vectorx, vectory; //distance from middle of screen

var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

//calculate 3d vectors
vectorx = (x-(_cam_x+_cam_w/2))/(_cam_w/2);
vectory = (y-(_cam_y+_cam_h/2))/(_cam_h/2);

length = 2;//length of rain drop

//draw the rain drop
draw_line_width_colour(x+vectorx*sqr(height) ,y+vectory*sqr(height),
        x+vectorx*sqr(height+length),y+vectory*sqr(height+length),2,c_gray,c_aqua);
        
//reset draw data
draw_set_alpha(1);
