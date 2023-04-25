extends Node2D

func _ready():
	pass

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje

var trenutna_igra : Dictionary

#template#

#var level = {
#	"polje" :        ,
#	"zabica" :      ,
#	"muhe" :     ,
#	"vrste_potez" :     ,
#	"stevilo_potez" : 
#}



var test = {
	"polje" : naredi_polje(7,7),
	"zabica" : Vector2(1,1),
	"muhe" : naredi_polje(7,0) + naredi_polje(6,6,4,4),
	"vrste_potez" : ["konj","lovec","trdnjava","kralj","dama","dash"],
	"stevilo_potez" : {"konj" : 5, "lovec" : 6, "trdnjava" : 3, "kralj" : 4, "dama" : 2, "dash" : 4}
}

var stiri_dame = {
	"vrste_potez" : ["dama"],
	"stevilo_potez" : {"dama" : 4},
	"polje" : naredi_polje(5,5),
	"muhe" : naredi_polje(4,3,2,1),
	"zabica" : Vector2(1,4)
}

var sest_dam = {
	"polje" : naredi_polje(5,5),
	"zabica" : Vector2(1,4),
	"muhe" : naredi_polje(4,3,2,1) + naredi_polje(4,4,2,4) + naredi_polje(1,3,1,1),
	"vrste_potez" : ["dama"],
	"stevilo_potez" : {"dama" : 6}
}

var knights_tour_polovicni = {
	"polje" : naredi_polje(7,3,0,0),
	"zabica" : Vector2(0,3),
	"muhe" : [Vector2(0,2),Vector2(1,0),Vector2(1,1),Vector2(2,2),Vector2(2,3),Vector2(3,0),Vector2(3,1),Vector2(4,2),Vector2(4,3),Vector2(5,0),Vector2(5,1),Vector2(6,2),Vector2(6,3),Vector2(7,0),Vector2(7,1)],
	"vrste_potez" : ["konj"],
	"stevilo_potez" : {"konj" : 15}
}

var knights_tour = {
	"polje" : naredi_polje(7,3,0,0),
	"zabica" : Vector2(0,3),
	"muhe" : naredi_polje(7,3,1,0) + naredi_polje(0,2,0,0),
	"vrste_potez" : ["konj"],
	"stevilo_potez" : {"konj" : 31}
}


var zacetni_level = {
	"polje" : naredi_polje(4,2,0,0) + naredi_polje(6,5,2,3),
	"zabica" : Vector2(1,1),
	"muhe" : [Vector2(3,1)] + naredi_polje(5,4,3,4),
	"vrste_potez" : ["trdnjava"],
	"stevilo_potez" : {"trdnjava" : 3}
}

var diamant = {
	"polje" : naredi_polje(4,4,0,0),
	"zabica" : Vector2(0,2),
	"muhe" : [Vector2(1,1),Vector2(2,0),Vector2(3,1),Vector2(4,2),Vector2(3,3),Vector2(2,4),Vector2(1,3)],
	"vrste_potez" : ["lovec"],
	"stevilo_potez" : {"lovec": 4 }
}

var unknown = {
	"polje" : naredi_polje(6,7),
	"zabica" :  Vector2(1,4)   ,
	"muhe" :  naredi_polje(2,2,2,1) + naredi_polje(4,3,4,1) + naredi_polje(3,5,3,4) + [Vector2(3,0), Vector2(3,7)]  ,
	"vrste_potez" :  ["kralj","dash","konj"]   ,
	"stevilo_potez" : {"kralj" : 2, "dash" : 2, "konj" : 2}
}

var another_brick = {
	"polje" : naredi_polje(2,4) + [Vector2(3,0)] + naredi_polje(6,4,4,0)    ,
	"zabica" : Vector2(1,3)    ,
	"muhe" : [Vector2(5,3)]    ,
	"vrste_potez" :  ["dama","konj"]   ,
	"stevilo_potez" : {"dama" : 2, "konj" : 1}
}

var israel = {
	"polje" :  naredi_polje(6,3)   ,
	"zabica" : Vector2(0,3)    ,
	"muhe" : naredi_polje(2,2,1,1) + naredi_polje(5,2,4,1) + [Vector2(0,0),Vector2(3,0),Vector2(6,0),Vector2(3,3),Vector2(6,3)]    ,
	"vrste_potez" : ["trdnjava","lovec"]    ,
	"stevilo_potez" : {"trdnjava":1, "lovec":4}
}

var noble_knights = {
	"polje" : naredi_polje(4,4)    ,
	"zabica" : Vector2(1,1)   ,
	"muhe" :  naredi_polje(3,3,2,1) + naredi_polje(1,3,1,2)   ,
	"vrste_potez" : ["konj","kralj"]    ,
	"stevilo_potez" : {"konj" : 7, "kralj" : 1}
}

