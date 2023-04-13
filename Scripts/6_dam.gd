extends Node2D


var igra = preload("res://Scenes/Igra.tscn")

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var vrste_potez_level = ["dama"]

var stevilo_potez_level = {
	"dama" : 6
}
var polje_level = naredi_polje(5,5)
	
var muhe_level = naredi_polje(4,3,2,1) + naredi_polje(4,4,2,4) + naredi_polje(1,3,1,1)

var zabica_pos_level = Vector2(1,4)

func _ready():
	pass

