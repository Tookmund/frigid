extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ground
var score = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	ground = preload("res://ground.tscn")
	updateScore(0)
	get_node("music").play()

var moveby = 1000
func _on_End_body_enter( body ):
	print("hit ",body.get_meta("Player"))
	if (body.has_meta("Player")):
		updateScore(10)
		var end = get_node("End")
		var endpos = end.get_pos()
		endpos.x += moveby
		print(endpos)
		end.set_pos(endpos)

		var death = get_node("Death")
		var sc = death.get_scale()
		sc.x += moveby
		death.set_scale(sc)

		var new = ground.instance()
		var curpos = get_node("End").get_global_pos()
		curpos.x += rand_range(-20,-5)
		curpos.y += rand_range(-300,300)
		new.set_pos(curpos)
		get_node(".").add_child(new)

func updateScore(d):
	score += d
	var ps = get_node("player/camera/score")
	ps.clear()
	ps.add_text(str("Score: ",score))
	