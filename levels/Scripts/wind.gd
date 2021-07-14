extends Sprite

onready var AP = $AnimationPlayer

func _ready():
	visible = false


	

func _on_TimerWnd_timeout():
	AP.play("coremtr")
	
	visible = true
	

func _on_TimerPhys_timeout():
	AP.stop()
	visible = false
