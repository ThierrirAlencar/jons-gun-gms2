event_inherited()


max_vida = 100;
vida = 100;
spd = 0.4

can_shoot = true
current_gun = noone
can_pickup_guns = false

current_state = states.idle

can_drop_item = false
item_to_drop = noone
drop_weapon = false
seeking_range = 180;
atack_range = 90 // used as the "stop and start shooting" range, keeps your existing naming

seeking_range = 160
// Fire-throwing specific
shoot_cooldown_timer = 0; // counts down, blocks firethrower() calls until 0

var _l = instance_create_depth(x,y,depth,obj_light);
_l.attatched_to = id;
_l.core_light_radius = 50;
_l.core_ligth_transparency = 1;