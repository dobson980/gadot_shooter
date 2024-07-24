extends RigidBody2D

@export var SPEED: int = 150

func explode():
	print("BOOM")
	$AnimationPlayer.play("explode")
