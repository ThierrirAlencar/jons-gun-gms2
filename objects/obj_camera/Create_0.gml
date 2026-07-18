
target = noone;       // instance to follow — set this from outside, e.g. obj_camera.target = id;
follow_speed = 0.1;    // lerp factor: smaller = smoother/slower catch-up

// Grab the active camera tied to view 0 (make sure "Enable the use of Views" + View 0 are on)
camera = view_camera[0];
cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

// Current top-left position of the view
x = camera_get_view_x(camera);
y = camera_get_view_y(camera);

clamp_to_room = true; // keep the camera from showing outside the room

// === Shake system ===
shake_amount = 0;
shake_duration = 0;
shake_timer = 0;
shake_offset_x = 0;
shake_offset_y = 0;

// Call this from any object: obj_camera.shake_start(amount_px, duration_frames)
shake_start = function(_amount, _duration){
	shake_amount = _amount;
	shake_duration = _duration;
	shake_timer = _duration;
}

//Screenshake effect utility
shake = new Shake(); 
