extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _process(delta):
	if PlayerStats.score >= 27:
		get_tree().change_scene("res://canyon.tscn")

