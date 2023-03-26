extends Node2D

const BUILDING_DIST = 128.0

var building_offset = 0.0
var left_buildings = []
var right_buildings = []

func stop_building_moving():
	for b in left_buildings:
		b.stop_moving()
	for b in right_buildings:
		b.stop_moving()

func new_building():
	var child = load("res://Building.tscn").instantiate()
	child.pick_random_building()
	return child

func dequeue_buildings():
	remove_child(left_buildings.pop_front())
	remove_child(right_buildings.pop_front())

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(4):
		var l_child = new_building()
		var r_child = new_building()
		left_buildings.append(l_child)
		right_buildings.append(r_child)
		add_child(l_child)
		add_child(r_child)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	building_offset += 150.0 * delta
	if building_offset > 128.0:
		building_offset -= 128.0
		dequeue_buildings()
		var l_child = new_building()
		var r_child = new_building()
		left_buildings.append(l_child)
		right_buildings.append(r_child)
		add_child(l_child)
		add_child(r_child)
		
	var i = 0
	for b in left_buildings:
		b.position.x = -144
		b.position.y = building_offset + 160 - BUILDING_DIST * i
		i += 1
	i = 0
	for b in right_buildings:
		b.position.x = 144
		b.position.y = building_offset + 160 - BUILDING_DIST * i
		i += 1
