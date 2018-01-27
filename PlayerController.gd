extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 3

func _ready():
	set_fixed_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _fixed_process(delta):
	#Player movement
	if Input.is_key_pressed(KEY_UP):
		translate(Vector2(0, -speed))
	if Input.is_key_pressed(KEY_DOWN):
		translate(Vector2(0, speed))
	if Input.is_key_pressed(KEY_LEFT):
		translate(Vector2(-speed, 0))
	if Input.is_key_pressed(KEY_RIGHT):
		translate(Vector2(speed, 0))
	if Input.is_action_pressed("shoot"):
		if Input.is_key_pressed(KEY_UP):
			get_parent().get_child("Fire")
		get_node("Spatial").hit()
		
	pass