extends CanvasLayer
@export var button_click : AudioStreamPlayer2D
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
	button_click.play()
	visible = false
	get_tree().paused = false

func _on_settings_button_pressed() -> void:
	button_click.play()
	settings.visible = true

func _on_quit_button_pressed() -> void:
	button_click.play()
	visible = false
	get_tree().paused = false
	SaveSystem.saving()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://scenes/screens/main_menu.tscn")

func _on_quit_button_2_pressed():
	button_click.play()
	visible = false
	get_tree().paused = false
	SaveSystem.saving()
	await get_tree().create_timer(0.15).timeout
	get_tree().quit(0)

func _on_reset_button_pressed():
	button_click.play()
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()
