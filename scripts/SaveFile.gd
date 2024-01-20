class_name SaveFile extends Resource

@export var display_option_value = 0
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
