/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("R"))) {
	gameCurrentState = gameState.NewGame;
}

if(keyboard_check_pressed(vk_escape)) {
	game_end();
}

switch gameCurrentState {
	case gameState.NewGame:
		gameScore = 0;
		gameRound = 0;
		objShip.shotsOnScreen = 0;
		
		if (instance_exists(objBullet)) {
			instance_destroy(objBullet);
		}
		
		if(instance_exists(objRock)) {
			instance_destroy(objRock);
		}
		
		if(instance_exists(objUFO)) {
			instance_destroy(objUFO);
		}
		
		gameCurrentState = gameState.NewRound;
	break;
	
	case gameState.NewRound:
		gameRound += 1;
		event_user(0); // Space rock spawn event
		gameCurrentState = gameState.Playing;
	break;
	
	case gameState.Playing:
		if(!instance_exists(objRock) && !instance_exists(objBullet) && !instance_exists(objUFO)) {
			gameCurrentState = gameState.RoundEnding;
		}
		
		if(gameScore > gameHighScore) {
			gameHighScore = gameScore;
		}
		
		if(!instance_exists(objUFO)) {
			if(random(1) >= min(.1 * gameRound, 1)) {
				event_user(1); // UFO instance creation event
			}
		}
	break;
	
	case gameState.RoundEnding:
	// For now, delay long enough for animations to end, etc. then start
	// new round or go to GameOver as appropriate
		
		gameCurrentState = gameState.NewRound;
	break;
	
	case gameState.GameOver:
	break;
}