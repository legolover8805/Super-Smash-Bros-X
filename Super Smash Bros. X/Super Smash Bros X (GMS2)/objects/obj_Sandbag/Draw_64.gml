/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_Percent)
draw_text(percentX-5*percentRuns,600,percent);
if (percent < 10) {
	percentX = 960;
	draw_set_colour(c_white)
} else if (percent >= 10) {
	draw_set_colour(make_color_rgb(255, 238, 130));
	if (percent >= 100) {
		percentX = 910;
		percentRuns = 2;
		draw_set_colour(make_color_rgb(209,0,0));
		if (percent >= 125) {
			draw_set_colour(make_color_rgb(186,0,0));
		} if (percent >= 150) {
			draw_set_colour(make_color_rgb(135,0,0));
		} if (percent >= 200) {
			draw_set_colour(make_color_rgb(119,0,0));
		}
	} else {
		percentX = 935;
		percentRuns = 1;
		if (percent >= 20) {
			draw_set_colour(make_color_rgb(239, 217, 79));
		} if (percent >= 40) {
			draw_set_colour(make_color_rgb(239, 217, 79));
		} if (percent >= 60) {
			draw_set_colour(make_color_rgb(219,136,4));
		} if (percent >= 80) {
			draw_set_colour(make_color_rgb(219,82,4));
		} if (percent >= 90) {
			draw_set_colour(make_color_rgb(219,54,4));
		}
	}
}
draw_set_font(fnt_PercentSmall);
draw_text(ogPercentX,628,"%");