extends AnimatedSprite2D

var moving = true
var start_time
var pos_offset = 0.0

const ANIMS = ["building1", "building2", "building3", "building4", "building5"]
const SPEED = 150

func pick_random_building():
	building(randi() % 5)

func building(ind):
	play(ANIMS[ind % 5])
