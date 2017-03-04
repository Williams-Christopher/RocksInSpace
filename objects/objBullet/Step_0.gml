/// @description Insert description here
// You can write your code in this editor

lifetime -= 1;

if (lifetime < 0) {
	event_user(0);
}

move_wrap(true, true, 0)