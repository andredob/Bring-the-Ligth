extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel =300
var aux = 1
onready var init_pos = get_global_pos()
func _ready():
	
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Timer").set_wait_time(10)
	pass
	
func _on_VisibilityNotifier2D_enter_viewport( viewport ):


#print ("monstrao")
	pass


func _on_VisibilityNotifier2D_enter_screen():
	
	set_fixed_process(true)
	print("entrou monstrao")
	


func _fixed_process(delta):
	
	translate(Vector2(1,0)*vel*delta)
	aux += 0.05
	
	#get_node("Sprite").set_rot(aux)
	




func _on_VisibilityNotifier2D_exit_screen():
	set_fixed_process(false)
	get_node("Timer").start()
	print("saiu tela monstro")


func _on_Timer_timeout():
	set_global_pos(init_pos)
	
	print ("renasceu")
	pass # replace with function body
