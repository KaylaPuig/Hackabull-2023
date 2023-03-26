extends Node2D

const funny_quotes = [
	"Boom! Felony!",
	"You can evade taxes, but you can't  evade me!",
	"Hackabull 2023 Exclusive",
	"Knightro would not be proud...",
	"With great income comes great       incentive to lie."
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func make_string():
	var quote = funny_quotes[randi() % funny_quotes.size()]
	for i in range(quote.length()):
		var letter = load("res://Letter.tscn").instantiate()
		letter.show_character(quote.substr(i, 1))
		letter.position.x = 12 * (i % 36)
		letter.position.y = 18 * (i / 36)
		add_child(letter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
