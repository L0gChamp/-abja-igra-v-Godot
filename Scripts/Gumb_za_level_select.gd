extends Button


var level = preload("res://Scenes/Igra.tscn")

var global = preload("res://Scenes/Global.tscn").instance()

export var ker_level : String

var igra

export var ime_gumba : String

func _ready():
	$Label.text = ime_gumba
	

func _on_Button_button_up() -> void:
	igra = level.instance()
	igra.slovar_igre = global.slovar_levelov[ker_level]
	
	get_tree().get_root().add_child(igra)
	get_parent().odstrani_sceno()
