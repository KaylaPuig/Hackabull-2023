extends AnimatedSprite2D

const FONTMAPCHARS = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

var current_index = 0

func _process(delta):
	set_frame_and_progress(current_index, 0.0)

func show_character(character:String):
	var ind = FONTMAPCHARS.find(character.substr(0, 1))
	if ind >= 0 and ind <= FONTMAPCHARS.length():
		current_index = ind

func get_character() -> String:
	return FONTMAPCHARS.substr(current_index, 1)
