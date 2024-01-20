extends StaticBody2D

# If the objective is touched by the player, it does this thing
func _on_area_2d_body_entered(body) -> void:
	print("Works")
