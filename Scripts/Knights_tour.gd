extends Node2D

var igra = preload("res://Scenes/Igra.tscn")

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var vrste_potez_level = ["konj"]

var stevilo_potez_level = {
	"konj" : 31
}
var polje_level = naredi_polje(7,3)
	
var muhe_level = naredi_polje(7,2) + naredi_polje(7,3,1,3)

var zabica_pos_level = Vector2(0,3)

func _ready():
	pass
