randomize()
bombs = 0

var cell_chance = []
repeat(4){
	array_insert(cell_chance, 0, "double")
}
repeat(4){
	array_insert(cell_chance, 0, "triple")
}
repeat(4){
	array_insert(cell_chance, 0, "neigh")
}
repeat(4){
	array_insert(cell_chance, 0, "anti")
}
repeat(3){
	array_insert(cell_chance, 0, "free")
}

var final_selection = []
var number_of_bombs = irandom_range(4, 7)
var remaining_space = 36 - number_of_bombs

// Add bombs, must have
repeat(number_of_bombs){
	array_insert(final_selection, 0, "bomb")
}

// Fill remaining slots
repeat(remaining_space){
	var chance_range = irandom(array_length(cell_chance)-1)
	
	array_insert(final_selection, 0, cell_chance[chance_range])
}

grid = [
[0, 1, 2, 3, 4, 5],
[0, 1, 2, 3, 4, 5],
[0, 1, 2, 3, 4, 5],
[0, 1, 2, 3, 4, 5],
[0, 1, 2, 3, 4, 5],
[0, 1, 2, 3, 4, 5],
]

// Create Cells
for (var i = 0; i < 6; i++){
	
	for (var j = 0; j < 6; j++){
		
		// Create new cell
		var new_cell = instance_create_layer(x + 174 + (j*82), y + 64 + (i*82), "UI_upper", obj_cell);
		
		// Pass id info to grid
		grid[i][j] = new_cell
		
		// Choose a cell from the final selection to place on the grid
		var random_selection = irandom(array_length(final_selection)-1)
		new_cell.my_type = final_selection[random_selection]
		new_cell.cordx = i
		new_cell.cordy = j
		
		//Remove chosen cell
		array_delete(final_selection, random_selection, 1)
	}
}

with obj_cell{
	
	if cordx != 0 {
		var check = obj_card.grid[cordx - 1][cordy]
		if check.my_type == "bomb"
			my_index = 3
	}
	
if cordx != 5 {
		var check = obj_card.grid[cordx + 1][cordy]
		if check.my_type == "bomb"
			my_index = 3
	}
	
	if cordy != 0 {
		var check = obj_card.grid[cordx][cordy - 1]
		if check.my_type == "bomb"
			my_index = 3	
	}
	
	if cordy != 5 {
		var check = obj_card.grid[cordx][cordy + 1]
		if check.my_type == "bomb"
			my_index = 3	
	}
	
	if my_type == "bomb"
		my_index = 2
}

// Establish Vars
pair = 0;
triple = 0;
neighbor = 0;
anti = 0;
free = 0;