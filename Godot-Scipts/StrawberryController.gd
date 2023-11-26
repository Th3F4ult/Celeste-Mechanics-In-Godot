extends Area2D

@onready var animation = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("STRAW_IDLE")



func _TOUCHED(thing):
	if thing.is_in_group("player"):
		print("TOUCH_STRAWB")
		$StrawberryHitbox.queue_free()
		animation.play("STRAW_GET")
