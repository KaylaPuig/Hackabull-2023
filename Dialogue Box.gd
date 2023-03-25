extends Node2D

var current_string = []
const FONTMAPCHARS = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
const BACKSPACECODE = 4194308
const LINEWIDTH = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == BACKSPACECODE:
			remove_child(current_string.pop_back())
		var c = str(char(event.unicode))
		var ind = FONTMAPCHARS.find(c)
		if ind >= 0 and ind < FONTMAPCHARS.length():
			var child = load("res://Letter.tscn").instantiate()
			child.show_character(c)
			current_string.append(child)
			update_lengths()
			add_child(child)

func show_string(string:String):
	for c in current_string:
		c.get_character()

func delete_all_children():
	for child in get_children():
		remove_child(child);

func update_lengths():
	var i = 0
	for c in current_string:
		c.position.x = (i % LINEWIDTH) * 12
		c.position.y = (i / LINEWIDTH) * 18
		i += 1
