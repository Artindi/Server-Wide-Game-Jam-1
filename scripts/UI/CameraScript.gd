extends Camera2D


func _process(delta):
	position = $"../Player".position
	#
	#var sections = root_node.get_node("Sections")
	#
	#var foot = root_node.get_node("FootCollision")
	#if sections.get_child_count() < 6:
		#global_position.y = (head.global_position.y + foot.global_position.y)/2
	#else:
		#global_position.y = (head.global_position.y + foot.global_position.y)/2 - (sections.get_child_count()-6)*16
	#pass
