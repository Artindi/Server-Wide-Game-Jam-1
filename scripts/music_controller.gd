extends Node2D

@onready var music_player = %Music

func play_music(music : String) -> void:
	music_player.stream = load(music)
	music_player.play()

func change_volume(volume : float) -> void:
	music_player.volume_db = volume
