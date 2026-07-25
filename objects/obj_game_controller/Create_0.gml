/// @description Create game

// ============================================================
// PERSISTENCE
// ============================================================

persistent = true;

// ============================================================
// INITIALIZATION
// ============================================================

// Prevent duplicate controllers
if (instance_number(obj_game_controller) > 1)
{
    instance_destroy();
    exit;
}


// ============================================================
// GLOBAL GAME STATE
// ============================================================

global.game_active  = false;
global.game_paused  = false;
global.game_loading = false;


// ============================================================
// SESSION STATE
// ============================================================

// A session represents a complete run of the game.
// It can contain multiple rooms/stages.

global.session = {
    
    // Session lifecycle
    active: false,
    id: 0,
    
    // Stage progression
    stage: 0,
    stage_count: 0,
    
    // Session statistics
    score: 0,
    enemies_defeated: 0,
    
    // Optional future data
    start_time: 0,
    elapsed_time: 0,
    
    // Future procedural generation
    world_generated: false,
    
    // Session-specific world
    world: noone
};


// ============================================================
// PLAYER STATUS
// ============================================================

global.player_status = {
    EXP: 0,
    max_exp: 999,
    max_life: 100,
    current_life: 100
};


// ============================================================
// WORLD STATE
// ============================================================

global.world_generated = false;
global.world_gen_status = world_generation_status.non_started;

global.world = noone;
global.map_surface = -1;

global.ambient_surface_light = noone;


// ============================================================
// INVENTORY / UI
// ============================================================

global.gui_component_easy_access_inventory = noone;


// ============================================================
// STAGE DEFINITIONS
// ============================================================

global.game_stage_labels = [
    "Blank",
    "Ant's Plains",
    "Ant's Plains",
    "Ant's Plains",
    "Witch's Swamp",
    "Robots Desert",
    "Robots Desert",
    "Robots Desert",
    "Magma Cave"
];

global.session.stage_count =
    array_length(global.game_stage_labels);


// ============================================================
// GAMEPLAY STATE
// ============================================================

global.game_ini_amount = -1;


// ============================================================
// CONFIGURATION
// ============================================================

global.config_debug = false;
global.config_debug_camera = false;


// ============================================================
// RELOAD FLAGS
// ============================================================

global.reload = false;


// ============================================================
// PAUSE STATE
// ============================================================

global.pause_menu = false;


// ============================================================
// INPUT / DATA INITIALIZATION
// ============================================================

scr_gamepad_vars();
scr_keybindings();
scr_load_enums();
scr_config();
scr_defineItens();
scr_set_stage_configuration();

draw_set_font(fnt_def_font1);


// ============================================================
// CREATE PERSISTENT SYSTEMS
// ============================================================
_create_persistent_systems = function()
{
    show_debug_message(
        "Creating persistent game systems"
    );


    // ========================================================
    // INPUT
    // ========================================================

    if (!instance_exists(obj_gamepad_input))
    {
        instance_create_depth(
            0,
            0,
            0,
            obj_gamepad_input
        );
    }


    // ========================================================
    // AIM
    // ========================================================

    if (!instance_exists(obj_aim))
    {
        instance_create_depth(
            0,
            0,
            0,
            obj_aim
        );
    }


    // ========================================================
    // CAMERA
    // ========================================================

    if (!instance_exists(obj_camera))
    {
        instance_create_depth(
            0,
            0,
            0,
            obj_camera
        );
    }


    // ========================================================
    // INVENTORY
    // ========================================================

    if (!instance_exists(obj_inventory_controller))
    {
        instance_create_depth(
            0,
            0,
            -99,
            obj_inventory_controller
        );
    }


    // ========================================================
    // GUI
    // ========================================================

    if (!instance_exists(obj_gui_interface_handler))
    {
        instance_create_depth(
            0,
            0,
            -99,
            obj_gui_interface_handler
        );
    }
	
	// ========================================================
    // Ambience
    // ========================================================

    if (!instance_exists(obj_ambience_controller))
    {
        instance_create_depth(
            0,
            0,
            -99,
            obj_ambience_controller
        );
    }
};



