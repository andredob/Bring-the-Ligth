extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel =300
var aux = 1
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _on_VisibilityNotifier2D_enter_viewport( viewport ):


#print ("monstrao")
	pass


func _on_VisibilityNotifier2D_enter_screen():
	
	set_fixed_process(true)
	


func _fixed_process(delta):
	
	translate(Vector2(1,0)*vel*delta)
	aux += 0.05
	#get_node("Sprite").set_rot(aux)
	




func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
	#print("saiu tela")
