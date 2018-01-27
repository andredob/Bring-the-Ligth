extends KinematicBody2D

onready var ground_ray = get_node("RayCast2D")
onready var sprite = get_node("AnimatedSprite")



const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500
const GRAVITY = 2000
const JUMPS_PEED = -1000

var acc = Vector2()
var vel = Vector2(0,0)
var anim = "parada"
var pre_shoot = preload("res://Entities/Poder.tscn")
var mouse_pos

func _ready():
	get_node("SamplePlayer").play("energyShield", false)
	#get_node("SamplePlayer").play("creepyMoaning", false)
	set_fixed_process(true)
	
func _input(ev):
   # Mouse in viewport coordinates


   if (ev.type==InputEvent.MOUSE_MOTION):
       mouse_pos = ev.pos


func _fixed_process(delta):
	acc.y = GRAVITY
	acc.x = Input.is_action_pressed("direita") - Input.is_action_pressed("esquerda")
	
	acc.x *= ACCEL
	if acc.x == 0:
		acc.x = vel.x * FRICTION * delta
		
	else:
		get_node("SamplePlayer").play("concreteStep", false)
		
	if Input.is_action_pressed("pula") and ground_ray.is_colliding():
		get_node("SamplePlayer").play("footStepWoodsBit", false)
		print("pula")
		vel.y = JUMPS_PEED
		
	if Input.is_action_pressed("shoot"):
		var tiro = pre_shoot.instance()
		var dir = get_global_mouse_pos() - get_global_pos()
		dir  = dir.normalized()
		tiro.dir = dir 
		tiro.set_global_pos(get_global_pos())
		get_parent().add_child(tiro)
		
		pass
		
	vel += acc * delta
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	var motion = move(vel * delta)
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)
	if abs(vel.x) < 10:
		vel.x = 0
	
	if vel.x == 0:
		anim = "parada"
		print(vel.x)
	elif vel.x > 0:
		anim = "correndo"
		sprite.set_flip_h(false)
	elif vel.x < 0:
		anim = "correndo"
		sprite.set_flip_h(true)
	sprite.play(anim)
	