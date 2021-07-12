extends RigidBody2D
class_name Player

export(Vector2) var move_force = Vector2(20,0)
export(Vector2) var force_position = Vector2(0,0)

var max_force = 50
const vel_force = 50
const torque_force = 2000

onready var AP = $AnimationPlayer
onready var sprite = $Player
onready var wheel = $Wheel
onready var camera = $Camera2D

func _ready():
	AP.play("cycle")
	if get_tree().get_current_scene().get_name() == "Level3":
		set_physics_process(false)
		remove_child(camera)

func _physics_process(delta):
	if Input.is_action_pressed("move-left") and self.linear_velocity.x > -max_force:
		self.linear_velocity.x -= vel_force
		sprite.flip_h = true
		#self.add_central_force(Vector2(-move_force.x,0))
	if Input.is_action_pressed("move-right") and self.linear_velocity.x < max_force:
		self.linear_velocity.x += vel_force
		sprite.flip_h = false
		#self.add_force(force_position, move_force)

	if Input.is_action_just_pressed("balance-left"):
		self.apply_torque_impulse(-torque_force)

	if Input.is_action_just_pressed("balance-right"):
		self.apply_torque_impulse(torque_force)

	if Input.is_action_just_pressed("ui_accept"):
		print(self.applied_force)
