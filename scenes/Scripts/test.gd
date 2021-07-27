extends RigidBody2D

var input_force;
const torque_force = 1400

func _integrate_forces(state):
	input_force = Input.get_action_strength("move-right") - Input.get_action_strength("move-left")
	applied_force.x = input_force * 800
	
	
	if Input.is_action_just_pressed("balance-left"):
		self.apply_torque_impulse(-torque_force)

	if Input.is_action_just_pressed("balance-right"):
		self.apply_torque_impulse(torque_force)
	print(applied_force)
