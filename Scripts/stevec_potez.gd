extends Node2D

var text 

var vrednost

func _ready():
	$Button.text = String(text)

func update_stevec():
	$Button.text = String(text)
