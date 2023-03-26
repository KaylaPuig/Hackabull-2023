extends CharacterBody2D

var lane = 0

const LANE_MIN = -1
const LANE_MAX = 1
const LANE_DIST = 50.0
const SPEED = 200.0
const GRAVITY = 300.0
const JUMPHEIGHT = 200.0

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		lane += 1
	if Input.is_action_just_pressed("ui_left"):
		lane -= 1
	if Input.is_action_just_pressed("ui_down"):
		# TODO: implement sliding
		pass
	if is_on_floor():
		$Animations.play("walk_down")
	if is_on_floor() and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept")):
		velocity.y = -JUMPHEIGHT
		$Animations.play("jump")
	
	# clamp lane value
	if lane < LANE_MIN:
		lane = LANE_MIN
	
	if lane > LANE_MAX:
		lane = LANE_MAX
	
	# move toward lane
	var desired_position = lane * LANE_DIST
	if position.x < desired_position:
		position.x += SPEED * delta
		if position.x > desired_position:
			position.x = desired_position
	elif position.x > desired_position:
		position.x -= SPEED * delta
		if position.x < desired_position:
			position.x = desired_position
	
	velocity.y += GRAVITY * delta
	
	move_and_slide()
