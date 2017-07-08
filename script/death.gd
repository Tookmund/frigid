extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Death_body_enter( body ):
	if (body.has_meta("Player")):
		get_tree().change_scene("res://Menu.tscn")