extends Node2D

var start_time_msec = 0
var fbi_guy_catch_elapsed = 0.0
var elapsed = 0.0
var final_feet_traveled = INF

const FBI_SPEED = 100.0
const MSEC_FT_NUMER = 77.0
const MSEC_FT_DENOM = 7500.0

func get_feet_traveled():
	return int(floor(((Time.get_ticks_msec() - start_time_msec) * MSEC_FT_NUMER) / MSEC_FT_DENOM))

# Called when the node enters the scene tree for the first time.
func _ready():
	start_time_msec = Time.get_ticks_msec()
	$Song.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.dead:
		if get_feet_traveled() < final_feet_traveled:
			final_feet_traveled = get_feet_traveled()
		$"Obstacle Spawner".murder_all_offspring()
		$"FBI Guy/Animations".play("walk_down")
		if $"FBI Guy".position.y > $Player.position.y - 48:
			$"FBI Guy".position.y -= FBI_SPEED * delta
		else:
			fbi_guy_catch_elapsed += delta
			if fbi_guy_catch_elapsed >= 0.5:
				var game_over = load("res://Game OVer.tscn").instantiate()
				game_over.set_feet(final_feet_traveled)
				get_tree().get_root().add_child(game_over)
				get_node(".").free()
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
