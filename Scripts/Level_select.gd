extends Node2D


func _ready():
	pass 

func odstrani_sceno():
	get_tree().get_root().remove_child(self)
