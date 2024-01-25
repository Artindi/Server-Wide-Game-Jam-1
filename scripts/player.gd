extends CharacterBody2D
class_name Player

@export var sections : Node2D
@export var foot_collision : CollisionShape2D
@export var headSprite : Sprite2D
@export var footSprite : Sprite2D
@export var growth_timer : Timer
@export var concrete_detector : RayCast2D
@export var growth_light_detector : RayCast2D

@export var timer_seconds : float = 0.75

var headWithLegs = preload("res://assets/images/characters/Pot.png")
var headWithoutLegs = preload("res://assets/images/characters/Pot_with_green.png")
var tallFootSprite = preload("res://assets/images/characters/legs_with_green.png")
var shortFootSprite = preload("res://assets/images/characters/legs.png")
var camera = preload("res://scenes/Player/Custom_camera.tscn")

var SECTION = preload("res://scenes/Player/section.tscn")

const SPEED = 64

#Misc variables
var growthDirection : bool = true
var grow_speed = 1
var can_grow = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready() -> void:
	growth_timer.wait_time = timer_seconds

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

func removeSection() -> void:
	if (sections.get_child_count() > 0):
		self.global_position.y += 16
		moveFeet(sections.get_child_count())
	else:
		get_tree().reload_current_scene()

func spawnSection() -> void:
	self.global_position.y -= 16
	moveFeet(sections.get_child_count() + 2)
	var section = SECTION.instantiate()
	sections.add_child(section)
	section.global_position = self.global_position
	section.position.y += sections.get_child_count() * 16
	section.index = sections.get_child_count()

#changes growth_timer speed based envornmental conditions
func checkGrowSpeed():
	grow_speed = 1
	if concrete_detector.get_collider() != null:
		#if "Concrete" in concrete_detector.get_collider().get_name():
		grow_speed -= 1
	if growth_light_detector.get_collider() != null:
		if "GrowthLight" in growth_light_detector.get_collider().get_name():
			grow_speed += 1
	
	if grow_speed == 0:
		can_grow = false
	elif grow_speed == 1:
		can_grow = true
		growth_timer.wait_time = 0.75
	elif grow_speed == 2:
		can_grow = true
		growth_timer.wait_time = 0.25

func _on_growth_timer_timeout() -> void:
	if (growthDirection):
		checkGrowSpeed()
		if can_grow:
			if sections.get_child_count() == 0:
				if foot_collision.position.y == 0:
					self.global_position.y -= 16
					moveFeet(sections.get_child_count() + 1)
				else:
					spawnSection()
			else:
				spawnSection()
	else:
		removeSection()

func _on_break_feet_body_entered(body) -> void:
	if body.name == "TileMap":
		moveFeet(sections.get_child_count())
		velocity.y = -128

func _on_death_detector_body_entered(_body) -> void:
	get_tree().reload_current_scene()
