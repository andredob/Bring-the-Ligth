extends Node

func _ready():
	pass

var vida = 100

func dano(xdano):
	vida -= xdano
	if vida < 0:
		var isalive = false
	print(vida)