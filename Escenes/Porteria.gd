extends StaticBody2D


signal Gol (a)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_GOL_body_entered(body):
	if body is Pilota:
		emit_signal("Gol")
