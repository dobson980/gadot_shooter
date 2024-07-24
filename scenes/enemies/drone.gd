extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(_delta):
	
	var direction = Vector2.RIGHT
	velocity = direction * SPEED
	move_and_slide()

func hit():
	queue_free()
