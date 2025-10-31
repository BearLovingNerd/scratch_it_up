// obj_dialogue - Draw GUI Event
var box_width = display_get_gui_width() - 440;
var box_height = 100;
var box_x = 20;
var box_y = display_get_gui_height() - box_height - 20;

// Draw background box
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

// Draw text
draw_set_color(c_white);
draw_set_font(ft_dialogue);
draw_text(box_x + 20, box_y + 20, display_text);

// Draw prompt when done
if (done_typing) {
    draw_text(box_x + box_width - 80, box_y + box_height - 40, "[next]");
}
