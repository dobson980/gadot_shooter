extends Area2D

@export var SPEED: int = 1000
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$SelfDestruct.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()
	pass # Replace with function body.

func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
