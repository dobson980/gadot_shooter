extends CanvasLayer

@onready var laser_label: Label =  %AmmoCount
@onready var grenade_label: Label = %GrenadeCount

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	
func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
