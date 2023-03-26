extends Node2D

const ANIMS = ["blue", "red", "grey", "red striped", "yellow"]
const SPEED = 300.0

func car_color(num):
	$AnimatedSprite2D.play(ANIMS[num % 5])

func random_car_color():
	var num = abs(randi() % 5)
	car_color(num)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += SPEED * delta
