extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel = 0.5
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _on_VisibilityNotifier2D_enter_viewport( viewport ):
	print ("entrou area bola") 
	print (viewport)
	
	
	
	#queue_free()