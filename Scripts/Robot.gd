class_name Robot extends RigidBody2D


var _posInicial: Vector2 
var triada = false
var vel:int
signal Proper_Torn()
var torn = false
var Moviment:Vector2
var _pilota
var _DisCol
var _Colisio
var rng = RandomNumberGenerator.new()


func _ready():
	gravity_scale=0
	print(get_tree().get_nodes_in_group("Pilota"))
	_pilota = get_tree().get_nodes_in_group("Pilota")[0]

func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	


func _integrate_forces(state):
	rotation_degrees = 0
	vel = sqrt((linear_velocity.x*linear_velocity.x)+(linear_velocity.y*linear_velocity.y))#.normalize
	print(vel)
	if triada && (vel<1.3):
		triada = false
		print("ara")
		modulate=Color(1,1,1)
		$Xapa.modulate=Color(1,1,1)
		emit_signal("Proper_Torn")


func Torn():
	$RayCast2D.set_cast_to(_pilota.global_position-global_position)
	if $RayCast2D.is_colliding():
		var pos = $RayCast2D.get_collision_point();
		var obj = $RayCast2D.get_collider()
		_DisCol = sqrt((global_position.x-obj.global_position.x)*(global_position.x-obj.global_position.x)+(global_position.y-obj.global_position.y)*(global_position.y-obj.global_position.y))
		if obj is Pilota:
			add_to_group("Pot_llençar")
			print("Pilota"+str(_DisCol))
			Triar_tirada()
		else:
			_Colisio=true
			remove_from_group("Pot_llençar")
			print ("Collisio"+str(_DisCol)+str(obj))
	update()

func _physics_process(delta):
	_pilota = get_tree().get_nodes_in_group("Pilota")[0]
	$RayCast2D.set_cast_to(_pilota.global_position-global_position)
	if Singleton.Torn==2:
		Torn()
	update()
	
func Triar_tirada():
	var opcions=get_tree().get_nodes_in_group("Pot_llençar")	
	print (opcions)
	var minim = opcions[0]

	for i in opcions: 
		print(i)
		if i._DisCol<minim._DisCol:
			minim=i
	if minim._posInicial == _posInicial:
		modulate=Color(1.6,1.6,1.6)
		triada =true
		tirar()

func tirar():
	rng.randomize()
	var potencia = rng.randi_range(120,250)
	var Moviment = -(global_position - _pilota.global_position).clamped(potencia)
	Singleton.treure_torn()	
	apply_central_impulse(Moviment)	
	

	
	
