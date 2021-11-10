extends Node

onready var music = AudioStreamPlayer.new()
onready var sounds = {
	"eat":"res://Human Eating_Crunch - Sound Effect (HD)-[AudioTrimmer.com].wav"
}
var sound_db = 1

func play_sound_effect(sfx):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sounds[sfx])
	self.add_child(sound)
	sound.play()
	yield(sound,"finished")
	sound.queue_free()
