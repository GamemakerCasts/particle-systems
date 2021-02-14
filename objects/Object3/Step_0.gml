/// @description 

if(floor(image_index) == 1) {
	if(no_shot == false) {
		no_shot = true;
		
		var instance = ps_find("ps_shot");
		if(instance != noone) {
			instance.update_position(x, y);
			instance.burst();
		}
	}
} else {
	no_shot = false;
}