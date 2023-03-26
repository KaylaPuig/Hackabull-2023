extends Node2D

var start_time_msec = 0

const MSEC_FT_NUMER = 77.0
const MSEC_FT_DENOM = 7500.0

func get_feet_traveled():
	return int(floor(((Time.get_ticks_msec() - start_time_msec) * MSEC_FT_NUMER) / MSEC_FT_DENOM))

# Called when the node enters the scene tree for the first time.
func _ready():
	start_time_msec = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var str_display = ""
	str_display += str(get_feet_traveled())
	str_display += " ft ran"
	$"Camera2D/Distance Display".set_desired_string(str_display)
