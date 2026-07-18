cor = c_white;
velocidade = .2;
room_destino = room;
estado = "fechando";

//triangulo superior
x1 = 0; 
x2 = 0;
x3 = display_get_gui_width();

y1 = 0;
y2 = 0;
y2max = display_get_gui_height();
y3 = 0;


//triangulo inferior
_x1 = 0; 
_x2 = display_get_gui_width();
_x3 = display_get_gui_width();

_y1 = display_get_gui_height();
_y2 = display_get_gui_height();
_y2max = 0;
_y3 = display_get_gui_height();