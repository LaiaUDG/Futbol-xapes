extends RigidBody2D


var _posInicial: Vector2 
var triada = false
var vel:int
signal Proper_Torn()
var torn = false
var Moviment:Vector2
var _pilota:Pilota


func _ready():
	gravity_scale=0


func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	


func _integrate_forces(state):
	rotation_degrees = 0
	vel = sqrt((linear_velocity.x*linear_velocity.x)+(linear_velocity.y*linear_velocity.y))#.normalize
	if triada && (vel<1.3):
		print("ara")
		triada = false
		$Xapa.modulate=Color(1,1,1)
		emit_signal("Proper_Torn")

func _physics_process(delta):
	var espai = get_world_2d().direct_space_state
	var dir = espai.intersect_ray(global_position,
