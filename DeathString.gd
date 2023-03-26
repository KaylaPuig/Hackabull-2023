extends Node2D

const PREFIX = "You survived for "
const SUFFIX = " feet!"

var feet = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func make_string(feet):
	var feet_str = str(feet)
	for i in range(PREFIX.length()):
		var letter = load("res://Letter.tscn").instantiate()
		letter.show_character(PREFIX.substr(i, 1))
		letter.position.x = 12 * i
		add_child(letter)
	for i in range(feet_str.length()):
		var letter = load("res://Letter.tscn").instantiate()
		letter.show_character(feet_str.substr(i, 1))
		letter.position.x = 12 * i
		letter.position.y = 18
		add_child(letter)
	var offset = feet_str.length()
	for i in range(SUFFIX.length()):
		var letter = load("res://Letter.tscn").instantiate()
		letter.show_character(SUFFIX.substr(i, 1))
		letter.position.x = 12 * offset + 12 * i
		letter.position.y = 18
		add_child(letter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
