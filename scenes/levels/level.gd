extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene =  preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_entered_gate(body):
	if body == $Player:
		print(str(body) + " : Entered the gate.")
	pass # Replace with function body.

func _on_player_laser_fired(atPosition):
	var laser = laser_scene.instantiate()
	laser.position = atPosition
	$Projectiles.add_child(laser)
	print("pew pew!")

func _on_player_grenade_thrown(atPosition):
	var grenade =  grenade_scene.instantiate()
	grenade.position = atPosition
	$Projectiles.add_child(grenade)
	print("frag out!")
