extends Node2D

var selector_position = 0 # 0 or 1, start and end

const START_POS = 168
const END_POS = 244

# Called when the node enters the scene tree for the first time.
func _ready():
	$Song.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		selector_position = 0
		$Selector.position.y = START_POS
	if Input.is_action_just_pressed("ui_down"):
		selector_position = 1
		$Selector.position.y = END_POS
	
	if Input.is_action_just_pressed("ui_accept"):
		if selector_position == 0:
			var new_scene = load("res://Cutscene.tscn").instantiate()
			get_tree().get_root().add_child(new_scene)
			$Song.stop()
			get_node(".").free()
		if selector_position == 1:
			get_tree().quit()

