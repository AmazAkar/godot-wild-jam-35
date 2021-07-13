extends ParallaxBackground

export (float) var scrolling_speed = 500.0


func _process(delta):
	if Input.is_action_pressed("move-right"):
		scroll_offset.x +=(scrolling_speed * delta)
	
