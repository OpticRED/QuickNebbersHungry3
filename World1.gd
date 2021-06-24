extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if PlayerStats.score >= 6:
		get_tree().change_scene("res://World2.tscn")
	
