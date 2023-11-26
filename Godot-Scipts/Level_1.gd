extends Node2D

@onready var camera = $MovingCam

func _on_death_trigger_body_entered(body):
	if body.is_in_group("player"):
		Globals.isDead = true


func _on_next_area_horizontal_trigger_body_entered(body):
	if body.is_in_group("player"):
		Globals.CamH = Globals.CamH + 1
		$Char.position.x = $Char.position.x + 20
		var currentMark = "Markers/C" + str(Globals.CamH).pad_zeros(2)
		Globals.currentAreaH = Globals.currentAreaH + 1
		$HITBOXh.position.x = $HITBOXh.position.x  + 566
		print("Moved hitbox to ", $HITBOXh.position.x)
		print(Globals.currentAreaH)
		# This so we can come back later
		var marker = get_node(currentMark)
		print(currentMark)
		movecam(camera, "position", marker.position, 0.3)

func movecam(node, property, fin_val, duration):
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(node, property, fin_val, duration)
	# This SOMEWHAT works. Will do for now.



