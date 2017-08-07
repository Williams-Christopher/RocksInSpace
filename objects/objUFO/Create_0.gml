/// @description Insert description here

type = ufoType.New;
smallUFOChance = min(objGameManager.gameRound * .25, 1);

	
// Turn this object into a large or small UFO, chance
// based on game round number, and set initial properties
var size = random(1);
if (size <= smallUFOChance) {
	type = ufoType.Small;
	image_xscale = .75;
	image_yscale = image_xscale;
	direction = 180;
	speed = 2;
} else {
	type = ufoType.Large;
	image_xscale = 1.5;
	image_yscale = image_xscale;
	direction = 180;
	speed = 2;
}
show_debug_message(string(type));
