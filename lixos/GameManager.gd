extends Node

var m = Vector2()
var p = Vector2()
export var bullet_scene
onready var camera = get_node("camera")
#var vector
func _ready():
	set_process_input(true)

func _input(ev):
	
	if (ev.type==InputEvent.MOUSE_BUTTON):
		p = get_node("Player").get_global_pos()
		m = camera.get_global_mouse_pos()
		
		var vector = (m - p).normalized()

		var x = rad2deg(sin(vector.angle()))
		print(x)
		
		
		
		
		
		#print(rad2deg(p.angle_to(m)))
		
