



var _w = room_width
var _h = room_height

global.ambient_light_brightness = .45 //Change dependending on map
global.ambient_surface_light = surface_create(_w,_h); 

rain_height = 40;
number_of_rain = 20
is_raining = true;


//Each tick checks the Ambience wonce again providing changes to wheater
alarm[0] = 500 + random(200)