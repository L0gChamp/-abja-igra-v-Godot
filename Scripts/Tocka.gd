extends Node2D

var pos : Vector2

var mozne_poteze = []

func _ready():
	if pos in mozne_poteze:
		show()
	else:
		hide()
	pass

func spremeni_vidljivost():
	mozne_poteze = get_parent().mozne_poteze
	if pos in mozne_poteze:
		show()
	else:
		hide()

