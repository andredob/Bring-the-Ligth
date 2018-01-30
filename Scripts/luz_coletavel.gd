extends Area2D

var divX = 100
var divY = 100

func _ready():
	
	pass

func _on_luz_coletavel_body_enter( body ):
	if body.has_method("get_layer_mask"):
		if body.get_layer_mask() == 1:
			if body.vida < 100:
				body.dano(-10)
				if body.vida > 100:
					body.vida = 100 
				queue_free()
	pass
