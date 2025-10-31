/*	
	this object runs unique "scripts" which are labeled "dia_NAME" such as 
	dia_intro. These scripts are just very simple but are designed to contain large swathes
	of strings to pass to the type for each cutscene.
*/

// obj_dialogue - Create Event
dialogue_text = []
current_message = 0	// Which current chunk of text we're on
display_text = "";	// What is currently being shown
text_index = 0;		// Current character index
typing_speed = 2;	// Smaller = faster
type_timer = 0;
number_of_strings = false // once current message meets this value, the current cutscene is done
pause = false		// Wait for cutscene

done_typing = false;
font_dialogue = ft_dialogue; // Replace with your own font if desired
