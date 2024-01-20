extends CharacterBody2D


var SECTION = preload("res://Player/segment.tscn")

const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var heightCount = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
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

func moveFeet(distance):
	$FootCollision.position.y = distance * 16
	pass

func spawnSection():
	var section = SECTION.instantiate()
	add_child(section)
	section.global_position = self.global_position
	section.position.y += heightCount * 16
	moveFeet(heightCount)

func _on_growth_timer_timeout():
	position.y -= 16
	heightCount += 1
	spawnSection()
	pass # Replace with function body.
