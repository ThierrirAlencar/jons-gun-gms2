
function src_fade(_t){

	return _t * _t * _t * (_t * (_t * 6 - 15) + 10);

}

function src_gradient(_x, _y){

	var seed = (_x * 1836311903) ^ (_y * 2971215073);

	random_set_seed(seed);

	var angle = random(360);

	return [
		lengthdir_x(1, angle),
		lengthdir_y(1, angle)
	];

}

function src_dot(_gx, _gy, _dx, _dy){

	return (_gx * _dx) + (_gy * _dy);

}

function scr_perlin_noise(_x, _y, _scale){
	var fx = _x / _scale;
	var fy = _y / _scale;

	var x0 = floor(fx);
	var y0 = floor(fy);

	var x1 = x0 + 1;
	var y1 = y0 + 1;

	var sx = src_fade(frac(fx));
	var sy = src_fade(frac(fy));

	// Gradients
	var g00 = src_gradient(x0, y0);
	var g10 = src_gradient(x1, y0);
	var g01 = src_gradient(x0, y1);
	var g11 = src_gradient(x1, y1);

	// Distance vectors
	var dx0 = frac(fx);
	var dy0 = frac(fy);

	var dx1 = dx0 - 1;
	var dy1 = dy0 - 1;

	// Dot products
	var n00 = src_dot(g00[0], g00[1], dx0, dy0);
	var n10 = src_dot(g10[0], g10[1], dx1, dy0);

	var ix0 = lerp(n00, n10, sx);

	var n01 = src_dot(g01[0], g01[1], dx0, dy1);
	var n11 = src_dot(g11[0], g11[1], dx1, dy1);

	var ix1 = lerp(n01, n11, sx);

	return lerp(ix0, ix1, sy);
}

function src_fractal_noise(_x, _y){

	var total = 0;

	var amplitude = 1;
	var scale = 128;

	var max_value = 0;

	for(var i = 0; i < 4; i++){

		total += scr_perlin_noise(
			_x,
			_y,
			scale
		) * amplitude;

		max_value += amplitude;

		amplitude *= 0.5;
		scale *= 0.5;
	}

	return total / max_value;

}