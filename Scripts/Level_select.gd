extends Node2D

func _ready():
	pass 

func odstrani_sceno():
	get_tree().get_root().remove_child(self)


func _on_nazaj_button_up():
	get_tree().change_scene("res://Scenes/Title_screen.tscn")

