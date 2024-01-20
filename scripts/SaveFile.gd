class_name SaveFile extends Resource
# Level is one less than the actual level (Ex. level = 2 means the player can go to level 3)
@export var level = 0
# Display Option Value is the variable for whether the screen is fullscreen or windowed
@export var display_option_value = 0
# Volume Variables  
@export var master_vol_value = -15
@export var music_vol_value = -15
@export var sfx_vol_value = -15

func toggle_fullscreen(value) -> void:
	display_option_value = value
	if value == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func update_vol(bus_idx, vol) -> void:
	if bus_idx == 0:
		master_vol_value = vol
	elif bus_idx == 1:
		music_vol_value = vol
	elif bus_idx == 2:
		sfx_vol_value = vol
	AudioServer.set_bus_volume_db(bus_idx, vol)
