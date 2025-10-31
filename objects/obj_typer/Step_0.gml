
var click =  mouse_check_button_pressed(mb_left)


// If there's more to be said, type!
if current_message < array_length(dialogue_text) && pause == false{
	if (!done_typing) && !click {
	    type_timer++;

	    if (type_timer >= typing_speed) {
	        type_timer = 0;

	        // Add one more letter to the displayed text
	        text_index++;

	        if (text_index <= string_length(dialogue_text[current_message])) {
	            display_text = string_copy(dialogue_text[current_message], 1, text_index);
	        } else {
	            done_typing = true;
	        }
	    }
	} else if (click) && (!done_typing) {
		// Advance text if clicked
		display_text = string_copy(dialogue_text[current_message], 1, string_length(dialogue_text[current_message]));
	    done_typing = true;
	} else {
	    // Wait for player input to continue
	    if (click) {
	        // Example: restart typing or move to next dialogue line
	        done_typing = false;
			text_index = 0;
			current_message ++
	    }
	}
} else if pause == false{
	display_text = ""
	
	with obj_scene_manager {
		moment += 1;
		scene_tree[day][moment]();
	}
	
	pause = true
}