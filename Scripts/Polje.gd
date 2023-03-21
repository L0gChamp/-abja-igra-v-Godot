extends Node2D

var pos = Vector2.ZERO

func _ready():
	pass

func _on_Area2D_input_event(vievport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_parent().attempt_move(pos)

