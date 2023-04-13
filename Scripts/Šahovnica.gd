extends Node2D

var polje = preload("res://Scenes/Polje.tscn")

var zabica = preload("res://Scenes/Zabica.tscn").instance()

var tocka = preload("res://Scenes/Tocka.tscn")

var muha_scene = preload("res://Scenes/muha.tscn")

var level_complete = preload("res://Scenes/Level_complet.tscn").instance()

var tile_grid = []

var mozne_poteze = []

var pot_zabice = []

var mozne_tocke = []

var trenutna_poteza

var muhe_list = []

var muhe = []

var stevilo_potez 

var poteze_sahovnica = []

var vrata_odprta = true

var game_state = [] #Žabica_position #muhe #poteze #vrata

var complete = false

var pomozna_tocka

func update_game_state(frog_pos, muhe_list, poteze, vrata):
	var novi_podatki = [frog_pos, muhe_list.duplicate(),poteze.duplicate(),vrata]
	game_state.append(novi_podatki)
	

func reset_gamestate():
	game_state = [game_state[0]]
	
	
func povrni_game_state():
	if len(game_state) >= 2:
		game_state.erase(game_state[-1])

func naredi_polje(n, k, zamik_n=0, zamik_k=0):
	var polje = []
	for i in range(zamik_n, n + 1):
		for j in range(zamik_k, k + 1):
			polje.append(Vector2(i, j))
	return polje


func ustvari_polje(list_polj):
	for nekaj in list_polj:
		var x = nekaj.x
		var y = nekaj.y
		var p = polje.instance()
		p.position = Vector2(x*64,y*64)
		p.pos = Vector2(x,y)
			
		add_child(p)

func nastavi_tocke(x,y):
	for i in range(0,x):
		for j in range(0,y):
			var t = tocka.instance()
			t.position = Vector2(i*64,j*64)
			t.pos = Vector2(i,j)
			add_child(t)
			
			mozne_tocke.append(t)
			
func nastavi_tocke_plus(list_polj):
	for i in list_polj:
		var x = i.x
		var y = i.y
		var t = tocka.instance()
		t.position = Vector2(x,y)
		t.pos = Vector2(x*64,y*64)
		add_child(t)
		mozne_tocke.append(t)

			
func nastavi_muhe(muhe_list):
	for i in muhe_list:
		var m = muha_scene.instance()
		m.pos = Vector2(i[0] , i[1])
		m.position = Vector2(i[0] * 64, i[1] *64)
		add_child(m)
		
		muhe.append(m)
			
func _ready():
	pass
	
func _zacni():
	tile_grid = get_parent().polje_igra
	muhe_list = get_parent().muhe_igra
	stevilo_potez = get_parent().stevilo_potez_igra
	poteze_sahovnica = get_parent().vrste_potez
	ustvari_polje(tile_grid)
	nastavi_tocke(10,8)
	nastavi_muhe(muhe_list)
	add_child(zabica)
#	level_complete.hide()
#	add_child(level_complete)
	
	zabica.pos = get_parent().zabica_pos_igra
	zabica.position = zabica.pos * 64
	
	update_game_state(zabica.pos, muhe_list, stevilo_potez, vrata_odprta)

func preveri_stevilo_potez():
	if trenutna_poteza != null:
		if stevilo_potez[trenutna_poteza] > 0:
			return true

func check_valid(pos):
	if preveri_stevilo_potez():
			if pos in mozne_poteze:
				return true

var test = 0

func attempt_move(pos):
	if (check_valid(pos)):
		var zacetek = zabica.pos
		zabica.pos = pos
		zabica.position = pos * 64
		var konec = pos
		var pot_zabice = nastavi_pot(zacetek,konec,trenutna_poteza)
		spremeni_premikanje(trenutna_poteza)
		stevilo_potez[trenutna_poteza] -= 1
		if preveri_stevilo_potez():
			spremeni_vidljivost_sahovnica()
		else:
			skrij_vidljivost_sahovnica()
		pojej_muhe_list(pot_zabice)
		pojej_muhe(muhe,pot_zabice)
		
		update_game_state(zabica.pos, muhe_list, stevilo_potez, vrata_odprta)
		get_parent().update_stevilo_potez(stevilo_potez)
		if len(muhe_list) == 0:
			complete = true
			level_complete.position = zabica.position + Vector2(0,100)
			level_complete.show()
		test += 1
		
func skrij_vidljivost_sahovnica():
	for i in mozne_tocke:
		i.hide()

			
func pojej_muhe_list(pot):
	var pomozni_list = []
	for i in muhe_list:
		if i in pot:
			pomozni_list.append(i)
	for j in pomozni_list:
		muhe_list.erase(j)
			
#TUKAJ
#SO
#POTEZE

func lovska_poteza(tile_gridd, pos):
	var mozno = []

	for i in [1, -1]:
		for j in [1, -1]:
			var x = 1
			while true:
				var tile_pos = Vector2(pos[0] + x * i, pos[1] + x * j)
				if tile_pos in tile_grid:
					mozno.append(tile_pos)
					x += 1
				else:
					break
	return mozno

var lovska_poteza_ref = funcref(self,"lovska_poteza")

func trdnjavska_poteza(tile_gridd, pos):
	var mozno = []

	for i in [[0, 1], [0, -1], [1, 0], [-1, 0]]:
		var x = 1
		while true:
			var tile_pos = Vector2(pos.x + i[0] * x, pos.y + i[1] * x)
			if tile_pos in tile_grid:
				mozno.append(tile_pos)
				x += 1
			else:
				break
	return mozno

