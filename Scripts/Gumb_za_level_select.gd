extends Button


var level = preload("res://Scenes/Igra.tscn")

export var ker_level : String

var igra

export var ime_gumba : String

func _ready():
	$Label.text = ime_gumba
	if Global.narejeni_leveli[ker_level] == true:
		$".".modulate = Color(0,1,0)
	

func _on_Button_button_up() -> void:
	igra = level.instance()
	igra.slovar_igre = Global.slovar_levelov[ker_level]
	igra.ker_level = ker_level
	
	get_tree().get_root().add_child(igra)
	get_parent().odstrani_sceno()
