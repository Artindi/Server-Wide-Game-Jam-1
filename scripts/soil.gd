extends Area2D
@export var amount_grown : int = 1

# Nodes
@export var label : Label

func _on_body_entered(body) -> void:
	scale = Vector2(amount_grown, amount_grown)
	var i = 0
	while i < amount_grown:
		i += 1
		body.spawnSection()
	queue_free()
