extends Area2D

func _ready():
	$Sprite2D.play("default")
	if SaveSystem.save_game.collection.has(get_parent().get_meta("flag")):
		modulate.a = 0.3
	else:
		modulate.a = 1
	pass

func _on_body_entered(body):
	if !SaveSystem.save_game.collection.has(get_parent().get_meta("flag")):
		SaveSystem.save_game.collection.append(get_parent().get_meta("flag"))
	$Sprite2D.play("collected")
	pass
