class_name Xapa extends RigidBody2D

export var Equip_B := false;
const xapa_B = preload("res://Assets/xapa 2.png")
const xapa_A = preload("res://Assets/xapa 1.png") 
var _posInicial: Vector2  
var friccio = -10

var enMov = false

var Moviment:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale=0
	if (Equip_B):
		$Xapa.set_texture(xapa_B)
	else:
		$Xapa.set_texture(xapa_A)
		
func Tirar(potencia : Vector2) -> void:
	Moviment = potencia
	enMov = true
	apply_central_impulse(Moviment)


func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos # per quan es faci respawn 	

func _process(delta):
	if enMov: 
		Moviment.x += friccio 
		Moviment.y += friccio 
		if Moviment.x == 0 && Moviment.y == 0 :
			enMov = false

		
