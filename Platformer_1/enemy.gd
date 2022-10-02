extends Area2D

export var speed = 100
export var moveDist = 100

onready var startX: float = position.x
onready var targetX: float = position.x + moveDist

func _physics_process(delta):
	position.x = move_to(position.x,targetX,speed*delta)
	if position.x== targetX:
		if targetX == startX: targetX = position.x + moveDist
		else: targetX = startX
		
func move_to(current,to,step):
	var next_step = current
	
	if  next_step < to:
		next_step += step
		if next_step > to:
			next_step = to
	else:
		next_step -= step
		if next_step < to:
			next_step = to
	return next_step
	



func _on_enemy_body_entered(body):
	if body.name == 'player':
		body.die()
		
func die():
	get_tree().reload_current_scene()
