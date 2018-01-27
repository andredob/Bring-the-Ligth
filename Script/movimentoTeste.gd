extends Area2D

const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500

var acc = Vector2()
var vel = Vector2()

func _ready():
	set_fixed_process(true)


onready var sprite = get_node("normal")
var anim = "parada"

func _fixed_process(delta):
	
	var walk_left = Input.is_action_pressed("esquerda")
	var walk_right = Input.is_action_pressed("direita")
	var jump = Input.is_action_pressed("jump")
	
	var stop = true
	
	if ( walk_left):
		anim = "correndo"
		sprite.play(anim)
	elif (walk_right):
		anim = "correndo"
		sprite.play(anim)
	elif (stop):
		anim = "parada"
		sprite.play(anim)
	
	
	
	if Input.is_action_pressed("direita"):
		acc.x = 1
	elif Input.is_action_pressed("esquerda"):
		acc.x = -1
	else:
		acc.x = 0
	acc.x *= ACCEL
	vel += acc * delta
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	
	if(walk_left):
		sprite.set_flip_h(true);
	if(walk_right):
		sprite.set_flip_h(false);
	
	vel.x = direcao * speed
	set_pos(get_pos() + vel * delta)
	
	