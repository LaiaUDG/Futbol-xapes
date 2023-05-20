extends Area2D

signal vector_created(vector)
signal Triat()
signal Suspes()

export var max_potencia:=300
export var Equip_B = false

var tocat :=false
var pos_ini :=Vector2.ZERO
var pos_fi := Vector2.ZERO
var DIR := Vector2.ZERO

func _ready():
	connect("input_event", self, "_on_input_event")
	for nodes in get_tree().get_nodes_in_group("Llençada"):
		nodes.remove_from_group("Llençada")

func _reset():
	pos_ini = Vector2.ZERO
	pos_fi = Vector2.ZERO
	DIR =Vector2.ZERO
	update()

func _draw():
	draw_line(pos_ini - global_position, (pos_ini - global_position + DIR), Color.blue, 12)
	
func _input(event):
	if (!Equip_B && Singleton.Torn ==1)||(Equip_B && Singleton.Torn==2):	
		if not tocat && !is_in_group("Llençada"):
			return
		
		if event.is_action_pressed("Disparar"):
			tocat =false
			emit_signal("vector_created", DIR)
			_reset()
			
		if event is InputEventMouseMotion:
			pos_fi = event.global_position
			DIR = -(pos_fi - pos_ini).clamped(max_potencia)
			update()
	


func _on_input_event(_viewport, event, _shape_idx) -> void:
	if (!Equip_B && Singleton.Torn ==1)||(Equip_B && Singleton.Torn==2):	
		#print(get_tree().get_nodes_in_group("Llençada").size())
		#for nodes in get_tree().get_nodes_in_group("Llençada"):
		#		print(nodes)
		if !tocat && get_tree().get_nodes_in_group("Llençada").empty():
			if event.is_action_pressed("premer"):
				tocat = true
				pos_ini = event.global_position
				print("hola")
				add_to_group("Llençada")
				emit_signal("Triat")
		else:
			if event.is_action_pressed("premer"):
				tocat = false
				emit_signal("Suspes")
				

func suspendre():
	tocat=false
	remove_from_group("Llençada") 
	_reset()
