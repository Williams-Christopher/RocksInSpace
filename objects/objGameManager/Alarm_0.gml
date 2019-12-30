/// @description Fires regularly to control UFO spawning
// You can write your code in this editor

show_debug_message("Alarm");
if(!instance_exists(objUFO)) {
	if(random(100) <= min(UFOBaseSpawnChance * gameRound, 100)) {
		event_user(1); // UFO instance creation event
	} else {	
		// Reset alarm
		alarm[0] = UFOAlarmInterval;
	}
}
