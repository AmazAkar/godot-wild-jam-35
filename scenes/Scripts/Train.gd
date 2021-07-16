extends KinematicBody2D
class_name Train

export var speed :int = 200;
var vel = Vector2();

func _physics_process(delta):
	vel.x = -speed * delta
	move_and_slide(vel)
	if position.x < -5:
		queue_free()
