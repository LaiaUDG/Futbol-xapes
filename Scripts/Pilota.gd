class_name Pilota extends RigidBody2D

var _posInicial: Vector2  
var respawn = false;
var quiet
var vel:int
var colisions

func _ready():
	colisions = 0
	add_to_group("Pilota")
	#print(get_tree().get_nodes_in_group("Pilota")[0].global_position)

func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	
	
func gol():
	respawn=true

func _process(delta):	
	#print ("pilota" + str(vel))
	vel = sqrt((linear_velocity.x*linear_velocity.x)+(linear_velocity.y*linear_velocity.y))
	#print(quiet)
	if vel < 2:
		quiet = true
	else: 
		quiet = false
	#print(colisions)

func _integrate_forces(state):
	if respawn:
		state.transform.origin=_posInicial
		state.linear_velocity=Vector2(0,0)
		state.angular_velocity=0
		quiet = true
		respawn=false
		colisions = 0


func _on_RigidBody2D_body_entered(body):
	print("AAAAh")
	if body is RigidBody2D: 
		colisions +=1

