extends CanvasLayer

@export var collectables = [] as Array[Node2D]
@export var last_level : bool = false

@export var score_label : Label
@export var button_click : AudioStreamPlayer2D

var next_scene : String

func appear(path):
	get_tree().paused = true
	next_scene = path
	var total = collectables.size()
	var collected = 0
	for item in collectables:
		if item.get_meta("flag") in SaveSystem.save_game.collection:
			collected += 1
	score_label.text = "Items Collected: " + str(collected) + "/" + str(total)
	visible = true

func _on_continue_button_pressed():
	get_tree().paused = false
	button_click.play()
	await get_tree().create_timer(0.15).timeout
	if last_level:
		get_tree().change_scene_to_file("res://scenes/screens/credits.tscn")
		return
	get_tree().change_scene_to_file(next_scene)
