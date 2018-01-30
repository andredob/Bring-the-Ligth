extends KinematicBody2D
const DANO = 50
var vel = 1000
var time = 0
func _ready():
	hide()
	pass
	
func _fixed_process(delta):
	translate(Vector2(get_scale().x,0)*vel*delta)
	time +=1
	if time == 5*60:
		queue_free()
	pass


func _on_VisibilityNotifier2D_enter_screen():
	show()
	set_fixed_process(true)
	pass 
