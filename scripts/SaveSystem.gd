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
		
	SaveSystem.save_game.toggle_fullscreen(SaveSystem.save_game.display_option_value)
	SaveSystem.save_game.update_vol(0, SaveSystem.save_game.master_vol_value)
	SaveSystem.save_game.update_vol(1, SaveSystem.save_game.music_vol_value)
	SaveSystem.save_game.update_vol(2, SaveSystem.save_game.sfx_vol_value)

func restart() -> void:
	save_game = SaveFile.new()
	saving()
