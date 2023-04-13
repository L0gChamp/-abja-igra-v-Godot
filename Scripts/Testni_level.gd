extends Node2D

var igra = preload("res://Scenes/Igra.tscn")

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var vrste_potez_level = ["konj","lovec","trdnjava","kralj","dama","dash"]

var stevilo_potez_level = {
	"konj" : 5,
	"lovec" : 6,
	"trdnjava" : 3,
	"kralj" : 4,
	"dama" : 2,
	"dash" : 4
}
 
var polje_level = naredi_polje(7,7)
	
var muhe_level = naredi_polje(7,0) + naredi_polje(6,6,4,4)

var zabica_pos_level = Vector2(1,1)

func _ready():
	pass


