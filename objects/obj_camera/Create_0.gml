target = noone;

follow_speed = 0.15;

camera = view_camera[0];
room_set_camera(room,0,camera)

cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

x = camera_get_view_x(camera);
y = camera_get_view_y(camera);

clamp_to_room = true;


// ====================
// Screen Shake
// ====================

shake_amount = 0;
shake_duration = 0;
shake_timer = 0;

shake_offset_x = 0;
shake_offset_y = 0;

shake_start = function(_amount, _duration)
{
    shake_amount = _amount;
    shake_duration = _duration;
    shake_timer = _duration;
};


function redefine_camera(){
	// Re-fetch the camera/view dims in case the new room has different view settings
	camera = view_camera[0];
	cam_w = camera_get_view_width(camera);
	cam_h = camera_get_view_height(camera);

	x = camera_get_view_x(camera);
	y = camera_get_view_y(camera);
}

// ====================
// Shake Utility
// ====================

shake = new Shake();