
if(global.game_paused){
	draw_set_font(fnt_def_font1);
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	hovered_index = -1; // instance var, so other events can react to it
	var _screen_width = global.screen_width_size*global.screen_scale;
	var _screen_height = global.screen_height_size*global.screen_scale;

	draw_set_alpha(.5)
	draw_rectangle_colour(0,0,_screen_width,_screen_height,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1);

	for(var i = 0; i < array_length(menu_options); i++){
		var _text = menu_options[i].name;
		var _x = (global.screen_width_size*global.screen_scale)/2;
		var _float = sin(time*1.5+i*0.8) * 3;
		var _y = 200+(i*64) + _float;
		var _scale = 4;
		var _angle = 0;
		var _text_w = string_width(_text) * _scale;
		var _text_h = string_height(_text) * _scale;
		var _gap = i*(_text_h+16)
		//Get an RGB colour for the menu;
		var t = time * 5;
		var r = (0.85 + sin(t)*0.15) * 255;
		var g = (0.7 + sin(t+2.1)*0.15) * 255;
		var b = (0.9 + sin(t+4.2)*0.1) * 255;
		
		_x -= 32
		
		var _color = make_colour_rgb(r,g,b);
	
		if(selected_index == i){
			_x = lerp(_x,_x+32,0.1);
			_scale *= 1.75; 
		
			_text_w = string_width(_text) * _scale;
			_text_h = string_height(_text) * _scale;
		
			//Shake effect on the selected option
			var _shake_amount = 0.3;
			_x += sin(time*40 + i*10) * _shake_amount;
			_y += sin(time*53 + i*10) * _shake_amount;
		
			draw_set_colour(c_red);
			draw_rectangle(_x,_y+_text_h+4+_gap,_x+_text_w, _y+_text_h+8+_gap,false);
		}
	
		if(_mouse_x >= _x && _mouse_x <= _x + _text_w
		&& _mouse_y >= _y && _mouse_y <= _y + _text_h){
			hovered_index = i;
		}
		if(i == 0 and !instance_exists(obj_player)){
			draw_set_colour(c_gray)
		}
	
		draw_text_ext_transformed(_x,_y+_gap,_text,1,100,_scale,_scale,_angle);
		draw_set_colour(c_white);
	}
}