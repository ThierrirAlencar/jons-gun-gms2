

// --- Follow target ---
if(target != noone && instance_exists(target)){
	var _target_x = target.x - cam_w/2//*0.05
	var _target_y = target.y - cam_h/2//*0.05

	x = lerp(x, _target_x, follow_speed);
	y = lerp(y, _target_y, follow_speed);

	x = clamp(x, 0, max(0, room_width - cam_w));
	y = clamp(y, 0, max(0, room_height - cam_h));
}

// --- Clamp to room bounds ---
if (clamp_to_room)
{
    x = clamp(
        x,
        0,
        max(0, room_width - cam_w)
    );

    y = clamp(
        y,
        0,
        max(0, room_height  - cam_h)
    );
}

// --- Shake update ---
if(shake_timer > 0){
	shake_timer -= 1;
	var _falloff = shake_timer / shake_duration; // shake fades out as it runs down
	shake_offset_x = (random(shake_amount*2)-shake_amount) * _falloff;
	shake_offset_y = (random(shake_amount*2)-shake_amount) * _falloff;
} else {
	shake_offset_x = 0;
	shake_offset_y = 0;
}

//Update shaking using shake class definition 
shake.update();

// --- Apply final position (target lerp + shake) to the real camera ---
camera_set_view_pos(camera, x + shake_offset_x, y + shake_offset_y);