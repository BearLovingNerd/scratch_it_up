//Declare Variables
image_speed = 0;
revealed = false;	// Not revealed
my_index = 1;		// The sprite to be revealed
my_type = 0;
coord = [0][0]

function on_reveal() {
	
	//iterate through strings to check neighbors
	//if a bomb is nearby update bomb proximity
	// Check only up down left right I think...
	
	image_index = my_index;
	revealed = true;
	if my_type == "bomb" {
		obj_card.bombs ++
		if obj_card.bombs == 2
			show_message("Looooserrrr")
	}
}

function check_score() {
	if my_type == "double" {
		obj_card.double ++
	}
	
	if my_type == "triple" {
		obj_card.triple ++
	}
	
	if my_type == "free" {
		obj_card.free += 5
	}
	
	if my_type == "bomb" {
		obj_card.bombs ++
		if obj_card.bombs == 2
			show_message("You Fucking Suck")
	}
}