var amogus= {
	"polje" : naredi_polje(1,4,1,1) + naredi_polje(3,4,3,1) + naredi_polje(4,3,2,2) + [Vector2(2,1),Vector2(2,3)]    ,
	"zabica" : Vector2(2,2)    ,
	"muhe" : naredi_polje(1,4,1,1) + naredi_polje(3,4,3,1) + naredi_polje(4,3,4,2) + [Vector2(2,1),Vector2(2,3)]  ,
	"vrste_potez" : ["konj","trdnjava","kralj"]    ,
	"stevilo_potez" : {"konj" : 4, "trdnjava" : 2, "kralj" : 2}
}

var mk = {
	"polje" : naredi_polje(9,4),
	"zabica" : Vector2(0,4),
	"muhe" : naredi_polje(0,3,0,0) + naredi_polje(4,4,4,0) + naredi_polje(6,4,6,0) + [Vector2(1,1),Vector2(2,2),Vector2(3,1),Vector2(9,0),Vector2(8,1),Vector2(7,2),Vector2(8,3),Vector2(9,4)]   ,
	"vrste_potez" : ["dama", "kralj"]     ,
	"stevilo_potez" : {"dama" : 8, "kralj" : 1}
}

var hammer = {
	"polje" : naredi_polje(2,3,0,1) + naredi_polje(5,4,3,0)       ,
	"zabica" : Vector2(1,2)      ,
	"muhe" : naredi_polje(0,3,0,1) + naredi_polje(2,3,2,1) + [Vector2(1,1),Vector2(1,3)] + naredi_polje(5,4,3,0)    ,
	"vrste_potez" : ["trdnjava"]    ,
	"stevilo_potez" : {"trdnjava" : 9} 
}

var kitajski_zid = {
	"polje" : naredi_polje(2,7,0,0) + naredi_polje(4,0,3,0) + naredi_polje(7,7,5,0)       ,
	"zabica" : Vector2(1,6)     ,
	"muhe" : [Vector2(6,7)]    ,
	"vrste_potez" : ["konj","dama"]    ,
	"stevilo_potez" : {"konj":5, "dama":1}
}

var zanimivo = {
	"polje" : naredi_polje(6,4,0,0)       ,
	"zabica" : Vector2(1,2)      ,
	"muhe" : [Vector2(1,2),Vector2(5,2)]    ,
	"vrste_potez" : ["trdnjava" , "konj" , "lovec"]     ,
	"stevilo_potez" : {"trdnjava" : 1, "konj": 1 , "lovec" : 1  }
}

var imposter= {
	"polje" : naredi_polje(5,5)    ,
	"zabica" : Vector2(2,2)    ,
	"muhe" : naredi_polje(1,4,1,1) + naredi_polje(3,4,3,1) + naredi_polje(4,3,4,2) + [Vector2(2,1),Vector2(2,3)]  ,
	"vrste_potez" : ["konj","trdnjava","kralj"]    ,
	"stevilo_potez" : {"konj" : 5, "trdnjava" : 2, "kralj" : 1}
}

var spiral = {
	"polje" : naredi_polje(6,6,6,0) + naredi_polje(5,6,0,6) + naredi_polje(0,5,0,0) + naredi_polje(4,0,1,0) + naredi_polje(4,4,4,1) + naredi_polje(3,4,2,4) + naredi_polje(2,3,2,2)      ,
	"zabica" : Vector2(6,0)      ,
	"muhe" : naredi_polje(6,6,6,1) + naredi_polje(5,6,0,6) + naredi_polje(0,5,0,0) + naredi_polje(4,0,1,0) + naredi_polje(4,4,4,1) + naredi_polje(3,4,2,4) + naredi_polje(2,3,2,2)    ,
	"vrste_potez" : ["trdnjava","konj"]    ,
	"stevilo_potez" : {"trdnjava" : 6 ,"konj" : 3 }
}

var slovar_levelov = {
	"test" : test,
	"4_dame" : stiri_dame,
	"6_dam" : sest_dam,
	"knights_tour_polovicni" : knights_tour_polovicni,
	"zacetni_level" : zacetni_level,
	"diamant" : diamant,
	"unknown" : unknown,
	"another_brick" : another_brick,
	"israel" : israel,
	"noble_knights" : noble_knights,
	"amogus" : amogus,
	"mk" : mk,
	"hammer" : hammer,
	"imposter" : imposter,
	"kitajski_zid" : kitajski_zid,
	"zanimivo" : zanimivo,
	"spiral" : spiral,
	"knights_tour" : knights_tour
}

var narejeni_leveli = {
	"test" : false,
	"4_dame" : false,
	"6_dam" : false,
	"knights_tour_polovicni" : false,
	"zacetni_level" : false,
	"diamant" : false,
	"unknown" : false,
	"another_brick" : false,
	"israel" : false,
	"noble_knights" : false,
	"amogus" : false,
	"mk" : false,
	"hammer" : false,
	"imposter" : false,
	"kitajski_zid" : false,
	"zanimivo" : false,
	"spiral" : false,
	"knights_tour" : false
}
