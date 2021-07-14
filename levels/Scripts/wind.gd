extends Sprite

onready var AP = $AnimationPlayer

func _on_TimerWnd_timeout():
	AP.play("coremtr")
