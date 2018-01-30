extends CanvasLayer

var vida
var vidaT
var tamanho
var tamanhoT

func _ready():
	set_process(true)
	vidaT = get_parent().VINDAMAX
	tamanhoT =  get_node("Life").get_size().x
	pass
	
func _process(delta):
	
	vida = get_parent().vida
	tamanho = (vida*tamanhoT)/vidaT
	get_node("Life").set_size(Vector2(tamanho,16))
	
	pass
