extends KinematicBody2D
var num = 0.5
var vel = num
var subir = true
var veld = 0.5
export var altura = -150

onready var init_pos = get_global_pos()

func _ready():
	
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	if(subir==true):
		translate(Vector2(0,1)*vel*delta)
		vel -= num
		
		
	if(subir==false):
		translate(Vector2(0,-1)*vel*delta)
		
		veld += num
		
	
	if(get_pos().y<=(init_pos.y)+altura && subir==true):
		
		subir =false
		veld= 0.5
		
		
	if(get_pos().y>=(init_pos.y)&&subir==false):
		subir = true
		print("vamos subir")
		vel = 0.5