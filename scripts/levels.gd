extends Node2D
@export var objective : StaticBody2D

func _ready() -> void:
	SaveSystem.load_game()
	if objective.next_level <= 6:
		if !MusicController.get_node("Music").is_playing():
			MusicController.play_music("res://assets/soundFX/nayslayer.mp3")
	elif objective.next_level <= 11:
		if objective.next_level == 7:
			MusicController.get_node("Music").stop()
		if !MusicController.get_node("Music").is_playing():
			MusicController.play_music("res://assets/soundFX/godray.mp3")
	elif objective.next_level <= 16:
		if objective.next_level == 12:
			MusicController.get_node("Music").stop()
		if !MusicController.get_node("Music").is_playing():
			MusicController.play_music("res://assets/soundFX/penguinbeep.mp3")
