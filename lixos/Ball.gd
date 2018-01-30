extends RigidBody2D
var vel =100
var aux = 1
func _ready():
	
	pass
	
func _on_VisibilityNotifier2D_enter_viewport( viewport ):
	print (viewport)
	
func _on_VisibilityNotifier2D_enter_screen():
	print ("entrou tela bola")
	set_fixed_process(true)
	


func _fixed_process(delta):
	
	translate(Vector2(-1,0)*vel*delta)
	aux += 0.05
	get_node("Sprite").set_rot(aux)
	




func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
