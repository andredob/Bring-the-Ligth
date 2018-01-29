extends Area2D

var dano

func _ready():
	dano = get_parent().DANO
	pass

func _on_areadedano_body_enter( body ):
	if body.get_name()  != "TileMap":
		if body.get_layer_mask() == 1:
			print("dano")
			body.dano(dano)
	pass # replace with function body
