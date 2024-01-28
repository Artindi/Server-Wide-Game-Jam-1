extends Area2D
class_name Saw
@export var sprite : AnimatedSprite2D
@export var saw_sound : AudioStreamPlayer2D

func _ready():
	sprite.play("idle")
	
func _physics_process(delta):
	if saw_sound.playing == false:
		saw_sound.play()
