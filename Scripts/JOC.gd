extends Node2D


var _xapa:=preload("res://Escenes/Xapa.tscn")
var _robot:=preload("res://Escenes/Robot.tscn")
var pilota
var rng = RandomNumberGenerator.new()
var torn

# Called when the node enters the scene tree for the first time.
func _ready():
	pilota = Singleton._pilota
	pilota.set_pos_inicial($PosB.position)
	pilota.set_name("Pilota")
	add_child(pilota)
	for i in 5:
		var xapa=_xapa.instance()
		xapa.set_name("xapaA"+str(i))	
		var dir = get_node("A"+str(i))
		xapa.set_pos_inicial(dir.position)
		xapa.Equip_B=false
		xapa.scale = Vector2(0.4,0.4)
		xapa.add_to_group("A")
		xapa.connect("Proper_Torn",self,"Proper_Torn")
		add_child(xapa)
	if Singleton._Joc2:
		for i in 5:
			var xapa=_robot.instance()
			xapa.set_name("xapaB"+str(i))
			var dir = get_node("B"+str(i))
			xapa.set_pos_inicial(dir.position)
			xapa.add_to_group("B")
			xapa.connect("Proper_Torn",self,"Proper_Torn")
			add_child(xapa)
	else:
		for i in 5:
			var xapa =_xapa.instance()
			xapa.set_name("xapaB"+str(i))
			var dir = get_node("B"+str(i))
			xapa.set_pos_inicial(dir.position)
			xapa.Equip_B=true
			xapa.scale = Vector2(0.4,0.4)
			xapa.add_to_group("B")
			xapa.connect("Proper_Torn",self,"Proper_Torn")
			add_child(xapa)
	rng.randomize()
	torn = rng.randi_range(1, 2)
	$HUD.mostrar_torn(torn)
	Singleton.Torn=torn
	$Timer.start()


func _reinicia():
	Singleton.respawn=true
	for i in 5:
		var dirA = get_node("A"+str(i))
		var dirB = get_node("B"+str(i))
		var XA = get_node("xapaA"+str(i))
		var XB = get_node("xapaB"+str(i))
		XA.respawn()
		XB.respawn()
	

func _on_Porteria_B_Gol():
	_reinicia()
	if pilota.colisions > 1:
		$HUD.Gol("A")
	pilota.gol()

func _on_Porteria_A_Gol():
	_reinicia()
	if pilota.colisions > 1:
		$HUD.Gol("B")
	pilota.gol()

func Proper_Torn():
	print("Canvi torn")
	print (Singleton.Torn)
	if Singleton.Torn == 1:
		get_tree().call_group("A","_on_Vec_DIR_Suspes")
	elif Singleton.Torn == 2:
		get_tree().call_group("B","_on_Vec_DIR_Suspes")
	Singleton.treure_torn()
	Singleton.seguent_torn()
	$HUD.mostrar_torn(Singleton.Torn)
	

func _on_Timer_timeout():
	$HUD.actualitzar_temps()





