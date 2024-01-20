extends CharacterBody2D

var SECTION = preload("res://scenes/Player/section.tscn")

const SPEED = 32.0
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
	self.global_position.y -= 16
	moveFeet($Sections.get_child_count() + 2)
	var section = SECTION.instantiate()
	$Sections.add_child(section)
	section.global_position = self.global_position
	section.position.y += $Sections.get_child_count() * 16
	section.index = $Sections.get_child_count()



func _on_growth_timer_timeout():
	spawnSection()
	pass # Replace with function body.



func _on_break_feet_body_entered(body):
	if body.name == "TileMap":
		moveFeet($Sections.get_child_count())
		velocity.y = -128
		pass
	pass # Replace with function body.
