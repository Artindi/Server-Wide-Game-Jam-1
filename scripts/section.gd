extends CharacterBody2D

var index = 0
@onready var player = get_parent().get_parent()

func _process(_delta):
	if position.y >= player.get_node("FootCollision").position.y:
		queue_free()
	pass



func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		player.moveFeet((position.y / 16) - 1)
		player.velocity.y  = -128
	pass # Replace with function body.
