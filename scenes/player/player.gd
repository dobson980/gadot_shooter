extends CharacterBody2D

signal laser_fired(atPosition)
signal grenade_thrown(atPosition)

var can_laser: bool = true
var can_grenade: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 350 
	move_and_slide()
	
	if Input.is_action_pressed("primary_action") and can_laser:
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		laser_fired.emit(selected_laser.global_position)
		can_laser = false
		$LaserTimer.start()
	elif Input.is_action_pressed("secondary_action") and can_grenade:
		var grenade_markers = $ProjectileStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		grenade_thrown.emit(selected_grenade.global_position)
		can_grenade = false
		$GrenadeTimer.start()
	pass


func _on_laser_timer_timeout():
	print('ready to shoot!')
	$LaserTimer.stop()
	can_laser = true
	pass # Replace with function body.


func _on_grenade_timer_timeout():
	print('grenade ready!')
	$GrenadeTimer.stop()
	can_grenade = true
	pass # Replace with function body.
