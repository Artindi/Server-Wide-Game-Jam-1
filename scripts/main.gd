extends Control
@export var settings : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveSystem.load_game()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/level_select.tscn")

func _on_settings_button_pressed() -> void:
	settings.show()
