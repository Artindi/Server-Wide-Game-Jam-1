extends StaticBody2D
@export var next_level : int = 1

# If the objective is touched by the player, it does this thing
func _on_area_2d_body_entered(body) -> void:
	print("Works")
	# this makes it so the next level appears in the level select if it doesn't already exist
	if next_level > SaveSystem.save_game.level:
		SaveSystem.save_game.level = next_level 
	SaveSystem.saving()
	# This will always change the scene to the level specified by the exported variable 'next_level'
	get_tree().change_scene_to_file("res://scenes/screens/levels/level_%d.tscn" % next_level)
