extends Area2D

export var value = 1

#func _process(delta):
#	rotation_degrees += 90

func _on_Area2D_body_entered(body):
	if body.name == 'player':
		body.collect_coin(value)
		queue_free()
