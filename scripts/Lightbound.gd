extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var williamray = get_parent().get_node("RayCast2D")
	if williamray.is_colliding():
		var origin = williamray.global_transform.origin
		var collision_point = williamray.get_collision_point()
		var distance = origin.distance_to(collision_point)
		size.y = distance + 2
	pass
