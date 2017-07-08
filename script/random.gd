extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ground
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	ground = preload("res://ground.tscn")

var moveby = 1000
func _on_End_body_enter( body ):
	print("hit ",body.get_meta("Player"))
	if (body.has_meta("Player")):
		var end = get_node("End")
		var endpos = end.get_pos()
		endpos.x += rand_range(100,moveby)
		endpos.y += rand_range(-100,100)
		print(endpos)
		end.set_pos(endpos)
		
		var death = get_node("Death")
		var sc = death.get_scale()
		sc.x += moveby
		death.set_scale(sc)
		
		var new = ground.instance()
		var curpos = get_node("End").get_global_pos()
		new.set_pos(curpos)
		get_node(".").add_child(new)
	