
if(global.config_debug){
	visible = true
	depth = -9999
	draw_set_font(fnt_debug_font4)
	draw_text(0,200-(16*2),"OS:"+string(os_type))
	draw_text(0,200-(16*1),"FPS:"+string(fps))
	draw_text(0,200+(16*0),"Game Stage:"+string(global.session.stage))
	draw_text(0,200+(16*1),"Game Stage: Label:"+string(global.game_stage_labels[global.session.stage]))
	draw_text(0,200+(16*2),"Game Loading:"+string(global.game_loading));
	draw_text(0,200+(16*3),"Game INI amount:"+string(global.game_ini_amount));
	draw_text(0,200+(16*4),"Controler Alarm 1:"+string(obj_game_controller.alarm[1]));
	draw_text(0,200+(16*5),"Controler Alarm 0:"+string(obj_game_controller.alarm[0]));
	draw_text(0,200+(16*6),"Camera X:"+string(obj_camera.x));
	draw_text(0,200+(16*7),"Camera Y:"+string(obj_camera.y));
	draw_text(0,200+(16*8),"Camera Target:"+string(obj_camera.target));
	draw_text(0,200+(16*9),"Aim X:"+string(obj_aim.x));
	draw_text(0,200+(16*10),"Aim Y:"+string(obj_aim.y));
	draw_text(0,200+(16*11),"Game Active:"+string(global.game_active));
	draw_text(0,200+(16*12),"Game Pause:"+string(global.game_paused));
	draw_text(0,200+(16*13),"Game Loading:"+string(global.game_loading));
	draw_text(0,200+(16*14),"Camera Viewport:"+string(obj_camera.camera));
	draw_text(0,200+(16*15),"Ambient Is_raining:"+string(obj_ambience_controller.is_raining));
	draw_text(0,200+(16*16),"Ambient light brigthness:"+string(global.ambient_light_brightness));
	draw_text(0,200+(16*17),"Ambient Surface Exists?:"+string(global.ambient_surface_light));
	draw_text(0,200+(16*18),"Session Elapsed Time:"+string(global.session.elapsed_time));
}





