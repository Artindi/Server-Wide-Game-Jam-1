extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _input(event):
	if (event.is_action_pressed("Pause")):
		visible = !visible
		get_tree().paused = visible
