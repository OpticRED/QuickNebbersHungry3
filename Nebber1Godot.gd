extends KinematicBody

var speed = 20
var acceleration = 16
var gravity = 20
var jump = 7

var mouse_sense = 0.1


var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()

onready var head = $Head

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sense))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sense))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))
		head.rotation_degrees.z = clamp(head.rotation_degrees.z, -89, 89)
		print(head.rotation_degrees)
		
func _process(delta):
	
	direction = Vector3()
	
	if not is_on_floor():
		fall.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = jump
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_action_pressed("move_forward"):
		
		direction -= transform.basis.z
		
	elif Input.is_action_pressed("move_backward"):
		
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		
		direction -= transform.basis.x
		
	elif Input.is_action_pressed("move_right"):
		
		direction += transform.basis.x
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	#velocity.y = fall.y
	velocity = move_and_slide(velocity, Vector3.UP, true)
# warning-ignore:return_value_discarded
	move_and_slide(fall, Vector3.UP, true)

