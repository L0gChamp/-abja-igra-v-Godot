extends Node2D

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var vrste_potez_level = ["konj"]

var stevilo_potez_level = {
	"konj" : 15
}
var polje_level = naredi_polje(7,3)
	
var muhe_level = [Vector2(0,2),Vector2(1,0),Vector2(1,1),Vector2(2,2),Vector2(2,3),Vector2(3,0),Vector2(3,1),Vector2(4,2),Vector2(4,3),Vector2(5,0),Vector2(5,1),Vector2(6,2),Vector2(6,3),Vector2(7,0),Vector2(7,1)]

var zabica_pos_level = Vector2(0,3)

func _ready():
	pass

