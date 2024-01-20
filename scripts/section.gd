extends CharacterBody2D

var index = 0


#func _physics_process(delta):
	#pass



func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		get_parent().get_parent().breakAtSection(self)
	pass # Replace with function body.
