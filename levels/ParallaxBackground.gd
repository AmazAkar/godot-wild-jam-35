extends ParallaxBackground

export (float) var scrolling_speed = 500.0

func _physics_process(delta):
	if Input.is_action_just_pressed("move-right"):
		scroll_offset.x += (scrolling_speed * delta)
		print(scroll_offset.x)
