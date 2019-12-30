/// @description Insert description here
// You can write your code in this editor


// R resets the game
if(keyboard_check_pressed(ord("R"))) {
	gameCurrentState = gameState.NewGame;
}

// Testing - 1 adds 1k to gameScore
if(keyboard_check_pressed(ord("1"))){
	gameScore += 1000;
}

// ESC quits
if(keyboard_check_pressed(vk_escape)) {
	game_end();
}

switch gameCurrentState {
	case gameState.NewGame:
		gameScore = 9000;
		gameRound = 0;
		playerLives = startingLives;
		bonusLifeEarned = 0;
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
		alarm[0] = UFOAlarmInterval;
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
		
		// Check to see if a binus life has been earned	
		if(gameScore - (bonusLifeEarned + 1) * bonusLifeInterval >= 0) {
			playerLives += 1;
			bonusLifeEarned += 1;
			audio_play_sound(sndBonusLife, 1, false); // Hokey placeholder
		}
		
		// Random chance for a UFO to spawn if one does not exist
		// This still spawns UFOs almost constantly. Break out into
		// an alarm that runs every .5s or 1s?
		//if(!instance_exists(objUFO)) {
		//	if(random(100) <= min(.5 * gameRound, 100)) {
		//		event_user(1); // UFO instance creation event
		//	}
		//}
	break;
	
	case gameState.RoundEnding:
	// For now, delay long enough for animations to end, etc. then start
	// new round or go to GameOver as appropriate
		
		gameCurrentState = gameState.NewRound;
	break;
	
	case gameState.GameOver:
	break;
}