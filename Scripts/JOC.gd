extends Node2D


var _xapa:=preload("res://Escenes/Xapa.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 5:
		var xapa=_xapa.instance()
		xapa.set_name("xapaA"+str(i))	
		var dir = get_node("A"+str(i))
		xapa.set_pos_inicial(dir.position)
		xapa.Equip_B=false
		xapa.scale = Vector2(0.4,0.4)
		xapa.add_to_group("A")
		add_child(xapa)
	for i in 5:
		var xapa =_xapa.instance()
		xapa.set_name("xapaB"+str(i))
		var dir = get_node("B"+str(i))
		xapa.set_pos_inicial(dir.position)
		xapa.Equip_B=true
		xapa.scale = Vector2(0.4,0.4)
		xapa.add_to_group("B")
		add_child(xapa)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
