extends CanvasLayer

func hide():
	$Score.hide()

func show():
	$Score.show()
	
func update_score(value):
	$Score/HBoxContainer/Score.text = str(value)

func _process(delta):
	$Score/HBoxContainer/Score.text = str(PlayerStats.score)
	print(PlayerStats.score)
