class_name Xapa extends RigidBody2D

export var Equip_B := false;
const xapa_B = preload("res://Assets/xapa 2.png")
const xapa_A = preload("res://Assets/xapa 1.png") 
var _posInicial: Vector2  

var pilota
var triada = false
var vel_p:int
var vel:int
signal Proper_Torn()
var torn = false
var quiet


var Moviment:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_pickable ( true )
	gravity_scale=0
	if (Equip_B):
		$Xapa.set_texture(xapa_B)
		$Vec_DIR.Equip_B=true
	else:
		$Xapa.set_texture(xapa_A)	
	pilota = get_tree().get_nodes_in_group("Pilota")[0]

		
func Tirar(potencia : Vector2) -> void:
	Moviment = potencia
	apply_central_impulse(Moviment)
	triada = true	
	Singleton.treure_torn()


func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	
	rotation_degrees = 0
	
func respawn():
	position = _posInicial

func _integrate_forces(state):
	if Singleton.respawn && position!=_posInicial:
		state.transform.origin=_posInicial
		state.linear_velocity=Vector2(0,0)
		state.angular_velocity=0
		Singleton.respawn = false
	else:
		#print("NOOO")
		rotation_degrees = 0
		print (vel)
		vel = sqrt((linear_velocity.x*linear_velocity.x)+(linear_velocity.y*linear_velocity.y))
		if triada && (vel<1.3):
			print("ara")
			triada = false
			$Xapa.modulate=Color(1,1,1)
			if$Vec_DIR.is_in_group("Llençada"):
				$Vec_DIR.remove_from_group("Llençada")
			emit_signal("Proper_Torn")



func _on_Xapa_mouse_entered():
	print("hola xapa")
	if (!Equip_B && Singleton.Torn ==1)||(Equip_B && Singleton.Torn==2):
		if(get_tree().get_nodes_in_group("Llençada").empty()):
			$Xapa.modulate=Color(1.6,1.6,1.6)
	
func _on_Xapa_mouse_exited():
	if (!Equip_B && Singleton.Torn ==1)||(Equip_B && Singleton.Torn==2):
		if !triada:
			$Xapa.modulate=Color(1,1,1)


func _on_Vec_DIR_Triat():
	triada = true
	$Xapa.modulate=Color(1.6,1.6,1.6)
	

func _on_Vec_DIR_Suspes():
	$Vec_DIR.suspendre()
	triada =false
	$Xapa.modulate=Color(1,1,1)


func _on_Xapa_body_entered(body):
	print("xapa xoca")
