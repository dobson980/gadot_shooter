extends CharacterBody2D

signal laser_fired(atPosition, direction)
signal grenade_thrown(atPosition, direction)

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 425
var speed: int = max_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	
	#Player Rotation
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary_action") and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser_fired.emit(selected_laser.global_position, player_direction)
		can_laser = false
		$LaserTimer.start()
	elif Input.is_action_pressed("secondary_action") and can_grenade:
		var grenade_markers = $ProjectileStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade_thrown.emit(selected_grenade.global_position, player_direction)
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
