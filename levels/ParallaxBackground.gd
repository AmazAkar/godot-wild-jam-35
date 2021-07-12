extends ParallaxBackground

export (float) var scrolling_speed = 500.0

func _process(delta):
	scroll_offset.x = scroll_offset.x - (scrolling_speed * delta)
	print(scroll_offset.x)
