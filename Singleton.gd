extends Node

const Partit := preload("res://Escenes/JOC.tscn");
const Inici := preload("res://Escenes/Inici.tscn");
const PILOTA :=preload("res://Escenes/Pilota.tscn");

var Punts_E1:int
var Punts_E2:int
var TornAnt:int
var Torn:int
var _TempsTotal:int
var _TempsTorn:int
var _Acabada:bool
var Equip1
var Equip2
var _Joc2
var _pilota
var respawn

func _init():
	respawn = false
	Punts_E1=0;Punts_E2=0;
	_Acabada = false;
	Equip1 = "Equip A"
	Equip2 = "Equip B"
	Torn = 0
	TornAnt=0
	_TempsTotal=90
	_TempsTorn=15
	_Joc2 = false
	_pilota = PILOTA.instance()
	
func treure_torn():
	print("Torn act:"+str(Torn))
	print ("torn anterior:"+str(TornAnt))
	if Torn != 0:
		TornAnt=Torn
	Torn = 0
	
func seguent_torn():
	if TornAnt==1:
		Torn=2
	else:
		Torn=1

func Pantalla_final():
	_Joc2=false
	_Acabada=true
	get_tree().change_scene_to(Inici)

func Joc():
	_Acabada=false
	get_tree().change_scene_to(Partit)

func Surt():
	get_tree().quit()
