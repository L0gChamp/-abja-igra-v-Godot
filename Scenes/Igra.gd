extends Node2D

var vrste_potez = ["konj","lovec","trdnjava","kralj","dama","dash"]
var stevilo_potez = [10,10,10,10,10,5,]

var trenutna_poteza_igra = "lovec"


func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var muhe_igra = naredi_polje(7,0) + naredi_polje(6,6,4,4)



func _ready():
	pass


func spremeni_potezo_igra(vrednost) -> void:
	$"Šahovnica".spremeni_premikanje(vrednost)
	
func spremeni_vidljivost_igra() -> void:
	$"Šahovnica".spremeni_vidljivost_sahovnica()

