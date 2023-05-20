class_name Pilota extends RigidBody2D

var _posInicial: Vector2  
var respawn = false;

func _ready():
	pass

func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	
	
func gol():
	respawn=true

func _integrate_forces(state):
	if respawn:
		state.transform.origin=_posInicial
		state.linear_velocity=Vector2(0,0)
		respawn=false
