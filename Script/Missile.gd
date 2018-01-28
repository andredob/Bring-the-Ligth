extends Sprite

var target
var speed = 200

func _ready():
	set_process(true)
	pass

func _process(delta):
	var targetPos = target.get_global_pos()
	set_rot(get_pos().angle_to_point(targetPos))
	move_local_y(delta * -speed, false)
	
	var distanceFromLeecher = get_global_pos().distance_to(target.get_global_pos());
	if(distanceFromLeecher <= 2): 
		queue_free()
	
