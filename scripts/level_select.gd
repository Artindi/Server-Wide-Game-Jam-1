extends Control

@export var button_click : AudioStreamPlayer2D
@export var level1 : Button
@export var level2 : Button
@export var level3 : Button
@export var level4 : Button
@export var level5 : Button
@export var level6 : Button
@export var level7 : Button
@export var level8 : Button
@export var level9 : Button
@export var level10 : Button
@export var level11 : Button
@export var level12 : Button
@export var level13 : Button
@export var level14 : Button
@export var level15 : Button

@onready var array : Array[Button] = [
		level1,
		level2,
		level3,
		level4,
		level5,
		level6,
		level7,
		level8,
		level9,
		level10,
		level11,
		level12,
		level13,
		level14,
		level15,
]

func _ready() -> void:
	SaveSystem.load_game()
	# sifts through the level variable to see if certain levels are unlocked and shows them if they are
	for i in SaveSystem.save_game.level:
		# arrays read 0-x and it needs to reed the 15th entry which is level 15 and has the variable level at 15 and the highest value in the array is 14 so everything needs to go down by one
		var l = i - 1
		array[l].show()

func _on_back_button_pressed() -> void:
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")

func _on_level_1_button_pressed() -> void:
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_1.tscn")

func _on_level_2_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_2.tscn")

func _on_level_3_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_3.tscn")

func _on_level_10_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_10.tscn")

func _on_level_4_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_4.tscn")

func _on_level_5_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_5.tscn")

func _on_level_6_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_6.tscn")

func _on_level_7_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_7.tscn")

func _on_level_8_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_8.tscn")

func _on_level_9_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_9.tscn")

func _on_level_12_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_12.tscn")

func _on_level_11_button__pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_11.tscn")

func _on_level_13_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_13.tscn")

func _on_level_14_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_14.tscn")

func _on_level_15_button_pressed():
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_15.tscn")
