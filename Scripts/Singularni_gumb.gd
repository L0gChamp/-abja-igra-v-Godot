extends Node2D

var vrednost

var text

signal vidljivost_tock

signal spremeni_potezo

func _ready():
	$Gumb.text = text 
	
func _on_Gumb_button_up():
	get_parent().spremeni_potezo_gumbi(vrednost)
	get_parent().spremeni_vidljivost_gumbi()
