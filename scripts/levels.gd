extends Node2D
@export var objective : StaticBody2D
@export var music_player : AudioStreamPlayer2D

func _ready() -> void:
	SaveSystem.load_game()
	if objective.next_level <= 6:
		music_player.stream = load("res://assets/soundFX/godray.mp3")
		music_player.play()
	elif objective.next_level <= 11:
		if objective.next_level == 7:
			music_player.stop()
		music_player.stream = load("res://assets/soundFX/nayslayer.mp3")
		music_player.play()
	elif objective.next_level <= 16:
		if objective.next_level == 12:
			music_player.stop()
		music_player.stream = load("res://assets/soundFX/penguinbeep.mp3")
		music_player.play()
