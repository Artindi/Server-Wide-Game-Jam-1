extends Node2D

func _input(event):
	if Input.is_action_just_pressed("Esc"):
		SaveSystem.saving()
		get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")
