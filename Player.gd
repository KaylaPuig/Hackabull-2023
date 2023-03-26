extends CharacterBody2D

const SPEED = 100.0
const GRAVITY = 200.0

func _physics_process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_down"):
		# TODO: implement sliding
		pass
	if is_on_floor() and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept")):
		velocity.y = -75
	
	$Animations.play("walk_down")
	
	velocity.x = direction * SPEED
	velocity.y += GRAVITY * delta

	move_and_slide()
