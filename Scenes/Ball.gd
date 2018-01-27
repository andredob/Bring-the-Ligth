extends RigidBody2D

var num = 0.2
var vel = num
var rotacao = 1

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	
	rotacao += 5
	var aux = get_node("Sprite")
	aux.set_rot(rotacao*num*delta)
	translate(Vector2(1,0)*vel*delta)
	
	vel -= num