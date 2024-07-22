extends Sprite2D

var pos: Vector2 = Vector2.ZERO
#var spriteScale: float = 6.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300,200)
	position = pos
	pass
	#scale = Vector2(spriteScale, spriteScale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if spriteScale > 1.0:
		#print('sprite scale: ' + str(spriteScale))
		#spriteScale -= 0.1
		#spriteScale = snapped(spriteScale, 0.1)
		#scale = Vector2(spriteScale, spriteScale)


