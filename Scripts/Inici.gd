extends Node2D


var Partit = preload("res://Escenes/Camp.tscn")

func _ready():
	$Huma.visible = 0
	$Robot.visible = 0

func _on_Inici_pressed():
	$Inici.visible = 0
	$Huma.visible = 1
	$Robot.visible = 1


func _on_Surt_pressed():
	pass # Replace with function body.
