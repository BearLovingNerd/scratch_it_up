randomize()
bombs = 0;

//Establish Vars
double = 0;
triple = 0;
neighbor = 0;
anti = 0;
free = 0;
reveals = 0;

var cell_chance = []
repeat(2){
	array_insert(cell_chance, 0, "double")
}
repeat(2){
	array_insert(cell_chance, 0, "triple")
}
repeat(2){
	array_insert(cell_chance, 0, "neighb")
}
repeat(2){
	array_insert(cell_chance, 0, "anti")
}
repeat(2){
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
function colorTiles(){
	with obj_cell{
		my_index = 1
	
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
}
colorTiles();
function triggerGameEnd(){
	//count pairs and triples
	var pairScore = floor(double/2)*3
	var tripleScore = floor(triple/3)*7
	//count neighbors
	var neighborScore = 0;
	//count antineighbors
	var antiScore = 0;  //score 5 per isolated antineighbor
	
	for (var i = 0; i < 6; i++){
		for (var j = 0; j < 6; j++){
			var current = grid[i][j]
			if(validNeigh(current)){
				var tally = countNeighs(current);
				show_debug_message("Neighbor group count: " + string(tally));
				neighborScore += (tally*(tally+1))/2;//this calculation makes the sequence 1,2,3,4... into 1,3,6,10... (scoring of neighbors)
			}
			if(validAnti(current)){
				current.antineighbor_counted = true;
				foundAnti = false;
				for (var k = i-1; k < i+2 && k<6; k++){
					for (var l = i-1; l < i+2 && l<6; l++){
						if(validAnti(grid[abs(k)][abs(l)])){
							grid[abs(k)][abs(l)].antineighbor_counted = true;
							foundAnti = true;
						}
					}
				}
				if(!foundAnti){
					antiScore += 5;
				}
			}
		
		}
	}
	money_counter.changeDisplayText("Neighbor score = " + string(neighborScore) + " Pair Score = " + string(pairScore) + "\n Triple score = " + string(tripleScore) + " Free tile score = " + string(free))
	//show_message("anti score = " + string(antiScore))
	
	
	//count antineighbors
	//check all adjacent/diagonal cells. if no antineighbor, increase score
	//if antineighbor, mark both cells as no points. check all neighbors!!!
	
	
	//make ure first scratch isnt bomb
	//cash out button
	
	//three scratch cards
	
	//start simple w cards??
}

function countNeighs(cell){//perform depth first search when encountering an unmarked neighbor. gives one point for each neighbor in group
	cell.neighbor_counted = true;
	var count = 0;
	if(cell.cordx!=0){//check upwards
		var toCheck = grid[cell.cordx-1][cell.cordy];
		if(validNeigh(toCheck)){
			toCheck.neighbor_counted = true;
			count += countNeighs(toCheck);
		}
	}
	if(cell.cordx!=5){//check down
		var toCheck = grid[cell.cordx+1][cell.cordy];
		if(validNeigh(toCheck)){
			toCheck.neighbor_counted = true;
			count += countNeighs(toCheck);
		}
	}
	if(cell.cordy!=0){//check left
		var toCheck = grid[cell.cordx][cell.cordy-1];
		if(validNeigh(toCheck)){
			toCheck.neighbor_counted = true;
			count+= countNeighs(toCheck);
		}
	}
	if(cell.cordy!=5){//check right
		var toCheck = grid[cell.cordx][cell.cordy+1];
		if(validNeigh(toCheck)){
			toCheck.neighbor_counted = true;
			count+= countNeighs(toCheck);
		}
	}
	
	return 1 + count;
}
function validNeigh(cell){
	return cell.revealed && cell.my_type == "neighb" && !cell.neighbor_counted;
}
function validAnti(cell){
	return cell.revealed && cell.my_type == "anti" && !cell.antineighbor_counted;
}

