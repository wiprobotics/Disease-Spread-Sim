extends Node2D

var freeTimer

onready var globals = get_tree().current_scene.get_node("Global")
onready var envController = get_tree().current_scene.get_node("EnvController")
onready var UI = get_tree().current_scene.get_node("UI")
var rng = RandomNumberGenerator.new()

func _ready():
	# Instance the sim environment
	envController.instance_environment(true, [])
	# A timer to wait for all the genetic calculations to be done before restarting the sim
	freeTimer = get_node("Waitforfree")
	freeTimer.connect("timeout", self, "run_epoch")
	freeTimer.set_wait_time(1)
	freeTimer.set_one_shot(true) # Make sure it loops
	
# Run at the end of an epoch
func end_epoch():
	# Add all remaining agent data to the results
	for agent in globals.agents:
		var brain = agent.get_node("Brain")
		globals.results.append(brain.agentData)
		agent.queue_free()
	# Reset all the global arrays
	globals.notInfected = []
	globals.infected = []
	globals.agents = []
	# Kill all remaining agents
	for child in envController.get_children():
		child.queue_free()
	
	# Sort the results by best score
	globals.results.sort_custom(self, "sort_score")
	globals.bestScore = [] + globals.results[0]
	
	# Finds one third of agents
	var third = round(globals.numberOfAgents/3)
	
	for i in range(third):
		# Saves the agents to the next epoch
		var tempHolder = globals.results[i]
		tempHolder[globals.scorePosition] = 0
		globals.heldAgentData.append(tempHolder)
		# Mutates the agents for the next epoch
		var mutatedHolder = []
		for item in tempHolder:
			rng.randomize()
			mutatedHolder.append(item + rng.randf_range(-globals.maxMutation, globals.maxMutation))
		mutatedHolder[globals.scorePosition] = 0
		globals.heldAgentData.append(mutatedHolder)
	# Randomise the final third of agents for the next epoch
	for i in range(globals.numberOfAgents - third*2):
		var randomHolder = [rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100),
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 0]
		globals.heldAgentData.append(randomHolder)
	
	globals.epochsRun = globals.epochsRun + 1
	globals.results = []
	freeTimer.start()

# Sort the two results by score
func sort_score(a, b):
	return a[globals.scorePosition] > b[globals.scorePosition]
	
# Runs the next epoch by instancing the environment and starting the timer
func run_epoch():
	UI.epochTimer.start()
	envController.instance_environment(false, globals.heldAgentData)
	globals.epochRun = true
