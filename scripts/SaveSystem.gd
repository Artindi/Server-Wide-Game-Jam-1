extends Node

var save_game := SaveFile.new()

func saving() -> void:
	var err
	if OS.has_feature("standalone"):
		err = ResourceSaver.save(save_game, "user://savegame.res")
	else:
		err = ResourceSaver.save(save_game, "user://savegame.tres")
	if err != OK:
		print("Save Game Error: ", err)

func load_game() -> void:
	if !FileAccess.file_exists("user://savegame.tres") and !FileAccess.file_exists("user://savegame.res"):
		return
	
	if OS.has_feature("standalone"):
		save_game = ResourceLoader.load("user://savegame.res")
	else:
		save_game = ResourceLoader.load("user://savegame.tres")

func restart() -> void:
	save_game = SaveFile.new()
	saving()
