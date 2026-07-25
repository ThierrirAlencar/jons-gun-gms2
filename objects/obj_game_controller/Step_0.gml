/// obj_game_controller - Step Event


// ============================================================
// INPUT
// ============================================================

scr_keybindings();


// ============================================================
// DEBUG / SYSTEM INPUT
// ============================================================

if (keyboard_check_pressed(vk_f1))
{
    global.config_debug =
        !global.config_debug;
}


if (keyboard_check_pressed(vk_f2))
{
    global.config_debug_camera =
        !global.config_debug_camera;
}


if (keyboard_check_pressed(vk_f3))
{
    global.reload = true;
}


if (keyboard_check_pressed(vk_escape))
{
    // Pause only during active gameplay

    if (global.game_active)
    {
        global.game_paused =
            !global.game_paused;
    }
}


// ============================================================
// RELOAD
// ============================================================

if (global.reload)
{
    scr_defineItens();
    scr_gamepad_vars();
    scr_keybindings();
    scr_load_enums();
    scr_config();

    global.reload = false;
}


// ============================================================
// PAUSE MENU
// ============================================================

if (global.game_paused)
{
    if (!instance_exists(obj_on_game_pause_menu))
    {
        instance_create_depth(
            0,
            0,
            -99,
            obj_on_game_pause_menu
        );
    }
}
else
{
    if (instance_exists(obj_on_game_pause_menu))
    {
        with (obj_on_game_pause_menu)
        {
            instance_destroy();
        }
    }
}


// ============================================================
// SESSION / GAME STATE
// ============================================================

if (!global.session.active)
{
    return;
}


// ============================================================
// LOADING
// ============================================================

if (global.game_loading)
{
    return;
}


// ============================================================
// PAUSED
// ============================================================

if (global.game_paused)
{
    return;
}


// ============================================================
// ACTIVE GAMEPLAY
// ============================================================

if (global.game_active)
{
    // Update player status

    if (instance_exists(obj_player))
    {
        global.player_status.current_life = obj_player.vida;
		if(instance_exists(obj_camera)){
			if(obj_camera.target==noone){
				obj_camera.target = obj_player
			}
		}else{
				show_error("Camera object does not exists",true)
		}
    }else{
				show_error("player object does not exists",true)
	}


    // Update session time

    global.session.elapsed_time =
        current_time -
        global.session.start_time;


    // Check enemies

    global.game_ini_amount =
        instance_number(obj_inimigo);


    // Stage completed

    if (
        global.game_ini_amount == 0
        &&
        global.session.active
        &&
        !global.game_loading
        &&
        alarm[0] == -1
    )
    {
       _complete_stage();
    }
}