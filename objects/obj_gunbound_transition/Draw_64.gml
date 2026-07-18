//desenha o retangulo
draw_set_color(cor);

//triangulo de cima
draw_triangle(x1, y1, x2, y2, x3, y3, false);

//triangulo de baixo
draw_triangle(_x1, _y1, _x2, _y2, _x3, _y3, false);

draw_set_alpha(1);
draw_set_color(c_white);