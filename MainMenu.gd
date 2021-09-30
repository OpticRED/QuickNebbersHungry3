extends MarginContainer

const FIRST_SCENE = "res://World1.tscn"

func start_title_anim():
	$AnimationPlayer.play("Title")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("TitleJitter")

func _ready():
	start_title_anim()


func _on_TextureButton_pressed():
	$AnimationPlayer.play("FadeToBlack")



func _on_Exit_pressed():
	get_tree().quit()

const Options = "res://Options.tscn"

func _on_Options_pressed():
	get_tree().change_scene(Options)

func level_change_trans():
	get_tree().change_scene(FIRST_SCENE)
