extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var move = false
signal damage

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	
func _integrate_forces(state):
	if (move):
		var vel = state.get_linear_velocity()
		vel.x += -10
		state.set_linear_velocity(vel)
