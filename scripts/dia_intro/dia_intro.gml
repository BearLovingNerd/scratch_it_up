function dia_intro(){
	
	// The Dialogue
	var dialogue_array = [
	"*Sigh*",
	"*Siggghh....*",
	"[cat] I SAID SIGH!! Look at me you little cutie!!"
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