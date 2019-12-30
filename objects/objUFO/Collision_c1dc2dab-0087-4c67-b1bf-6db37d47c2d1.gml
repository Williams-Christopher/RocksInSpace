/// @description Hit by a bullet

// Call user event 0 on the bullet to housekeep and destroy it
with (other) {
	event_user(0);
}

//Just add to player score and destory UFO for now
if (type == ufoType.Large)
{
	objGameManager.gameScore += 100;
} else {
	objGameManager.gameScore += 200;
}

// Destroy this UFO
instance_destroy();