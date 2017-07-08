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
	set_meta("Player",true)

var move = 5
var jump = 15
func _input(event):
	if (get_colliding_bodies() == []):
		dx = 0
		dy = 0
		return
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
		dy = -jump
		emit_signal("pressed")
	elif (event.is_action_released("move_jump")):
		dy = 0
		emit_signal("released")
	elif(event.is_action_pressed("ui_cancel")):
		get_tree().quit()

var maxvel = 500
func _integrate_forces(state):
		if (dx != 0 or dy != 0):
			var vel = state.get_linear_velocity()
			vel.x += dx
			if (vel.x > maxvel):
				vel.x = maxvel
			elif (vel.x < -maxvel):
				vel.x = -maxvel
			vel.y += dy
			if (vel.y > maxvel):
				vel.y = maxvel
			elif (vel.y < -maxvel):
				vel.y = -maxvel
			#print(vel.x," ",vel.y)
			state.set_linear_velocity(vel)