extends Node2D

# traffic cone, barricade 1 / 2, oil
const BARRICADE_TYPES = ["cone", "barricade1", "barricade2", "oil"]
const SPEED = 150

func random_barricade():
	barricade(randi() % 4)

func barricade(ind):
	$AnimatedSprite2D.play(BARRICADE_TYPES[ind % 4])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += SPEED * delta
