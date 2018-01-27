extends KinematicBody2D
var vel = 500

var dir = Vector2(1,0)
func _ready():
	set_process(true)
	pass
	
func _process(delta):
	set_pos(get_pos()+dir*vel*delta)
	
	if( get_global_pos().distance_to(get_parent().get_node("Player").get_global_pos()) >=800  ):
		queue_free()
	
	pass

