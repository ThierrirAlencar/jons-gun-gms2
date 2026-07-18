

/// @desc wave(from, to, duration, offset, time)
/// @arg from
/// @arg to
/// @arg duration
/// @arg offset
/// @arg time        which time to use, enter 0 for default current_time.  Used for offsetting.
// Returns a value that will wave back and forth between [from-to] over [duration] seconds
// Examples
//      image_angle = Wave(-45,45,1,0,0)  -> rock back and forth 90 degrees in a second
//      x = Wave(-10,10,0.25,0,0)         -> move left and right quickly
// Or here is a fun one! Make an object be all squishy!! ^u^
//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
function wave(){
	var _from = argument0;
	var _to = argument1;
	var _duration = argument2;
	var _offset = argument3;
	var _time = argument4;
	if _time = 0 _time = current_time;
	a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;

	}

/// @desc draw_text_wave(x,y,wave_height,wave_length,text);
/// @arg x : the x-coordinate : real
/// @arg y : the y-coordinate : real
/// @arg wave_height: the peak of the wave's height : real
/// @arg wave_length : how long one wave cycle is : real
/// @arg text : the string to draw : string
/// Example draw_text_wave(x, y, 5, 100, "WOW THIS IS AMAZING");
function scr_text_wave(){
	var xx        = argument[0];
	var yy        = argument[1];
	var _waveH    = argument[2];
	var _waveL    = argument[3];
	var text      = argument[4];
	var _offset = 0;
	var _stringProcessed = "";

	for (var i = 1; i<=string_length(text);++i) {
	    _offset += _waveL;
	    var letter = string_char_at(text,i);
	    var _sizeProcessed = string_width(_stringProcessed);
	    var _height = wave(-_waveH, _waveH, 1, 0, current_time + _offset);
	    draw_text(xx+_sizeProcessed,yy-_height,letter);
	    _stringProcessed+=letter;
	}
}