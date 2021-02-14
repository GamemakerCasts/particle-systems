function ps_find(instance_name){
	var instance = noone;
	
	for (var i = 0; i < instance_number(obj_Particle_System); i++) {
		var t = instance_find(obj_Particle_System, i);
	
		if(string_lower(t._name) == string_lower(instance_name)) {
			instance = t;
			break;
		}
	}
	
	return instance;
}