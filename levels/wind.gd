extends Sprite

onready var AP = $AnimationPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "te	


#


func _on_TimerWnd_timeout():
	AP.play("coremtr")
