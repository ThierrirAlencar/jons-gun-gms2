if (
    global.session.active
    &&
    global.game_loading
)
{
    // Don't activate gameplay in menu rooms

    if (room != room_menu)
    {
		
		if(!instance_exists(obj_player)){
			instance_create_depth(x,y,depth,obj_player)		
		}
        _stage_loaded();
    }
}