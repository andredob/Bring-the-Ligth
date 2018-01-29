extends KinematicBody2D
var num = 0.5
var vel = num
var subir = false
var veld = 0.5
export var altura = 150

onready var init_pos = get_global_pos()

func _ready():
	
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	
	
	
	if(subir==true):
		translate(Vector2(0,1)*vel*delta)
		vel -= num
		
		
	if(subir==false):
		translate(Vector2(0,1)*veld*delta)
		print("joao")
		veld += num
		
	if(get_pos().y>=(init_pos.y)+altura && subir==false):
		print("oi")
		subir =true
		veld= 0.5
		
		
	if(get_pos().y<=(init_pos.y)&&subir==true):
		subir = false
		print("vamos subir")
		vel = 0.5
	