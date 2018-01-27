extends Node



func _ready():
	pass

var grav = 10;
onready var player = get_node("root/Scenes/Player/RayCast2D")
#pega o node RayCast2d

func _fixed_process(delta):
	if player.get_collider == get_node("KinematicBodi2D").get_colider:
		get_node("KinematicBodi2D").set_pos(get_node("KinematicBodi2D").x, get_node("KinematicBodi2D").y * grav);
	
	pass

