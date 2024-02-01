extends Control

func _ready() -> void:
	SaveSystem.load_game()
	MusicController.play_music("res://assets/soundFX/jig2nointro.mp3")
