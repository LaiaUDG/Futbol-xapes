extends RigidBody2D


var _posInicial: Vector2 
var triada = false
var vel:int
signal Proper_Torn()
var torn = false
var Moviment:Vector2
var _pilota
var _DisCol
var _Colisio


func _ready():
	gravity_scale=0
	print(get_tree().get_nodes_in_group("Pilota"))
	

func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	


func _integrate_forces(state):
	rotation_degrees = 0
	vel = sqrt((linear_velocity.x*linear_velocity.x)+(linear_velocity.y*linear_velocity.y))#.normalize
	if triada && (vel<1.3):
		print("ara")
		$Xapa.modulate=Color(1,1,1)
		emit_signal("Proper_Torn")


func _physics_process(delta):
	_pilota = get_tree().get_nodes_in_group("Pilota")[0]
	$RayCast2D.set_cast_to(_pilota.global_position-global_position)
	if Singleton.Torn==2:
		Triar_tirada()
	if $RayCast2D.is_colliding():
		var pos = $RayCast2D.get_collision_point();
		var obj = $RayCast2D.get_collider()
		_DisCol = sqrt((global_position.x-obj.global_position.x)*(global_position.x-obj.global_position.x)+(global_position.y-obj.global_position.y)*(global_position.y-obj.global_position.y))
		if obj is Pilota:
			add_to_group("Pot_llençar")
			print("Pilota"+str(_DisCol))
		else:
			_Colisio=true
			remove_from_group("Pot_llençar")
			print ("Collisio"+str(_DisCol)+str(obj))
	update()
	
func Triar_tirada():
	var opcions=get_tree().get_nodes_in_group("Pot_llençar")	
	print (opcions)
	#var minim = opcions[0]

	#for i in opcions: 
	#	print(opcions[i])
		#if opcions[i]._DisCol<minim._DisCol:
		#	minim=opcions[i]
	#if minim._posInicial == _posInicial:
	#	tirar()

func tirar():
	var Moviment = -(global_position - _pilota.global_position).clamped(200)
	Singleton.treure_torn()
	apply_central_impulse(Moviment)	
	
func _draw():
	#print(str(global_position) + str(_pilota.global_position))
	draw_line(Vector2(0,0), _pilota.global_position-global_position, Color.blue, 12)
	
