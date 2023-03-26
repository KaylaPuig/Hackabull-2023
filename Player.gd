extends CharacterBody2D

var dead = false
var avoiding_floor_objects = false
var avoiding_ceiling_objects = false

var lane = 0
var start_slide = false
var sliding = false
var sliding_elapsed = 0.0

const LANE_MIN = -1
const LANE_MAX = 1
const LANE_DIST = 36.0
const SPEED = 150.0
const GRAVITY = 300.0
const JUMPHEIGHT = 120.0

func _ready():
	$Animations.play("standing")

func _physics_process(delta):
	if dead:
		$Animations.play("standing")
		return
	
	if is_on_floor() and not sliding and Input.is_action_just_pressed("ui_right"):
		lane += 1
	if is_on_floor() and not sliding and Input.is_action_just_pressed("ui_left"):
		lane -= 1
	if is_on_floor() and not sliding and Input.is_action_just_pressed("ui_down"):
		start_slide = true
	if is_on_floor() and not sliding:
		$Animations.play("walk_down")
	if not sliding and is_on_floor() and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept")):
		velocity.y = -JUMPHEIGHT
		$Animations.play("jump")
	if start_slide:
		start_slide = false
		sliding = true
		$Animations.play("slide")
	
	if sliding:
		sliding_elapsed += delta
		if sliding_elapsed > 0.67:
			sliding = false
			sliding_elapsed = 0.0
	
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
	
	avoiding_ceiling_objects = sliding
	avoiding_floor_objects = not is_on_floor()


func _on_deathbox_area_entered(area):
	if area.is_in_group("floor") and not avoiding_floor_objects:
		dead = true
	if area.is_in_group("ceil") and not avoiding_ceiling_objects:
		dead = true
