extends Sprite


var degrees_per_sec = 360.0

func _process(delta):
	if Input.is_action_pressed("move-right"):
		rotate(delta * deg2rad(degrees_per_sec))
	elif Input.is_action_pressed("move-left"):
		rotate(delta * deg2rad(-degrees_per_sec))

