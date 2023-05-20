extends CanvasLayer

var Temps_total
var Temps_tornA
var Temps_tornB
var TBA1
var TBA2
var TBA3
var TBA4
var TBA5
var TBB1
var TBB2
var TBB3
var TBB4
var TBB5

signal TEMPS()

func _ready():
	$"TEMPS total".text=str(Singleton._TempsTotal)
	Temps_tornA=Singleton._TempsTorn
	Temps_tornB=Singleton._TempsTorn
	Temps_total=Singleton._TempsTotal
	$"TEMPS total".text=str(Temps_total/60)+":"+str(Temps_total%60)
	$"Temps B".text = str(Temps_tornA)
	$"Temps A".text = str(Temps_tornB)
	$TTorn.visible=0
	$TTorn2.visible=0
	$"Temps A".visible=0
	$"Temps B".visible=0
	

func Gol(a):
	if a == "A":
		Singleton.Punts_E1 += 1
		$"Gols A".text=str(Singleton.Punts_E1) 
	else:
		Singleton.Punts_E2 += 1
		$"Gols B".text=str(Singleton.Punts_E2) 
		

func Banqueta(num,eq):
	var nom = "TB"+ str(eq) + str(num)
	var quin = "B"+str(eq)+str(num)

func actualitzar_temps():
	Temps_total-=1
	if Temps_total<=0:
		Singleton.treure_torn()
		Singleton.Pantalla_final()
	$"TEMPS total".text = str(Temps_total/60)+":"+str(Temps_total%60)
	if Singleton.Torn==1:
		if Temps_tornA<=0:
			emit_signal("TEMPS")
			pass
		Temps_tornA-=1
		$"Temps A".text = str(Temps_tornA)
	elif Singleton.Torn==2:
		if Temps_tornB<=0:
			emit_signal("TEMPS")
			pass
		Temps_tornB-=1
		$"Temps B".text = str(Temps_tornB)

func mostrar_torn(a):
	print(a)
	if a == 1:
		$"Torn Equip".text=str(Singleton.Equip1)
		Temps_tornA=Singleton._TempsTorn
		$"Temps A".text=str(Temps_tornA)
		$TTorn.visible=1
		$"Temps A".visible=1
		$"Temps B".visible=0
		$TTorn2.visible=0
	else:
		$"Torn Equip".text=str(Singleton.Equip2)
		Temps_tornB=Singleton._TempsTorn
		$"Temps B".text=str(Temps_tornB)
		$"Temps B".visible=1
		$TTorn2.visible=1
		$"Temps A".visible=0
		$TTorn.visible=0

	
