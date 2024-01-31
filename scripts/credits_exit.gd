extends Area2D

func _on_body_entered(_body):
	MusicController.get_node("Music").stop()
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")
