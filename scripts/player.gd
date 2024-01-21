extends CharacterBody2D
@export var sections : Node2D
@export var foot_collision : CollisionShape2D
@export var headSprite : Sprite2D
@export var footSprite : Sprite2D

var headWithLegs = preload("res://assets/images/characters/head1.png")
var headWithoutLegs = preload("res://assets/images/characters/head2.png")
var shortFootSprite = preload("res://assets/images/characters/Feet2.png")
var tallFootSprite = preload("res://assets/images/characters/Feet1.png")


var SECTION = preload("res://scenes/Player/section.tscn")

const SPEED = 32.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta) -> void:
	
	#This makes the sprite look right when the player is one block tall
	if foot_collision.position.y == 0:
		headSprite.texture = headWithLegs
		footSprite.texture = shortFootSprite
	else:
		headSprite.texture = headWithoutLegs
		footSprite.texture = tallFootSprite
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func moveFeet(distance) -> void:
	foot_collision.position.y = distance * 16
	pass

func spawnSection() -> void:
	self.global_position.y -= 16
	moveFeet(sections.get_child_count() + 2)
	var section = SECTION.instantiate()
	sections.add_child(section)
	section.global_position = self.global_position
	section.position.y += sections.get_child_count() * 16
	section.index = sections.get_child_count()

func _on_growth_timer_timeout() -> void:
	if sections.get_child_count() == 0:
		if foot_collision.position.y == 0:
			self.global_position.y -= 16
			moveFeet(sections.get_child_count() + 1)
		else:
			spawnSection()
	else:
		spawnSection()

func _on_break_feet_body_entered(body) -> void:
	if body.name == "TileMap":
		moveFeet(sections.get_child_count())
		velocity.y = -128

func _on_death_detector_body_entered(_body) -> void:
	get_tree().reload_current_scene()
