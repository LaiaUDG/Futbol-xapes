extends Area2D

signal vector_created(vector)

export var max_potencia:=200

var tocat :=false
var pos_ini :=Vector2.ZERO
var pos_fi := Vector2.ZERO
var DIR := Vector2.ZERO

func _ready():
	connect("input_event", self, "_on_input_event")

func _reset():
	pos_ini = Vector2.ZERO
	pos_fi = Vector2.ZERO
	DIR =Vector2.ZERO
	
	update()

func _draw():
	draw_line(pos_ini - global_position, (pos_ini - global_position + DIR), Color.blue, 12)
	
func _input(event):
	if not tocat:
		return
	
	if event.is_action_released("premer"):
		tocat =false
		emit_signal("vector_created", DIR)
		_reset()
		
	if event is InputEventMouseMotion:
		pos_fi = event.position
		DIR = -(pos_fi - pos_ini).clamped(max_potencia)
		update()
	


func _on_input_event(_viewport, event, _shape_idx) -> void:
		if event.is_action_pressed("premer"):
			tocat = true
			pos_ini = event.position
			print("hola")
