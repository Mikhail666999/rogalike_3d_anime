extends KinematicBody

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 
var pos = Vector3()

onready var head = $head

var gravity = .6
var mouse_sens_x = 0.3
var mouse_sens_y = 0.2
var speed = 4
var acceleration = 10
var jump = 7

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pos.y = global_position.y
	pos.x = global_position.x
	pos.z = global_position.z
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sens_x)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sens_y)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	direction = Vector3()
# warning-ignore:return_value_discarded
	move_and_slide(fall, Vector3.UP)
	
	if not is_on_floor():
		fall.y -= gravity
		
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		fall.y = jump

	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("ui_down"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("ui_right"):
		direction += transform.basis.x
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 
	
func _process(delta):
	
	pass
