extends Control
@export var level2 : Button
@export var level3 : Button
@export var level4 : Button
@export var level5 : Button
@export var level6 : Button
@export var level7 : Button

func _ready() -> void:
	# sifts through the level variable to see if certain levels are unlocked and shows them if they are
	if SaveSystem.save_game.level >= 1:
		level2.show()
	if SaveSystem.save_game.level >= 2:
		level3.show()
	if SaveSystem.save_game.level >= 3:
		level4.show()
	if SaveSystem.save_game.level >= 4:
		level5.show()
	if SaveSystem.save_game.level >= 5:
		level6.show()
	if SaveSystem.save_game.level >= 6:
		level7.show()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")

func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/temp_test.tscn")
