extends Camera2D

func _process(delta):
	var root_node = get_parent()
	var head = root_node.get_node("Sprite2D")
	var foot = root_node.get_node("FootCollision")
	global_position.y = (head.global_position.y + foot.global_position.y)/2
	pass
