extends Node2D

func _ready():
	pass
	
	

func _on_Undo_button_up():
	get_parent().undo()
	
	
func _on_Restart_button_up():
	get_parent().restart()
