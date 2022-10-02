extends KinematicBody2D

const SPEED = 200
const GRAVITY = 900
const JUMP = 600
var velocity = Vector2(0,0)
var score = 0

onready var player_sprite = $AnimatedSprite
onready var ui = get_node("/root/Level1/CanvasLayer/UI")

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		player_sprite.play("Walk")
		player_sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		player_sprite.play("Walk")
		player_sprite.flip_h = true
	elif Input.is_action_pressed("up") and is_on_floor():
		velocity.y -= JUMP
		player_sprite.play("Jump")
	elif not is_on_floor():
		player_sprite.play("Jump")
	else: 
		velocity.x = 0
		player_sprite.play("Idle")
		
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_fallzone_body_entered(body):
	if body.name == 'player':
		get_tree().change_scene("res://Level1.tscn")

func _on_spike_body_entered(body):
	if body.name == 'player':
		get_tree().change_scene("res://Level1.tscn")

		
func die():
	get_tree().reload_current_scene()
	
func collect_coin(value):
	score += value
	ui.set_score_text(score)
	
	

