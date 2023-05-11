extends Node2D


func _on_Igraj_button_up():
	get_tree().change_scene("res://Scenes/Level_select.tscn")
	






func _on_Pravila_igre_button_up():
	get_tree().change_scene("res://Scenes/Pravlia_igre.tscn")
	pass

func _on_O_projektu_button_up():
	get_tree().change_scene("res://Scenes/O_projektu.tscn")
	pass
