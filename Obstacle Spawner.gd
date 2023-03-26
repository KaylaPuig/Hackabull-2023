extends Node2D

const MIN_TIME = 0.25
const MAX_TIME = 1.5
const LANE_WIDTH = 36.0 # keep this in sync with player!

var living_obstacles = []
var elapsed = 0.0
var cur_rand_time = 0.0

func next_random_time():
	return randf() * (MAX_TIME - MIN_TIME) + MIN_TIME

# Called when the node enters the scene tree for the first time.
func _ready():
	cur_rand_time = next_random_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if elapsed >= cur_rand_time:
		elapsed -= cur_rand_time
		cur_rand_time = next_random_time()
		spawn_random_obstacle()
	
	var temp = []
	for obs in living_obstacles:
		if obs.position.y > 200:
			remove_child(obs)
		else:
			temp.append(obs)
	living_obstacles = temp
	print(get_child_count())
	elapsed += delta

func spawn_random_obstacle():
	var outcome = randf()
	var lane = (randi() % 3) - 1
	if outcome < 0.54:
		var child = load("res://Car.tscn").instantiate()
		child.position.x = lane * LANE_WIDTH
		child.position.y = -176
		child.random_car_color()
		add_child(child)
		living_obstacles.append(child)
	elif outcome < 0.81:
		var child = load("res://Barricade.tscn").instantiate()
		child.position.x = lane * LANE_WIDTH
		child.position.y = -176
		child.random_barricade()
		add_child(child)
		living_obstacles.append(child)
	else:
		var child = load("res://Construction Idiots.tscn").instantiate()
		child.position.x = lane * LANE_WIDTH
		child.position.y = -176
		add_child(child)
		living_obstacles.append(child)

func murder_all_offspring():
	for child in get_children():
		remove_child(child)
	living_obstacles = []
