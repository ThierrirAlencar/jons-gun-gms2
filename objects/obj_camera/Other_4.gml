// Re-fetch the camera/view dims in case the new room has different view settings
camera = view_camera[0];
cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

x = camera_get_view_x(camera);
y = camera_get_view_y(camera);