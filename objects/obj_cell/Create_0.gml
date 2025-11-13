//Declare Variables
image_speed = 0;
revealed = false;	// Not revealed
my_index = 1;		// The sprite to be revealed
my_type = 0;
coord = [0][0];
neighbor_counted = false;
antineighbor_counted = false;


function on_reveal() {
	
	//iterate through strings to check neighbors
	//if a bomb is nearby update bomb proximity
	// Check only up down left right I think...
	
	image_index = my_index;
	revealed = true;
	obj_card.reveals++;
	/*if my_type == "bomb" {
		obj_card.bombs ++
		if obj_card.bombs == 2{
			show_message("Looooserrrr")
		}
			
			//obj card end function
	}*/

}

function check_score() {
	show_debug_message("bombs " + string(obj_card.bombs))
	if my_type == "double" {
		obj_card.double ++
	}
	
	if my_type == "triple" {
		obj_card.triple ++
	}
	
	if my_type == "free" {
		obj_card.free += 1
	}
	
	if my_type == "bomb" {
		if(obj_card.reveals==0){
			my_type = "free";
			obj_card.colorTiles();
			show_debug_message("FIRST SCRATCH BOMB AVERTED");
		}
		else{
			obj_card.bombs ++
			money_counter.changeDisplayText("Bombs scratched: " + string(obj_card.bombs))
			if obj_card.bombs == 2{
				show_message("You Fucking Suck")
				obj_card.triggerGameEnd();
			//obj card end function
			}
		}
	}
}