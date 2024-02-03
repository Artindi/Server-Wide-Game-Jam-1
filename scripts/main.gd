extends Control
@export var button_click : AudioStreamPlayer2D
@export var settings : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveSystem.load_game()
	if !MusicController.get_node("Music").is_playing():
		MusicController.play_music("res://assets/soundFX/bwahhhhhhhh.mp3")

func _on_quit_button_pressed() -> void:
	button_click.play()
	get_tree().quit()

func _on_play_button_pressed() -> void:
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/level_select.tscn")

func _on_settings_button_pressed() -> void:
	button_click.play()
	settings.show()


func _on_credits_pressed():
	button_click.play()
	get_tree().change_scene_to_file("res://scenes/screens/credits.tscn")
	pass # Replace with function body.
