extends Node2D

var singularni_gumb = preload("res://Scenes/Singularni_gumb.tscn")

var stevec = preload("res://Scenes/poteza_števec.tscn")

var poteze = []

var stevilo_potez = []

func _ready():
	poteze = get_parent().vrste_potez
	stevilo_potez = get_parent().stevilo_potez

	var y = 0
	for i in poteze:
		var s = singularni_gumb.instance()
		s.position = Vector2(0,y*64)
		s.vrednost = i
		s.text = i
		s.stevilo = stevilo_potez[y]
		add_child(s)
		
		var stev = stevec.instance()
		stev.position = Vector2(196,y*64)
		stev.vrednost = stevilo_potez[y]
		stev.text = stevilo_potez[y]
		add_child(stev)
		
		y += 1

func spremeni_potezo_gumbi(vrednost):
	get_parent().spremeni_potezo_igra(vrednost)

func spremeni_vidljivost_gumbi():
	get_parent().spremeni_vidljivost_igra()
