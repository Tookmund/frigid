extends RigidBody2D

var dx = 0
var dy = 0
signal released
signal pressed

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	set_contact_monitor(true)
	set_max_contacts_reported(1)

var move = 5
func _input(event):
	if (event.is_action_pressed("move_left")):
		dx = -move
		emit_signal("pressed")
	elif (event.is_action_pressed("move_right")):
		dx = move
		emit_signal("pressed")
	elif (event.is_action_released("move_left") or event.is_action_released("move_right")):
		dx = 0
		emit_signal("released")
	elif (event.is_action_pressed("move_jump")):
		dy = -move
		emit_signal("pressed")
	elif (event.is_action_released("move_jump")):
		dy = 0
		emit_signal("released")

func _integrate_forces(state):
		if (dx != 0 or dy != 0):
			var vel = state.get_linear_velocity()
			vel.x += dx
			vel.y += dy
			state.set_linear_velocity(vel)