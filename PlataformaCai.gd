extends KinematicBody2D

export var queda_tempo = 1.0
export var respawn = 1.0
var vel = 0

onready var init_pos = get_global_pos()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	get_node("TimerCai").set_wait_time(queda_tempo)
	get_node("TimerRespawn").set_wait_time(respawn)
	
	pass


func _on_Sensor_body_enter( body ):
	
	get_node("animCai").play("Treme")
	get_node("TimerCai").start()

func _on_Sensor_body_exit( body ):
	get_node("animCai").stop()
	get_node("Sprite").set_pos(Vector2())


func _on_TimerCai_timeout():
	get_node("TimerRespawn").start()
	set_fixed_process(true)
	
func _fixed_process(delta):
	translate(Vector2(0,1)*vel*delta)
	vel += 10
	

func _on_TimerRespawn_timeout():
	set_global_pos(init_pos)
	get_node("animCai").stop()
	get_node("Sprite").set_pos(Vector2())
	set_fixed_process(false)
