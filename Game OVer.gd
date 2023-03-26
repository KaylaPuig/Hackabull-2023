extends Node2D

var selection = 0
var count_for_ui = false
var can_do_input = false
var elapsed = 0.0
var elapsed_for_ui = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if elapsed > 1.0:
		elapsed = 1.0
		count_for_ui = true
	if count_for_ui:
		elapsed_for_ui += delta
	if elapsed_for_ui > 1.0:
		elapsed_for_ui = 1.0
		can_do_input = true
	$"1040".position.y = 432 - 288 * elapsed
	$UI.position.y = -144 + 288 * elapsed_for_ui
	
	if can_do_input:
		if Input.is_action_just_pressed("ui_up"):
			$UI.play("up")
			selection = 0
		if Input.is_action_just_pressed("ui_down"):
			$UI.play("down")
			selection = 1
		
		if Input.is_action_just_pressed("ui_accept"):
			if selection == 0:
				get_tree().change_scene_to_file("res://Run.tscn")
			else:
				get_tree().change_scene_to_file("res://Menu.tscn")
