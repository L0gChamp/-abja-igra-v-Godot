extends Node2D

var vrste_potez 

var stevilo_potez_igra

var polje_igra 

var muhe_igra 

var zabica_pos_igra

func update_stevilo_potez(stevilo_potez):
	$Gumbi_za_poteze.update_stevilo_potez_gumbi(stevilo_potez)


func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var slovar_igre : Dictionary

var ker_level : String

func _ready():
	slovar_igre.duplicate()
	vrste_potez = slovar_igre["vrste_potez"].duplicate()
	stevilo_potez_igra = slovar_igre["stevilo_potez"].duplicate()
	polje_igra = slovar_igre["polje"].duplicate()
	muhe_igra = slovar_igre["muhe"].duplicate()
	zabica_pos_igra = slovar_igre["zabica"]
	
	$"Šahovnica"._zacni()
	$"Gumbi_za_poteze"._zacni()

func spremeni_potezo_igra(vrednost) -> void:
	$"Šahovnica".spremeni_premikanje(vrednost)
	
func spremeni_vidljivost_igra() -> void:
	$"Šahovnica".spremeni_vidljivost_sahovnica()

func _on_Button_button_up():
	get_tree().change_scene("res://Scenes/Level_select.tscn")
	get_tree().get_root().remove_child(self)

func level_complete():
	Global.narejeni_leveli[ker_level] = true
	$Gumbi_za_poteze.level_complet()
