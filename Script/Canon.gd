extends KinematicBody2D

export (float) var bullet_angle = 350 setget set_bullet_angle

export (int) var bullet_speed = 8

export (int) var bullet_gravity = 5

export (float) var bullet_delay = 0.5
var waited = 0

export (PackedScene) var bullet_scene

export (NodePath) var bullet_spawn_path
onready var bullet_spawn = get_node(bullet_spawn_path)

var directional_force = Vector2()

var shooting = false

func set_bullet_angle(value):
	bullet_angle = clamp(value, 0, 359)
	
func update_directional_force():
	directional_force = Vector2(cos(bullet_angle*(PI/180)), sin(bullet_angle*(PI/180))) * bullet_speed	

func _ready():
	update_directional_force()
	
	set_process_input(true)
	
	set_process(true)
	
func _input(event):
	if(event.is_action_pressed("ui_select")):
		shooting = true
	elif(event.is_action_released("ui_select")):
		shooting = false

func _process(delta):
	if(shooting && waited > bullet_delay):
		fire_once()
		waited = 0
	elif(waited <= bullet_delay):
		waited += delta

func fire_once():
	shoot()
	shooting = false

func shoot():
	var bullet = bullet_scene.instance()
	bullet.set_global_pos(bullet_spawn.get_global_pos())	
	bullet.shoot(directional_force, bullet_gravity)
	get_parent().add_child(bullet)