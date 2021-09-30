extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_scene():
	$FadeTransition/AnimationPlayer.play("FadeToBlack")
	yield($FadeTransition/AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://World2.tscn")

func _process(delta):
	if PlayerStats.score >= 6:
		set_process(false)
		change_scene()
		
		
	
