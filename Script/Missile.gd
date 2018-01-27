extends Sprite

onready var player = get_parent().get_node("Player")
var speed = 200

func _ready():
	set_process(true)
	pass

func _process(delta):
	var playerPos = player.get_global_pos()
	set_rot(get_pos().angle_to_point(playerPos))
	move_local_y(delta * -speed, false)
	
