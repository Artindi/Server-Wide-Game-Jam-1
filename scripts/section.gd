extends CharacterBody2D

var rng = RandomNumberGenerator.new

var index = 0
@onready var player = get_parent().get_parent()

var texture1 = preload("res://assets/images/characters/Section1.png")
var texture2 = preload("res://assets/images/characters/Section2.png")
var texture3 = preload("res://assets/images/characters/Section3.png")

func _ready():
	randomize()
	var texture = randi_range(1, 3)
	if texture == 1:
		$Sprite2D.texture = texture1
	elif texture == 2:
		$Sprite2D.texture = texture2
	elif texture == 3:
		$Sprite2D.texture = texture3

func _physics_process(delta):
	if position.y >= player.get_node("FootCollision").position.y:
		queue_free()
	pass

func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		player.moveFeet((position.y / 16) - 1)
		player.velocity.y  = -128
	pass # Replace with function body.
