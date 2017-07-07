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
	set_max_contacts_reported(1)
	set_use_custom_integrator(true)
	
func _integrate_forces(state):
	if (move):
		state.integrate_forces()
		var vel = state.get_linear_velocity()
		vel.x += -10
		state.set_linear_velocity(vel)
