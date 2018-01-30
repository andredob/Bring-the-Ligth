extends Area2D

var dano

func _ready():
	dano = get_parent().DANO
	pass

func _on_areadedano_body_enter( body ):
	if body.has_method("get_layer_mask"):
		if body.get_layer_mask() == 1:
			body.dano(dano)
	pass