var trdnjavska_poteza_ref = funcref(self,"trdnjavska_poteza")

func damina_poteza(tile_gridd, pos):
	return trdnjavska_poteza(tile_gridd, pos) + lovska_poteza(tile_gridd, pos)

var damina_poteza_ref = funcref(self, "damina_poteza")

func konjska_poteza(tile_gridd, pos):
	var mozno = []

	for i in [-1, 1]:
		for j in [-1, 1]:
			for k in [1, 2]:
				var tile_pos = Vector2(pos.x + i * k, pos.y + j * (3 - k))
				if tile_pos in tile_grid:
					mozno.append(tile_pos)
	return mozno

var konjska_poteza_ref = funcref(self, "konjska_poteza")

func kraljeva_poteza(tile_gridd, pos):
	var mozno = []
	for i in range(-1,2):
		for j in range(-1,2):
			if (Vector2(pos.x + i,pos.y + j) in tile_grid) and !(i == 0 and j == 0):
				mozno.append(Vector2(pos.x+i,pos.y+j))
	return mozno
	
var kraljeva_poteza_ref = funcref(self, "kraljeva_poteza")

func dash_poteza(tile_gridd, pos):
	var mozno = []

	for i in [[0, 1], [0, -1], [1, 0], [-1, 0]]:
		var x = 1
		while true:
			var tile_pos = Vector2(pos.x + i[0] * x, pos.y + i[1] * x)
			if tile_pos in tile_grid:
				x += 1
			else:
				if Vector2(pos.x + i[0] * (x-1), pos.y + i[1] * (x-1)) != pos:
					mozno.append(Vector2(pos.x + i[0] * (x-1), pos.y + i[1] * (x-1)))
				break
	return mozno

var dash_poteza_ref = funcref(self, "dash_poteza")

var slovar_funkcij_potez = {
	"konj" : konjska_poteza_ref,
	"trdnjava": trdnjavska_poteza_ref,
	"dama": damina_poteza_ref,
	"kralj": kraljeva_poteza_ref,
	"lovec": lovska_poteza_ref,
	"dash": dash_poteza_ref
}

#POTI

func trdnjavska_pot(start, finish):
	var skoraj
	if start[0] < finish[0] or start[1] < finish[1]:
		skoraj = naredi_polje(finish[0], finish[1], start[0], start[1])
	else:
		skoraj = naredi_polje(start[0], start[1], finish[0], finish[1])
	if start in skoraj:
		skoraj.erase(start)
	return(skoraj)
	
var trdnjavska_pot_ref = funcref(self, "trdnjavska_pot")

func lovska_pot(start, finish):
	var pot = []
	var a
	var b
	if finish[0] > start[0]:
		a = 1
	else:
		a = -1
	if finish[1] > start[1]:
		b = 1
	else:
		b = -1
	for i in range(0, abs(finish[0] - start[0]) + 1):
		pot.append(Vector2(start.x + i * a, start.y + i * b))
	return pot

var lovska_pot_ref = funcref(self, "lovska_pot")

func damina_pot(start, finish):
	if finish[0] == start[0] or finish[1] == start[1]:
		return trdnjavska_pot(start, finish)
	else:
		return lovska_pot(start, finish)

var damina_pot_ref = funcref(self, "damina_pot")

func konjska_pot(start, finish):
	return [finish]

var konjska_pot_ref = funcref(self, "konjska_pot")

func kraljevska_pot(start, finish):
	return [finish]

var kraljevska_pot_ref = funcref(self, "kraljevska_pot")

func dash_pot(start, finish):
	return trdnjavska_pot(start, finish)
	
var dash_pot_ref = funcref(self, "dash_pot")



var slovar_funkcij_poti = {
	"konj": konjska_pot_ref,
	"trdnjava": trdnjavska_pot_ref,
	"dama": damina_pot_ref,
	"kralj": kraljevska_pot_ref,
	"lovec": lovska_pot_ref,
	"dash": dash_pot_ref
}

func nastavi_pot(zacetek,konec,poteza):
	return slovar_funkcij_poti[poteza].call_func(zacetek,konec)

func spremeni_premikanje(vrednost):
	mozne_poteze = slovar_funkcij_potez[vrednost].call_func(tile_grid,zabica.pos)
	trenutna_poteza = vrednost

func spremeni_vidljivost_sahovnica():
	if preveri_stevilo_potez():
		for i in mozne_tocke:
			i.spremeni_vidljivost()
	else:
		skrij_vidljivost_sahovnica()
		
func pojej_muhe(muhe,pot):
	for i in muhe:
		if i.pos in pot:
			i.pojedena_muha(pot)

func update_board():
	zabica.pos = array_last(game_state)[0]
	zabica.position = zabica.pos * 64
	muhe_list = array_last(game_state)[1].duplicate()
	for i in muhe:
		if i.pos in muhe_list:
			i.show()	
	stevilo_potez = array_last(game_state)[2].duplicate()
	get_parent().update_stevilo_potez(stevilo_potez)
	vrata_odprta = array_last(game_state)[3]
	
func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_R and ev.pressed and not ev.echo:
		reset_gamestate()
		update_board()
		spremeni_vidljivost_sahovnica()
		trenutna_poteza = null
		skrij_vidljivost_sahovnica()
	if ev is InputEventKey and ev.scancode == KEY_E and ev.pressed and not ev.echo:
		povrni_game_state()
		update_board()
		spremeni_premikanje(trenutna_poteza)
		spremeni_vidljivost_sahovnica()
		
func array_last(array):
	return array[array.size()-1]
