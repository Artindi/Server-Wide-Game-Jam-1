extends Control

# Video save_game
@export var display_options : Button
@onready var save_game_menu = self

# Audio save_game
@export var master_vol : Slider
@export var music_vol : Slider
@export var sfx_vol : Slider

# Functions
func _on_display_mode_btn_item_selected(index) -> void:
	SaveSystem.save_game.toggle_fullscreen(index)

func _on_master_vol_slider_value_changed(value) -> void:
	SaveSystem.save_game.update_vol(0, value)

func _on_music_vol_slider_value_changed(value) -> void:
	SaveSystem.save_game.update_vol(1, value)

func _on_sfx_vol_slider_value_changed(value) -> void:
	SaveSystem.save_game.update_vol(2, value)

func _on_back_button_pressed() -> void:
	SaveSystem.saving()
	self.visible = false

func _on_about_to_popup() -> void:
	SaveSystem.load_game()
	display_options.selected = SaveSystem.save_game.display_option_value
	master_vol.value = SaveSystem.save_game.master_vol_value
	music_vol.value = SaveSystem.save_game.music_vol_value
	sfx_vol.value = SaveSystem.save_game.sfx_vol_value
