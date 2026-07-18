// Inherit the parent event
event_inherited();

vida = 20;
max_vida = 20;

can_pickup_guns = false;


seeking_range = 90; //low seeking range
spd = 1.1

//Melee specific
melee_range     = 15;   // distance at which it stops chasing and starts attacking
melee_damage    = 15;
attack_cooldown = 45;   // frames between attacks (assuming room speed ~60fps, this is ~0.75s)
attack_windup   = 15;   // frames of "telegraph" before the hit actually lands
attack_timer    = 0;    // counts down after an attack, blocks re-attacking until 0
attack_state_timer = 0; // counts up during windup
is_winding_up   = false;
melee_attacker = true; // Attacks as melee

//Baby Fire Ant Specifics
on_fire = false //If the Ant was set on fire; 
fire_spawn_rate = 20 // Higher = lower spawn rate
alarm[2] = fire_spawn_rate;