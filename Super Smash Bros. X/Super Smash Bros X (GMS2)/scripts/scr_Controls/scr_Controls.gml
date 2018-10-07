key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_up = keyboard_check(vk_up);

key_downfall = keyboard_check_pressed(vk_down);

key_jump = keyboard_check_pressed(vk_space);
key_jumpup = keyboard_check_pressed(vk_up);
key_jumpheld = keyboard_check(vk_space);
key_jumpupheld = key_up;
key_normal = keyboard_check_pressed(ord("Z"));
key_special = keyboard_check(ord("X"));

key_utaunt = keyboard_check(ord("I"));
key_dtaunt = keyboard_check(ord("K"));
key_ltaunt = keyboard_check(ord("J"));
key_rtaunt = keyboard_check(ord("L"));

key_usmash = keyboard_check(ord("W"));
key_dsmash = keyboard_check(ord("S"));
key_lsmash = keyboard_check(ord("A"));
key_rsmash = keyboard_check(ord("D"));

key_grab = keyboard_check(ord("Q"));
key_shield = keyboard_check(ord("E"));