extends KinematicBody2D

const GRAVIDADE = 400
const DANO = 30
var vel =150
var aux = 1

func _ready():
	set_process(true)
	pass

func _process(delta):
	move(Vector2(0,1)*delta*GRAVIDADE)
	pass
	
func _on_VisibilityNotifier2D_enter_screen():
	set_fixed_process(true)
	
func dano():
	pass

func _fixed_process(delta):
	translate(Vector2(-1,0)*vel*delta)
	aux += 0.05
	get_node("Sprite").set_rot(aux)



