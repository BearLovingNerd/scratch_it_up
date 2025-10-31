function dia_outro(){
	
	// The Dialogue
	var dialogue_array = [
	"Oh little cat, we're really in it now...",
	"Pop Mart is having a FLASH SALE in like ONE WEEK.",
	"How the heck are we supposed to get the money for one\nof those things...",
	"[cat] It's okay, you could never understand my immense suffering...",
	"To be the only girl in the whole world without.. without a lububu...",
	"Anyways, if you click anymore the game is gonna crash so don't\ndo that, 'K?"
	]
	
	// Pass Dialogue to type
	obj_typer.dialogue_text = dialogue_array
	
	// Set the endpoint of the dialogue so the cutscene ends
	obj_typer.number_of_strings = array_length(dialogue_array)
	
	// Reset typer
	obj_typer.current_message = 0
	obj_typer.done_typing = false
	obj_typer.pause = false
}