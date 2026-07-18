draw_set_font(fnt_title_font2);

#region Icons
	//Game Logo
	var _sprite_logo = spr_logo;
	var _xx = (global.screen_width_size*global.screen_scale)
	var _yy = (global.screen_height_size*global.screen_scale)
	draw_sprite(_sprite_logo,0,_xx/2,_yy/2)
#endregion

#region Options
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);
hovered_index = -1; // instance var, so other events can react to it

for(var i = 0; i < array_length(menu_options); i++){
	var _text = menu_options[i].name;
	var _x = (global.screen_width_size/2)-128;
	var _float = sin(time*1.5+i*0.8) * 3;
	var _y = 200+(i*32) + _float;
	var _scale = 1;
	var _angle = 0;
	var _text_w = string_width(_text) * _scale;
	var _text_h = string_height(_text) * _scale;
	
	//Get an RGB colour for the menu;
	var t = time * 5;
	var r = (0.85 + sin(t)*0.15) * 255;
	var g = (0.7 + sin(t+2.1)*0.15) * 255;
	var b = (0.9 + sin(t+4.2)*0.1) * 255;
	
	var _color = make_colour_rgb(r,g,b);
	
	if(_mouse_x >= _x && _mouse_x <= _x + _text_w
		&& _mouse_y >= _y && _mouse_y <= _y + _text_h){
		hovered_index = i;
	}
	
	if(selected_index == i){
		_x = lerp(_x,_x-128,0.1);
		_scale = 1.75; 
		
		_text_w = string_width(_text) * _scale;
		_text_h = string_height(_text) * _scale;
		
		//Shake effect on the selected option
		var _shake_amount = 0.3;
		_x += sin(time*40 + i*10) * _shake_amount;
		_y += sin(time*53 + i*10) * _shake_amount;
		
		draw_set_colour(_color);
		draw_rectangle(_x,_y+_text_h+4,_x+_text_w, _y+_text_h+8,false);
		
		scr_text_wave(_x,_y,8,6,_text)
		
	}else{
			draw_text_ext_transformed(_x,_y,_text,1,100,_scale,_scale,_angle);
	}
	

	

	draw_set_colour(c_white);
}

#endregion 

