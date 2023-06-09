extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CutsceneSprite.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $CutsceneSprite.is_playing() or Input.is_action_just_pressed("ui_accept"):
		var new_scene = load("res://Run.tscn").instantiate()
		get_tree().get_root().add_child(new_scene)
		get_node(".").free()
