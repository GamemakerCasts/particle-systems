/// @description initialize the system

#region UPDATE EMITTER
	update_emitter = function() {
		
		var distrubutor = ps_distr_gaussian;
		
		switch(_distrubution) {
			case "linear":
				distrubutor = ps_distr_linear;
			break;
			case "inverse gaussian":
				distrubutor = ps_distr_invgaussian;
			break;
			default:
				distrubutor = ps_distr_gaussian;
			break;
		}
		
		switch(_emitter_mask) {
			case "rectangle":
				part_emitter_region(ps_system,
					pe_Effect1,
					bbox_left, bbox_right,
					bbox_top, bbox_bottom,
					ps_shape_rectangle,
					distrubutor
				);
			break;
			case "circle":
				part_emitter_region(ps_system,
					pe_Effect1,
					bbox_left, bbox_right,
					bbox_top, bbox_bottom,
					ps_shape_ellipse,
					distrubutor
				);
			break;
			case "diamond":
				part_emitter_region(ps_system,
					pe_Effect1,
					bbox_left, bbox_right,
					bbox_top, bbox_bottom,
					ps_shape_diamond,
					distrubutor
				);
			break;
			case "line":
				part_emitter_region(ps_system,
					pe_Effect1,
					bbox_left, bbox_right,
					bbox_top, bbox_bottom,
					ps_shape_line,
					distrubutor
				);
			break;
			case "point":
				part_emitter_region(ps_system,
					pe_Effect1,
					x, x,
					y, y,
					ps_shape_rectangle,
					distrubutor
				);
			break;
		}
	}
#endregion

#region BURST
	burst = function() {
		part_emitter_burst(
		ps_system,
		pe_Effect1,
		pt_Effect1,
		_particle_count);
	}
#endregion

#region UPDATE POSITION
	update_position = function(_x, _y) {
		x = _x;
		y = _y;
		
		update_emitter();
	}
#endregion

#region UPDATE PROPERTIES ON FLY
	update_size = function(_min, _max, _increase, _wiggle) {
		part_type_size(pt_Effect1, _min, _max, _increase, _wiggle);
	}
	
	update_scale = function(_min, _max) {
		part_type_scale(pt_Effect1, _min, _max);
	}
	
	update_orientation = function(_min, _max) {
		part_type_orientation(pt_Effect1, _min, _max, _orientation_increase, _orientation_wiggle, _orientation_relative);
	}
	
	update_color = function(_start, _middle, _end) {
		part_type_color3(pt_Effect1, _start, _middle, _end);
	}

	update_alpha = function(_start, _middle, _end) {
		part_type_alpha3(pt_Effect1, _start, _middle, _end);
	}
	
	update_additive = function(_is_additive) {
		part_type_blend(pt_Effect1, _is_additive);
	}
	
	update_life = function(_min, _max) {
		part_type_life(pt_Effect1, _min, _max);
	}
	
	update_speed = function(_min, _max, _increase, _wiggle) {
		part_type_speed(pt_Effect1, _min, _max, _increase, _wiggle);
	}
	
	update_direction = function(_min, _max, _increase, _wiggle) {
		part_type_direction(pt_Effect1, _min, _max, _increase, _wiggle);
	}	
	
	update_gravity = function(_strength, _direction) {
		part_type_gravity(pt_Effect1, _gravity_strength, _gravity_direction);
	}
	
	update_shape = function(_new_shape) {
		switch(_new_shape) {
			case "sprite":
				part_type_sprite(pt_Effect1, _sprite, _sprite_animate, _sprite_animate_smooth, _sprite_random_frame_start);
			break;
			case "disk":
			    part_type_shape(pt_Effect1, pt_shape_disk);
			break;
			case "square":
			    part_type_shape(pt_Effect1, pt_shape_square);
			break;
			case "line":
			    part_type_shape(pt_Effect1, pt_shape_line);
			break;
			case "star":
			    part_type_shape(pt_Effect1, pt_shape_star);
			break;
			case "circle":
			    part_type_shape(pt_Effect1, pt_shape_circle);
			break;
			case "ring":
			    part_type_shape(pt_Effect1, pt_shape_ring);
			break;
			case "sphere":
			    part_type_shape(pt_Effect1, pt_shape_sphere);
			break;
			case "flare":
			    part_type_shape(pt_Effect1, pt_shape_flare);
			break;
			case "spark":
			    part_type_shape(pt_Effect1, pt_shape_spark);
			break;
			case "explosion":
			    part_type_shape(pt_Effect1, pt_shape_explosion);
			break;
			case "cloud":
			    part_type_shape(pt_Effect1, pt_shape_cloud);
			break;
			case "smoke":
			    part_type_shape(pt_Effect1, pt_shape_smoke);
			break;
			case "snow":
			    part_type_shape(pt_Effect1, pt_shape_snow);
			break;
			default:
				part_type_shape(pt_Effect1, pt_shape_pixel);
			break;
		}
	}
	
	update_particle_count = function(_count) {
		_particle_count = _count;
	}
#endregion


#region PARTICLE SYSTEM
	ps_system = part_system_create();
	
	part_system_depth(ps_system, _depth);
#endregion


#region PARTICLE SHAPE
	pt_Effect1 = part_type_create();
	
	update_shape(_shape);
#endregion

#region PARTICLE TYPE
	part_type_size(pt_Effect1, _size_min, _size_max, _size_increase, _size_wiggle);
	part_type_scale(pt_Effect1, _scale_min, _scale_max);
	part_type_orientation(pt_Effect1, _orientation_min, _orientation_max, _orientation_increase, _orientation_wiggle, _orientation_relative);
	part_type_color3(pt_Effect1, _color_start, _color_middle, _color_end);
	part_type_alpha3(pt_Effect1, _alpha_start, _alpha_middle, _alpha_end);
	part_type_blend(pt_Effect1, _additive);
	part_type_life(pt_Effect1, _life_min, _life_max);
	part_type_speed(pt_Effect1, _speed_min, _speed_max, _speed_increase, _speed_wiggle);
	part_type_direction(pt_Effect1, _direction_min, _direction_max, _direction_increase, _direction_wiggle);
	part_type_gravity(pt_Effect1, _gravity_strength, _gravity_direction);
#endregion


#region PARTICLE EMITTER
	pe_Effect1 = part_emitter_create(ps_system);

	update_emitter();
#endregion

#region STREAM
	if(_stream_particles) {
		part_emitter_stream(
			ps_system,
			pe_Effect1,
			pt_Effect1,
			_particle_count
		);
	}
#endregion