extends Sprite

onready var AP = $AnimationPlayer
const RL = 5

func _physics_process(delta):
	if Input.is_action_pressed("move-right") or Input.is_action_pressed("move-left"):
		rotate(deg2rad(-RL))
		
