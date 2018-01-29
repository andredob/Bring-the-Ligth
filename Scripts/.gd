extends KinematicBody2D

# This is a simple collision demo showing how
# the kinematic controller works.
# move() will allow to move the node, and will
# always move it to a non-colliding spot,
# as long as it starts from a non-colliding spot too.

# Member variables
const GRAVITY = 500.0 # Pixels/second

# Angle in degrees towards either side that the player can consider "floor"
const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 600
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 300
const STOP_FORCE = 3000
const JUMP_SPEED = 350
const JUMP_MAX_AIRBORNE_TIME = 0.5
const SHOOT_DELAY = 20


const SLIDE_STOP_VELOCITY = 1.0 # One pixel per second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # One pixel

var velocity = Vector2()
var on_air_time = 100
var jumping = false

var prev_jump_pressed = false
var nova_animacao 
var animacao
var mouse_pos
var pre_shoot = preload("res://Entities/Poder.tscn")
var vida = 100
var isLive = true
var timerWalk = 0

var shoot = SHOOT_DELAY

func _input(ev):
   # Mouse in viewport coordinates
   if (ev.type==InputEvent.MOUSE_MOTION):
       mouse_pos = ev.pos


func _fixed_process(delta):
	shoot -= 1
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var walk_left = Input.is_action_pressed("esquerda")
	var walk_right = Input.is_action_pressed("direita")
	var jump = Input.is_action_pressed("pulo")
		
	#variavel que permite reproduzir o som de passo em um determinado tempo
	timerWalk = timerWalk+delta
	if timerWalk > 0.8:
		timerWalk = 0
		pass
		
	var stop = true
	
	if (walk_left):
		if (velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED):
			force.x -= WALK_FORCE
			stop = false
	elif (walk_right):
		if (velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED):
			force.x += WALK_FORCE
			stop = false
			
			
	var chao = get_node("RayE").is_colliding() || get_node("RayD").is_colliding()
	
	var andando = walk_right || walk_left
	
	if andando:
		
		if (timerWalk > 0.7 and chao):
			get_node("WalkPlayer").play("walk", false)
			pass
			
		if (velocity.x > 0):
			get_node("Sprite").set_flip_h(false)
		else :
			get_node("Sprite").set_flip_h(true)
		
		
	if chao:	
		if andando:
			nova_animacao = "Move"
		else :
			nova_animacao = "parado"
	else :
		nova_animacao = "pular"
		
	
	
	if (stop):
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE*delta
		if (vlen < 0):
			vlen = 0
		
		velocity.x = vlen*vsign
	
	# Integrate forces to velocity
	velocity += force*delta
	
	# Integrate velocity into motion and move
	var motion = velocity*delta
	
	# Move and consume motion
	motion = move(motion)
	
	var floor_velocity = Vector2()
	
	if (is_colliding()):
		# You can check which tile was collision against with this
		# print(get_collider_metadata())
		
		# Ran against something, is it the floor? Get normal
		var n = get_collision_normal()
		if (rad2deg(acos(n.dot(Vector2(0, -1)))) < FLOOR_ANGLE_TOLERANCE):
			# If angle to the "up" vectors is < angle tolerance
			# char is on floor
			on_air_time = 0
			floor_velocity = get_collider_velocity()
		
		
		if (on_air_time == 0 and force.x == 0 and get_travel().length() < SLIDE_STOP_MIN_TRAVEL and abs(velocity.x) < SLIDE_STOP_VELOCITY and get_collider_velocity() == Vector2()):
			# Since this formula will always slide the character around, 
			# a special case must be considered to to stop it from moving 
			# if standing on an inclined floor. Conditions are:
			# 1) Standing on floor (on_air_time == 0)
			# 2) Did not move more than one pixel (get_travel().length() < SLIDE_STOP_MIN_TRAVEL)
			# 3) Not moving horizontally (abs(velocity.x) < SLIDE_STOP_VELOCITY)
			# 4) Collider is not moving
			
			revert_motion()
			velocity.y = 0.0
		else:
			# For every other case of motion, our motion was interrupted.
			# Try to complete the motion by "sliding" by the normal
			motion = n.slide(motion)
			velocity = n.slide(velocity)
			# Then move again
			move(motion)
	
	if (floor_velocity != Vector2()):
		# If floor moves, move with floor
		move(floor_velocity*delta)
	
	if (jumping and velocity.y > 0):
		# If falling, no longer jumping
		jumping = false
	
	if (on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping):
		# Jump must also be allowed to happen if the character left the floor a little bit ago.
		# Makes controls more snappy.
		get_node("SamplePlayer").play("jump8bits", false)
		velocity.y = -JUMP_SPEED
		jumping = true
	
	on_air_time += delta
	prev_jump_pressed = jump
	if shoot <= 0:
		if Input.is_action_pressed("shoot"):
			get_node("SamplePlayer").play("lightningBall", false)
			var tiro = pre_shoot.instance()
			var dire = get_global_mouse_pos() - get_global_pos()
			dire  = dire.normalized()
			tiro.dir = dire 
			tiro.set_global_pos(get_global_pos())
			get_parent().add_child(tiro)
			shoot = SHOOT_DELAY
		
		pass
	
	if animacao != nova_animacao:
		get_node("AnimationPlayer").play(nova_animacao)
		animacao = nova_animacao

 var cena



func _ready():
	var cena = get_tree().get_current_scene()
	set_fixed_process(true)
	get_node("MusicPlayer").play("transmissao", true)
	
func _on_Area2D_body_enter( body ):
	if body.get_name() == "pinguin":
		get_parent().dano(10)
		print("bateu")
	
	pass # replace with function body



