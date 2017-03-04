/// @description Draw the score and high score	

draw_set_color(c_white);

// Draw scores, top left and center
draw_set_font(fntScore);
draw_text(25, 25, string(gameScore));
draw_text(window_get_width() / 2, 25, string(gameHighScore));

// draw build date / version, bottom left
draw_set_font(fntVersion);
draw_text(10, window_get_height() - 25, "DEVELOPMENT BUILD " + date_time_string(GM_build_date) + " v" + GM_version);