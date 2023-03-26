extends Node2D

var desired_string = ""
var letter_nodes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sync_str_to_display()

func sync_str_to_display():
	while letter_nodes.size() < desired_string.length():
		var child = load("res://Letter.tscn").instantiate()
		add_child(child)
		letter_nodes.append(child)
	
	for i in range(desired_string.length()):
		letter_nodes[i].show_character(desired_string.substr(i, 1))
		letter_nodes[i].position.x = -180 + i * 12
		letter_nodes[i].position.y = -134

func set_desired_string(string):
	desired_string = string
