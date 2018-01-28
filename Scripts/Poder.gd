extends KinematicBody2D
var vel = 500
var time = 100

var dir = Vector2(1,0)
func _ready():
	set_process(true)
	pass
	
func _process(delta):
	
	set_pos(get_pos()+dir*vel*delta)
	
	if( get_global_pos().distance_to(get_parent().get_node("player").get_global_pos()) >=750  ):
		queue_free()
	
	pass



func _on_Area2D_body_enter( body ):
	if body.get_name() == "pinguin":
		body.queue_free()
		queue_free()
	if body.get_name() == "Fantasma":
		body.queue_free()
		queue_free()
	if body.get_name() == "bola":
		body.queue_free()
		queue_free()
	if body.get_name() == "monstrao":
		body.queue_free()
		queue_free()
	
	
	pass # replace with function body
