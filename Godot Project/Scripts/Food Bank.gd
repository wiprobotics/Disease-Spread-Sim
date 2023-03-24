extends Node2D

onready var globals = get_tree().current_scene.get_node("Global")

func movetostartpos(x, y, rotation):
	print("Spawn pos: " + str(x) + "," + str(y))
	self.set_position(Vector2(x, y))
	self.rotation_degrees = rotation
	
func _process(delta):
	var i = 0
	globals.infectedInFeed = 0
	if globals.epochRun == true:
		# Iterates through every agent
		for agent in globals.agents:
			var brain = agent.get_node("Brain")
			# Kills the agent if they've run out of food
			if brain.currentFood < 0:
				brain.agentData[globals.scorePosition] = brain.agentData[globals.scorePosition] - 1000
				globals.results.append(brain.agentData)
				agent.queue_free()
				globals.agents.erase(agent)
				if agent in globals.notInfected:
					globals.notInfected.erase(agent)
				elif agent in globals.infected:
					globals.infected.erase(agent)
				print("Bleh (Food)")
			# Refills the agents food if they are close enough
			var distance = self.position.distance_to(agent.position)
			if distance < globals.feedDistance:
				agent.get_node("Brain").currentFood = globals.maxFood
				if agent.get_node("Brain").infected == true:
					globals.infectedInFeed = globals.infectedInFeed + 1
					
			
		i = i + 1

