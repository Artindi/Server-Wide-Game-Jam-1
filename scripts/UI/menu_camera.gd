extends Camera2D

var mouse_pos : Vector2
var win_size : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	win_size = get_window().size
	mouse_pos = get_global_mouse_position()
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_process(true)
	mouse_pos = get_global_mouse_position()
	position = win_size - mouse_pos

