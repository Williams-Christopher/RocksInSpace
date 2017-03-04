/// @description Insert description here
// You can write your code in this editor

//show_debug_message("In GameEnd event...");

	if (instance_exists(objBullet)) {
		instance_destroy(objBullet);
	}
		
	if(instance_exists(objRock)) {
		instance_destroy(objRock);
	}
		
	if(instance_exists(objUFO)) {
		instance_destroy(objUFO);
	}
	
	if(instance_exists(objShip)) {
		instance_destroy(objShip);
	}