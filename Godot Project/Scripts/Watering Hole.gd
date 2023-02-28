extends Node2D

onready var globals = get_tree().current_scene.get_node("Global")

func _ready():
	globals.waterlocation = self.position
	
func movetostartpos(x, y, rotation):
	print("Spawn pos: " + str(x) + "," + str(y))
	self.set_position(Vector2(x, y))
	self.rotation_degrees = rotation

func _process(delta):
	var i = 0
	for agent in globals.agents:
		var brain = agent.get_node("Brain")
		if brain.currentwater < 0:
			agent.queue_free()
			globals.agents.remove(i)
			print("Bleh (Water)")
		var distance = self.position.distance_to(agent.position)
		if distance < 22:
			agent.get_node("Brain").currentwater = 1000
			
		i = i + 1
		

