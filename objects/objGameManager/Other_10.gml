/// @description Create rock population and set it in motion

// Coordinates of window / room center;
var cX = window_get_width() / 2;
var cY = window_get_height() / 2;

// Margin around the center of the window / room that is off-limits for rock creation
safetyMargin = 100;

// Base number of rocks to generate
baseRockPop = 4; // modified by round number later on

// Flag to indicate a valid position for the rock instance
var validXPosition = false;
var validYPosition = false;

// grab a new seed for random
randomize();

// Create asteroid instances around the edge of window / room
for(i = 0; i < baseRockPop + gameRound; i++) {
	while(!validXPosition) {
		var aX = random_range(25, window_get_width() - 25);
		if((aX < (cX - safetyMargin)) || (aX > (cX + safetyMargin))) {
			validXPosition = true;
		}
	}
	
	while(!validYPosition) {
		var aY = random_range(25, window_get_height() - 25);
		if((aY < (cY - safetyMargin)) || (aY > (cY + safetyMargin))) {
			validYPosition = true;
		}
	}
	
	// Create rock instance at valid postion
	rock = instance_create_layer(aX, aY, "Instances", objRock);
	
	// Update lifecycle flag
	rock.rockLifecycleState = rockLifecycle.Large;
	
	// Choose a sprite for the object
	rock.sprite_index = choose(sprAsteroid01_new, sprAsteroid02);
	
	// Set the direction, image_angle and speed of the instance to random values
	rock.direction = irandom_range(0, 360);
	rock.image_angle = rock.direction;
	rock.speed = irandom_range(1, 3);
	
	// Set scale to make these initial rocks larger
	rock.image_xscale = 1.5;
	rock.image_yscale = 1.5;
	
	// reset validposition flags
	validXPosition = false;
	validYPosition = false;
}