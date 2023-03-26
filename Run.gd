extends Node2D

var start_time_msec = 0

const MSEC_FT_NUMER = 77.0
const MSEC_FT_DENOM = 7500.0

func get_feet_traveled():
	return floor(((Time.get_ticks_msec() - start_time_msec) * MSEC_FT_NUMER) / MSEC_FT_DENOM)

# Called when the node enters the scene tree for the first time.
func _ready():
	start_time_msec = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
