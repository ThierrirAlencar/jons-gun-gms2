/// @function Shake()
/// @description Reusable screen-shake helper. Create one instance per object that needs shake.
function Shake() constructor {
	amount = 0;
	duration = 0;
	timer = 0;
	offset_x = 0;
	offset_y = 0;
	
	/// @function start(_amount, _duration)
	/// @description Starts (or restarts) a shake.
	static start = function(_amount, _duration){
		amount = _amount;
		duration = max(_duration, 1); // avoid divide-by-zero in update()
		timer = duration;
	}
	
	/// @function update()
	/// @description Call once per step. Updates offset_x/offset_y, decaying as the shake settles.
	static update = function(){
		if(timer <= 0){
			offset_x = 0;
			offset_y = 0;
			return;
		}
		
		timer -= 1;
		var _falloff = timer / duration; // 1 → 0 as it settles
		
		offset_x = random_range(-amount, amount) * _falloff;
		offset_y = random_range(-amount, amount) * _falloff;
	}
	
	/// @function is_active()
	/// @description True while the shake is still running.
	static is_active = function(){
		return timer > 0;
	}
}