extends Control


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Godot-Scenes/Levels/level_01.tscn")
