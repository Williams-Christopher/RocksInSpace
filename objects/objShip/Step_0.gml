/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("W"))) {
	motion_add(image_angle, .2);
}

if (keyboard_check(ord("A"))) {
	image_angle += 6;
}

if (keyboard_check(ord("D"))) {
	image_angle -= 6;
}

if (keyboard_check(ord("S"))) {
	//motion_add(-direction, .5);
}

if (keyboard_check_pressed(vk_space)) {
	if(shotsOnScreen < maxShotsOnScreen) {
		//var bullet = instance_create_depth(x, y, 10, objBullet);
		var bullet = instance_create_depth(x + lengthdir_x(16, image_angle),
											y + lengthdir_y(16, image_angle),
											10,
											objBullet);
		bullet.direction = image_angle;
		bullet.speed = 8;
		//motion_add(image_angle, -5);
		shotsOnScreen += 1;
		audio_play_sound(sndPew, 1, false);
	}	
}

if (speed > 5) speed = 5;
//speed = clamp(speed, -5, 5);
speed = max(speed - 0.02, 0);
move_wrap(true, true, 10);