extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene =  preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_player_laser_fired(atPosition, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = atPosition
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$Hud.update_laser_text()

func _on_player_grenade_thrown(atPosition, direction):
	var grenade =  grenade_scene.instantiate() as RigidBody2D
	grenade.position = atPosition
	grenade.linear_velocity = direction * grenade.SPEED
	$Projectiles.add_child(grenade)
	$Hud.update_grenade_text()
