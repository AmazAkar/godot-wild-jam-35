extends RigidBody2D
class_name Player

export(Vector2) var move_force = Vector2(20,0)
export(Vector2) var force_position = Vector2(0,0)
var max_force = 100

func _physics_process(delta):
	if Input.is_action_just_pressed("move-left") and self.applied_force.x > -max_force:
		self.add_central_force(Vector2(-move_force.x,0))
	if Input.is_action_just_pressed("move-right") and self.applied_force.x < max_force:
		self.add_force(force_position, move_force)

	if Input.is_action_just_pressed("ui_accept"):
		print(self.applied_force)
