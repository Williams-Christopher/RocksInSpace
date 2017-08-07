/// @description Called by a bullet collision
// You can write your code in this editor

switch (rockLifecycleState) {
	case rockLifecycle.Large:
	// We were a large rock, next one needs to be medium
		objGameManager.gameScore += 25;
		for(i = 0; i<2; i++) {
			var newRock = instance_create_layer(x, y, "instances", objRock);
			with(newRock) {
				rockLifecycleState = rockLifecycle.Medium;
				image_xscale = 1;
				image_yscale = 1;
				sprite_index = choose(sprAsteroid01_new, sprAsteroid02);
				image_angle = random_range(0, 360);
				direction = random_range(0, 360);
				speed = random_range(2, 4);
			}
		}
	break;
	
	case rockLifecycle.Medium:
	// We were a medium rock, next one needs to be small
		objGameManager.gameScore += 50;
		for(i = 0; i<2; i++) {
			var newRock = instance_create_layer(x, y, "instances", objRock);
			with(newRock) {
				rockLifecycleState = rockLifecycle.Small;
				image_xscale = .5;
				image_yscale = .5;
				sprite_index = choose(sprAsteroid01_new, sprAsteroid02);
				image_angle = random_range(0, 360);
				direction = random_range(0, 360);
				speed = random_range(3, 5);
			}
		}
	break;
	
	case rockLifecycle.Small:
	//We were a small rock - this is the end of the road
		objGameManager.gameScore += 100;
	break;
}

instance_destroy();