extends StaticBody2D
@export var next_level : int = 1
@export var win_screen : CanvasLayer

# If the objective is touched by the player, it does this thing
func _on_area_2d_body_entered(_body) -> void:
	if next_level > SaveSystem.save_game.level:
		if next_level == 16:
			pass
		SaveSystem.save_game.level = next_level 
	SaveSystem.saving()
	
	# This will always change the scene to the level specified by the exported variable 'next_level'
	# get_tree().change_scene_to_file() is called from win_screen.gd using this path
	win_screen.appear("res://scenes/screens/levels/level_%d.tscn" % next_level)

