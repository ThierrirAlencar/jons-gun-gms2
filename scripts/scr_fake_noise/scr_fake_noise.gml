function src_random_value(_x, _y){

	var seed = (_x * 92837111) + (_y * 689287499);

	random_set_seed(seed);

	return random(1);

}

function src_noise(){
	var _x = argument0
	var _y = argument1
	
	//deterministic seed (aways return the same noise
	var seed = (_x * 92837111) + (_y * 689287499);

	return random(1);
}

function src_fake_noise(_x, _y, _scale){

	var sample_x = _x / _scale;
	var sample_y = _y / _scale;

	var x0 = floor(sample_x);
	var y0 = floor(sample_y);

	var x1 = x0 + 1;
	var y1 = y0 + 1;

	var sx = frac(sample_x);
	sx = sx * sx * (3 - 2 * sx);

	var sy = frac(sample_y);
	sy = sy * sy * (3 - 2 * sy);
	
	// Corner random values
	var n0 = src_random_value(x0, y0);
	var n1 = src_random_value(x1, y0);

	var ix0 = lerp(n0, n1, sx);

	var n2 = src_random_value(x0, y1);
	var n3 = src_random_value(x1, y1);

	var ix1 = lerp(n2, n3, sx);

	return lerp(ix0, ix1, sy);

}