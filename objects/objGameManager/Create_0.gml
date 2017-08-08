/// @description Insert description here
// You can write your code in this editor

// Instance variables
gameRound = 0;
gameScore = 0;
gameHighScore = 0;
bonusLifeInterval = 10000;
lastBonusScore = 0;
startingLives = 3;
playerLives = 0;

// For now, gameState just goes NewRound -> Playing -> GameEnding
gameCurrentState = gameState.NewGame;

//Create initial space rock population
//event_user(0);