_create_persistent_systems()
// ============================================================
// SESSION FUNCTIONS
// ============================================================
//Fluxo -> _start_session -> _load_stage -> room_restart() -> _stage_loaded() -> _complete_stage(0 -> _complete_session()
_start_session = function()
{
    show_debug_message("=================================");
    show_debug_message("Starting new game session");
    show_debug_message("=================================");


	//Configure Session API
    global.session.active = true;

    global.session.id++;

    global.session.stage = 1;

    global.session.score = 0;
    global.session.enemies_defeated = 0;

    global.session.start_time = current_time;
    global.session.elapsed_time = 0;

    global.session.world_generated = false;
    global.session.world = noone;
	
    global.world_generated = false;
    global.world = noone;
	
    //Game Config (starts loading session)
	global.game_active = false;
    global.game_paused = false;
    global.game_loading = true;

    // Reset player state
    global.player_status.current_life = global.player_status.max_life;

    global.player_status.EXP = 0;

    // Start first stage

    _load_stage(global.session.stage);
};

_end_session = function()
{
    show_debug_message("=================================");
    show_debug_message("Ending game session");
    show_debug_message("=================================");

    global.session.active = false;

    global.game_active = false;
    global.game_paused = false;
    global.game_loading = false;

	
	//Clear inventory
	global.inventory_gun_list = [
		noone,
		noone,
		noone
	]
	//Destroy weapons 
	while(instance_exists(obj_gun_item)){
		var _instance = instance_nearest(x,y,obj_gun_item);
		with(_instance){
			instance_destroy()
		}
	}


    global.game_ini_amount = -1;
};

_load_stage = function(_stage)
{

    show_debug_message(
        "Loading stage: " + string(_stage)+" a room:" + string(room)
    );

    global.session.stage = _stage;

    global.game_active = false;
    global.game_paused = false;
    global.game_loading = true;

    global.game_ini_amount = -1;

    // Current stage configuration
    scr_set_stage_configuration();

    // Restart current room
    room_restart();
};

_stage_loaded = function()
{
    show_debug_message(
        "Stage loaded: " +
        string(global.session.stage)
    );
	if(room != room_debug){
			scr_tileset_create()
	}
	
    global.game_loading = false;
    global.game_paused = false;
    global.game_active = true;
	
	var _t = instance_create_depth(x,y,depth,obj_transition_notificator)
	_t.transit_to_area = global.permanent_stage_configurations[global.session.stage].level_name
	_t.alpha_decay = 0.005
	
	if(instance_exists(obj_camera)){
		show_debug_message("Since camera exists -> redefining it")
		obj_camera.redefine_camera()
	}else{
		show_debug_message("Since does not exists -> Nothing to do with it")
	}
};

_complete_stage = function()
{
    show_debug_message(
        "Stage completed: " +
        string(global.session.stage)
    );


    global.session.stage++;


    // Check if session is complete

    if (
        global.session.stage
        >=
        global.session.stage_count
    )
    {
        _complete_session();
        return;
    }


    // Prepare next stage

    global.game_active = false;
    global.game_loading = true;

    global.session.enemies_defeated += global.game_ini_amount;


    // Small delay before loading

    alarm[0] = 90;
};

_complete_session = function()
{
    show_debug_message(
        "================================="
    );

    show_debug_message(
        "SESSION COMPLETE"
    );

    show_debug_message(
        "Session ID: " +
        string(global.session.id)
    );

    show_debug_message(
        "================================="
    );


    global.game_active = false;
    global.game_paused = false;
    global.game_loading = false;

    global.session.active = false;


    // Go to results/menu

    scr_gunbound_transition(
        c_black,
		10,
        room_menu
    );
};

//Future save session code 
function session_save()
{
    var _data = {
        id: global.session.id,
        stage: global.session.stage,
        score: global.session.score,
        enemies_defeated: global.session.enemies_defeated
    };

}