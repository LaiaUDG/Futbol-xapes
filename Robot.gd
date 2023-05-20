extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _posInicial: Vector2 
var triada = false
var vel:int
signal Proper_Torn()
var torn = false
var Moviment:Vector2


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
		if$Vec_DIR.is_in_group("Llençada"):
			$Vec_DIR.remove_from_group("Llençada")
		emit_signal("Proper_Torn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
