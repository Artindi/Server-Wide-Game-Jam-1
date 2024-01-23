extends CanvasLayer
@export var settings : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings.visible = false
	visible = false


func _input(event) -> void:
	if (event.is_action_pressed("Esc")):
		visible = !visible
		get_tree().paused = visible

func _on_continue_button_pressed() -> void:
	visible = false
	get_tree().paused = false

func _on_settings_button_pressed() -> void:
	settings.visible = true

func _on_quit_button_pressed() -> void:
	visible = false
	get_tree().paused = false
	SaveSystem.saving()
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")

func _on_quit_button_2_pressed():
	visible = false
	get_tree().paused = false
	SaveSystem.saving()
	get_tree().quit(0)
