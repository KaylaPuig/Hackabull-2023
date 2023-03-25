extends AnimatedSprite2D

const FONTMAPCHARS = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

func _input(event):
	if event is InputEventKey:
		var c = str(char(event.unicode))
		show_character(c)

func show_character(character:String):
	var ind = FONTMAPCHARS.find(character.substr(0, 1))
	set_frame_and_progress(ind, 0.0)
