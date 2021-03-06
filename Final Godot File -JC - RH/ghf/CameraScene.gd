extends Camera

onready var player_follow = get_parent().get_node("Player")

var random_jitter = 0

func get_camera_shake(delta):
	if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		random_jitter+=0.5 *delta
	else:
		random_jitter-=0.5 *delta
		if random_jitter < 0:
			random_jitter = 0
	return Vector2(rand_range(-random_jitter,random_jitter),rand_range(-random_jitter,random_jitter))
	
	
func _process(delta):
	var camera_shake = get_camera_shake(delta)
	var camera_pos =  Vector3.ZERO
	camera_pos.x = player_follow.translation.x + camera_shake.x
	camera_pos.z = player_follow.translation.z + camera_shake.y
	camera_pos.y = get_translation().y
	set_translation(camera_pos)
	
