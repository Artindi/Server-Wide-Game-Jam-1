extends CanvasLayer

@export var collectables = [] as Array[Node2D]

@onready var score_label = $Control/VBoxContainer/ScoreLabel

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
	get_tree().change_scene_to_file(next_scene)
