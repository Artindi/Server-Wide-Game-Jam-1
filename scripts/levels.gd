extends Node2D
@export var objective : StaticBody2D
@export var music_player : AudioStreamPlayer2D

func _ready() -> void:
	SaveSystem.load_game()
	if objective.next_level == 2:
		MusicController.play_music("res://assets/soundFX/nayslayer.mp3")
	elif objective.next_level == 7:
		MusicController.play_music("res://assets/soundFX/godray.mp3")
	elif objective.next_level == 12:
		MusicController.play_music("res://assets/soundFX/penguinbeep.mp3")
