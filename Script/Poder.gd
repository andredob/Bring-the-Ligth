extends KinematicBody2D
var vel = 500

var dir = Vector2(1,0)
func _ready():
	set_process(true)
	pass
	
func _process(delta):
	set_pos(get_pos()+dir*vel*delta)
	pass

