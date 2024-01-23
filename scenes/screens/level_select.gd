extends Control
@export var level1 : Button
@export var level2 : Button
@export var level3 : Button
@export var level4 : Button
@export var level5 : Button
@export var level6 : Button
@export var level7 : Button

@onready var array : Array[Button] = [
		level1,
		level2,
		level3,
		level4,
		level5,
		level6,
		level7,
]

func _ready() -> void:
	SaveSystem.load_game()
	# sifts through the level variable to see if certain levels are unlocked and shows them if they are
	for i in SaveSystem.save_game.level:
		array[i].show()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")

func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_1.tscn")

func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_2.tscn")

func _on_level_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_3.tscn")

func _on_level_10_button_pressed():
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_10.tscn")
