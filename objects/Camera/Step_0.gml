// Update object position
x += (follow.x - x) / 10;
y += (follow.y - y) / 10;

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);