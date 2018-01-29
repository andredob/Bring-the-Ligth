extends KinematicBody2D
const DANO = 50
var vel = 1000

func _ready():
	hide()
	pass
	
func _fixed_process(delta):
	translate(Vector2(get_scale().x,0)*vel*delta)
	pass


func _on_VisibilityNotifier2D_enter_screen():
	show()
	set_fixed_process(true)
	pass 
