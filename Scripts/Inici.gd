class_name Inici extends Node2D


func _ready():
	if Singleton._Acabada:
		Mostrar_resultats()
	else:
		$Huma.visible = 0;
		$Robot.visible = 0;
		$CanvasLayer.visible=0

func _on_Inici_pressed():
	$Inici.visible = 0
	#Singleton.Joc()
	$Huma.visible = 1
	$Robot.visible = 1

func mostrar_anterior():
	if Singleton.Punts_E1>Singleton.Punts_E2: 
		$CanvasLayer/Guanyador.visible=1
		$CanvasLayer/Perd.visible=1
		$CanvasLayer/Guanyador2.text = Singleton.Equip1
		$CanvasLayer/Empat.visible = 0
	elif Singleton.Punts_E2>Singleton.Punts_E1:
		$CanvasLayer/Guanyador.visible=1
		$CanvasLayer/Perd.visible=1
		$CanvasLayer/Guanyador2.text = Singleton.Equip2
		$CanvasLayer/Empat.visible = 0
	else:
		$CanvasLayer/Guanyador.visible=0
		$CanvasLayer/Perd.visible=0
		$CanvasLayer/Empat.visible = 1
	$CanvasLayer.visible=1
	
func _on_Surt_pressed():
	Singleton.Surt()

func Mostrar_resultats():
	$Inici.visible = 1
	$Label.visible= 0
	$Huma.visible=0
	$Robot.visible=0
	if Singleton.Punts_E1 == Singleton.Punts_E2:
		$CanvasLayer/Empat.visible=1
		$CanvasLayer/Guanyador.visible = 0
		$CanvasLayer/Perd.visible=0
	else:
		$CanvasLayer/Empat.visible=0
		if Singleton.Punts_E1>Singleton.Punts_E2:
			$CanvasLayer/Guanyador2.text = str(Singleton.Equip1)
			$CanvasLayer/Perd2.text = str(Singleton.Equip2)
		else:
			$CanvasLayer/Guanyador2.text = str(Singleton.Equip2)
			$CanvasLayer/Perd2.text = str(Singleton.Equip1)
	$CanvasLayer/PuntsA.text = str(Singleton.Punts_E1)
	$CanvasLayer/PuntsB.text = str(Singleton.Punts_E2)
	$CanvasLayer.visible=1


func _on_Huma_pressed():
	Singleton._Joc2 = false
	Singleton.Joc()


func _on_Robot_pressed():
	Singleton._Joc2 = true
	Singleton.Joc()
