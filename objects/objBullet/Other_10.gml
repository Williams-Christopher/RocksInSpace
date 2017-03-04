/// @description Insert description here
// You can write your code in this editor

if(instance_exists(objShip)) {
	with(objShip) {
		shotsOnScreen -=1;
	}
}

instance_destroy();