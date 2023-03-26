extends Node2D

var start_time_msec = 0
var fbi_guy_catch_elapsed = 0.0
var elapsed = 0.0

const FBI_SPEED = 100.0
const MSEC_FT_NUMER = 77.0
const MSEC_FT_DENOM = 7500.0

func get_feet_traveled():
	return int(floor(((Time.get_ticks_msec() - start_time_msec) * MSEC_FT_NUMER) / MSEC_FT_DENOM))

# Called when the node enters the scene tree for the first time.
func _ready():
	start_time_msec = Time.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.dead:
		$"Obstacle Spawner".murder_all_offspring()
		$"FBI Guy/Animations".play("walk_down")
		if $"FBI Guy".position.y > $Player.position.y - 48:
			$"FBI Guy".position.y -= FBI_SPEED * delta
		else:
			fbi_guy_catch_elapsed += delta
			if fbi_guy_catch_elapsed >= 0.5:
				get_tree().change_scene_to_file("res://Game OVer.tscn")
		return
	elapsed += delta
	$"Infinite Road/Sidewalk".position.y = fmod((150 * elapsed), 15)
	$"FBI Guy".position = $Player.position
	$"FBI Guy/Animations".play($Player/Animations.animation)
	var str_display = ""
	str_display += str(get_feet_traveled())
	str_display += " ft ran"
	$"Camera2D/Distance Display".set_desired_string(str_display)
	$"Player Shadow".position.x = $Player.position.x
