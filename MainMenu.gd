extends MarginContainer

const FIRST_SCENE = "res://World1.tscn"


func _on_TextureButton_pressed():
	get_tree().change_scene(FIRST_SCENE)

