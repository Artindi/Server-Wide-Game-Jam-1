extends Area2D
class_name Saw

func _ready():
	$Sprite2D.play("idle")
	
func _physics_process(delta):
	if $SawSound.playing == false:
		$SawSound.play()

#func _on_body_entered(body):
	#if (body is Player):
		#body.growthDirection = false
#
#func _on_body_exited(body):
	#if (body is Player):
		#body.growthDirection = true
