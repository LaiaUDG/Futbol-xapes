extends RigidBody2D


var _posInicial: Vector2 
var triada = false
var vel:int
signal Proper_Torn()
var torn = false
var Moviment:Vector2
var _pilota


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
		triada = false
		$Xapa.modulate=Color(1,1,1)
		emit_signal("Proper_Torn")



func _physics_process(delta):
	_pilota = get_tree().get_nodes_in_group("Pilota")[0]
	$RayCast2D.set_cast_to(_pilota.global_position)
	var obj = $RayCast2D.get_collider()
	if obj:
		print(obj)
	print ("pilota:"+str(_pilota.global_position))
	update()
	
func _draw():
	print(str(global_position) + str(_pilota.global_position))
	draw_line(global_position, _pilota.global_position, Color.blue, 12)
	
