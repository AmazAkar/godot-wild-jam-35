extends RigidBody2D
class_name Player

export(Vector2) var move_force = Vector2(20,0)
export(Vector2) var force_position = Vector2(0,0)

var max_force = 50
const vel_force = 50
const torque_force = 2000
const torque_force2 = 10000


enum {
	track1,
	track2,
}
var track;
enum {
	default,
	level2,
	level3,
}
var level = default;

onready var AP = $AnimationPlayer
onready var sprite = $Player
onready var wheel = $Wheel
onready var camera = $Camera2D
onready var col_wheel = $Collision_Wheel
onready var col_player = $Collision_Player
onready var tween = $Tween
var col_track2;


func _ready():
	if get_tree().get_current_scene().get_name() == "Level3":
		camera.limit_top = 0
		level = level3
		track = track1
		col_track2 = get_node("/root/Level3/Ground/Track2")

	elif get_tree().get_current_scene().get_name() == "Level2":
		level = level2
		
func _physics_process(delta):
	if Input.is_action_pressed("move-left") and self.linear_velocity.x > -max_force:
		self.linear_velocity.x -= vel_force
		sprite.flip_h = true
		#self.add_central_force(Vector2(-move_force.x,0))
	if Input.is_action_pressed("move-right") and self.linear_velocity.x < max_force:
		self.linear_velocity.x += vel_force
		sprite.flip_h = false
		#self.add_force(force_position, move_force)
	if Input.is_action_pressed("move-right") or Input.is_action_pressed("move-left"):
		AP.play("cycle")
	else: 
		AP.stop()

	match level:
		default:
			if Input.is_action_just_pressed("balance-left"):
					self.apply_torque_impulse(-torque_force)

			if Input.is_action_just_pressed("balance-right"):
				self.apply_torque_impulse(torque_force)
			
		level2:
			if Input.is_action_just_pressed("balance-left"):
				self.apply_torque_impulse(-torque_force2)
				
			if Input.is_action_just_pressed("balance-right"):
				self.apply_torque_impulse(torque_force2)

		level3:
			if Input.is_action_just_pressed("track-up") and track == track1:
				self.apply_central_impulse(Vector2(0,-400))

			if Input.is_action_just_pressed("track-down") and track == track2:	
				col_track2.disabled = true
				self.apply_central_impulse(Vector2(0,40))
				track = track1
			if Input.is_action_just_pressed("balance-left"):
					self.apply_torque_impulse(-torque_force)

			if Input.is_action_just_pressed("balance-right"):
				self.apply_torque_impulse(torque_force)
				

func _on_Timer_timeout():
	self.apply_torque_impulse(-torque_force)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		col_track2.set_deferred("disabled",false)
		track = track2
