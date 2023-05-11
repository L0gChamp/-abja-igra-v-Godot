extends Node2D

var singularni_gumb = preload("res://Scenes/Singularni_gumb.tscn")

var stevec = preload("res://Scenes/stevec_potez.tscn")

var poteze = []

var stevilo_potez_gumbi

var vsi_stevci = []

var pomozna_tocka

var level_complete = preload("res://Scenes/level_complete.tscn")

var undo_restart = preload("res://Scenes/undo_restart.tscn").instance()

func update_stevilo_potez_gumbi(stevilo_potez):
	stevilo_potez_gumbi = stevilo_potez
	stevilo_potez_gumbi.duplicate()
	spremeni_stevce()
	
	
func _ready():
	pass
	
func _zacni():
	poteze = get_parent().vrste_potez
	stevilo_potez_gumbi = get_parent().stevilo_potez_igra
	var y = 0
	for i in poteze:
		var s = singularni_gumb.instance()
		s.position = Vector2(0,y*70)
		s.vrednost = i
		s.text = i 
		add_child(s)
		
	
		var ste = stevec.instance()
		ste.position = Vector2(196,y*70)
		ste.text = stevilo_potez_gumbi[s.vrednost]
		ste.vrednost = s.vrednost
		add_child(ste)
		vsi_stevci.append(ste)
		
		y += 1
	
	undo_restart.position = Vector2(0, y * 70)
	add_child(undo_restart)
	
	y += 1
	pomozna_tocka = Vector2(0, y * 70)

func spremeni_stevce():
	for i in vsi_stevci:
		i.text = stevilo_potez_gumbi[i.vrednost]
		i.update_stevec()

func spremeni_potezo_gumbi(vrednost):
	get_parent().spremeni_potezo_igra(vrednost)

func spremeni_vidljivost_gumbi():
	get_parent().spremeni_vidljivost_igra()
	
func level_complet():
	var lc = level_complete.instance()
	lc.position = pomozna_tocka
	add_child(lc)

func undo():
	get_parent().undo()

func restart():
	get_parent().restart()
