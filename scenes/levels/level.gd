extends Node2D

var test_array: Array[String] = ["Test", "Test2", "Test3", "Test4"]

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Logo.rotation = 90
	
	for i in test_array:
		print(i)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.position.x += 1
	print($Logo.position.x)
	if $Logo.position.x >= 1000:
		$Logo.position.x = 0
	pass
