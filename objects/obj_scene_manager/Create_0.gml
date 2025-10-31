
day = 0
moment = 0

function move_sprites(){
	with obj_sprite move_in = true;
	alarm[0] = 45;
}

// Day One

scene_tree[0][0] = dia_intro;
scene_tree[0][1] = move_sprites;
scene_tree[0][2] = dia_outro;

//show_message(typeof(scene_tree[0][0]));
scene_tree[day][moment]();