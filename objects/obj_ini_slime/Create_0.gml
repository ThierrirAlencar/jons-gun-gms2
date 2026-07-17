
event_inherited();


vida = 60
max_vida = 60
//Jump (Inicializa variáveis para a animação de pulo da slime)
baseY = y
jumping = false; // Começa sem estar pulando
jumpTimer = 0;   // Timer para iniciar o pulo
sinCount = 0;    // Controlador do movimento senoidal
jumpForce = 6;  // Define a força do pulo
ground_level = baseY; 
relative_y = y //Posição de Y onde o desenho se encontra


can_pickup_guns = false

// Definição da escala inicial da slime
xscale = 1;
yscale = 1;
velocity_y = 0 //velocidade do pulo (como começa no chão será zero)
velocity_x = 0;
move_speed = 0.2
