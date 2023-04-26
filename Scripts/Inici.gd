extends Node2D


var Partit = preload("res://Escenes/Camp.tscn")

func _ready():
	pass # Replace with function body.


func _on_Inici_pressed():
	get_tree().change_scene_to(Partit)


func _on_Surt_pressed():
	pass # Replace with function body.
