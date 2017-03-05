/// @description Insert description here
// You can write your code in this editor

switch (type) {
	case ufoType.New:
		// Turn this object into a large or small UFO, chance
		// based on game round number, and set initial properties
		var size = random(1);
		if (size <= smallUFOChance) {
			type = ufoType.Small;
			image_xscale = .25;
			image_yscale = image_xscale;
			direction = 180;
			speed = 2;
		} else {
			type = ufoType.Large;
			image_xscale = 1;
			image_yscale = image_xscale;
			direction = 180;
			speed = 2;
		}
		show_debug_message(string(type));
	break;
	
	case ufoType.Large:
		// behaviors for a large UFO
	break;
	
	case ufoType.Small:
		// behaviors for a small UFO
	break;
}

if(x < -16) {
	instance_destroy();
}