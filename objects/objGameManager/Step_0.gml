/// @description Insert description here
// You can write your code in this editor


// R resets the game
if(keyboard_check_pressed(ord("R"))) {
	gameCurrentState = gameState.NewGame;
}


// ESC quits
if(keyboard_check_pressed(vk_escape)) {
	game_end();
}

switch gameCurrentState {
	case gameState.NewGame:
		gameScore = 0;
		gameRound = 0;
		playerLives = startingLives;
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
		// All hazards are cleared, end this round
		if(!instance_exists(objRock) && !instance_exists(objBullet) /*&& !instance_exists(objUFO)*/) {
			gameCurrentState = gameState.RoundEnding;
		}
		
		// Player is out of lives (for now, start a new game)
		if(playerLives <= 0) {
			gameCurrentState = gameState.NewGame
		}
		
		if(gameScore > gameHighScore) {
			gameHighScore = gameScore;
		}
		
		if(gameScore >= bonusLifeInterval && gameScore != lastBonusScore && gameScore mod bonusLifeInterval == 0) {
			playerLives += 1
			// So that bonus lives aren't continually added while
			// gameScore mod bonusLifeInterval == 0
			lastBonusScore = gameScore;
			// Also, play a sound?
		}
		
		// Random chance for a UFO to spawn if one does not exist
		if(!instance_exists(objUFO)) {
			if(random(100) <= min(1.5 * gameRound, 100)) {
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