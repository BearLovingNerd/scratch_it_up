function scr_scene_manage(){

	/* This is a function that manages cutscenes and day to day dialogue
		Arguments are formed in a 2D array, in which the first array value is the day,
		and the second value is the scene index.
		Scene indexes can include arrays of dialoge passed to the type, as well as
		execute code such as moving UI elements on and off screen.
	*/

	var scene_tree = [0][0]
	var day = obj_scene_manager.day
	var moment = obj_scene_manager.moment

	// Day One
	scene_tree[0][0] = dia_intro()
	scene_tree[0][1] = dia_outro()

	scene_tree[day][moment]()
}