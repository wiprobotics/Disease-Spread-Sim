extends Node2D

var freeTimer

onready var globals = get_tree().current_scene.get_node("Global")
onready var envController = get_tree().current_scene.get_node("EnvController")
onready var UI = get_tree().current_scene.get_node("UI")
var rng = RandomNumberGenerator.new()

func _ready():
	envController.instance_environment(true, [])
	freeTimer = get_node("Waitforfree")
	freeTimer.connect("timeout", self, "run_epoch")
	freeTimer.set_wait_time(1)
	freeTimer.set_one_shot(true) # Make sure it loops
	
func end_epoch():
	for agent in globals.agents:
		var brain = agent.get_node("Brain")
		globals.results.append(brain.agentData)
		agent.queue_free()
	globals.notInfected = []
	globals.infected = []
	globals.agents = []
	for child in envController.get_children():
		child.queue_free()
	
	globals.results.sort_custom(self, "sort_score")
	globals.bestScore = [] + globals.results[0]
	
	var third = round(globals.numberOfAgents/3)
	
	for i in range(third):
		var tempHolder = globals.results[i]
		tempHolder[globals.scorePosition] = 0
		globals.heldAgentData.append(tempHolder)
		var mutatedHolder = []
		for item in tempHolder:
			rng.randomize()
			mutatedHolder.append(item + rng.randf_range(-globals.maxMutation, globals.maxMutation))
		mutatedHolder[globals.scorePosition] = 0
		globals.heldAgentData.append(mutatedHolder)
	for i in range(globals.numberOfAgents - third*2):
		var randomHolder = [rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100),
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 0]
		globals.heldAgentData.append(randomHolder)
	
	globals.epochsRun = globals.epochsRun + 1
	globals.results = []
	freeTimer.start()
	
func sort_score(a, b):
	return a[globals.scorePosition] > b[globals.scorePosition]
	
func run_epoch():
	UI.gameTimer.start()
	envController.instance_environment(false, globals.heldAgentData)
	globals.epochRun = true