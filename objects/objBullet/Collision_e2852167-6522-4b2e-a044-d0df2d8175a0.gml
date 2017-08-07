/// @description Bullet instance collides with UFO

//// Call user event 0 on the UFO to housekeep and destroy it
//with (other) {
//	// Can't reference other inside event_user(0) on the UFO to decide if
//	// the UFO was destroyed by a bullet or rock? Moving the scoring here
//	// for now since it's plain at this point the UFO is being destroyed
//	// by a bullet.
//	//Just add to player score and destory UFO for now
//	if (other.ufoType.Large)
//	{
//		objGameManager.gameScore += 100;
//	} else {
//		objGameManager.gameScore += 200;
//	}
//	event_user(0);
//}

//// Housekeeping and destruction of this bullet instance
//event_user(0);