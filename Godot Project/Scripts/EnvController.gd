extends Node2D
var noAgents
var wallStarts = []
var wallRotations = []
var firstRun = true
var rng = RandomNumberGenerator.new()
var feedData = []

# Load all the prefabs for all the items the system will spawn in
var agentHolder = preload("res://Prefabs/Agent.tscn")
var wallHolder = preload("res://Prefabs/Wall.tscn")
var foodHolder = preload("res://Prefabs/Food Bank.tscn")
var waterHolder = preload("res://Prefabs/Watering Hole.tscn")
var infectorHolder = preload("res://Prefabs/Infector.tscn")

# Get the globals script
onready var globals = get_tree().current_scene.get_node("Global")

# Spawn in all the prefabs needed for a simulation
func instance_environment(randomMultipliers, feedMultipliers):
	if globals.foodEnabled == true:
		spawnfood()
	if globals.waterEnabled == true:
		spawnwater()
	if globals.infectorEnabled == true:
		spawninfector()
	if globals.spawnAgents == true:
		spawnagents(randomMultipliers, feedMultipliers)
	spawnwalls()

# Spawn all the agents needed for the simulation, feedMultipliers is actually the data array
func spawnagents(randomMultipliers, feedMultipliers):
	noAgents = globals.numberOfAgents
	# Map out a grid to spawn the agents into
	var gridSize = sqrt(noAgents)
	gridSize = round(gridSize) + 2
	var step = Vector2(round((get_viewport_rect().size.x) / gridSize), round((get_viewport_rect().size.y) / gridSize))
	
	# Spawn the agents
	var spawnpos = Vector2(step.x, step.y)
	# instances
	for i in range(noAgents):
		var agent = agentHolder.instance()
		var agentBrain = agent.get_node("Brain")
		globals.agents.append(agent)
		globals.agentBrains.append(agentBrain)
		globals.notInfected.append(agent)
		self.add_child(agent)
		# Randomise the variables in the data array if randomMultipliers is true
		if randomMultipliers == true:
			rng.randomize()
			feedData = [rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100),
			rng.randf_range(0, 100), rng.randf_range(0, 100), rng.randf_range(0, 100), 0]
		else:
			feedData = feedMultipliers[i]
		agentBrain.movetostartpos(spawnpos.x, spawnpos.y, i, feedData)
		spawnpos.x = spawnpos.x + step.x
		if spawnpos.x > get_viewport_rect().size.x - step.x:
			spawnpos.x = step.x
			spawnpos.y = spawnpos.y + step.y
		
# Spawn in walls to contain the agents
func spawnwalls():
	# Spawn in the 4 external walls to ensure the Agents cant escape
	declarewallstarts()
	for i in range(4):
		var temp = wallHolder.instance()
		self.add_child(temp)
		temp.movetostartpos(wallStarts[i].x, wallStarts[i].y, wallRotations[i])
		
# Spawn in the food bank
func spawnfood():
	var food = foodHolder.instance()
	self.add_child(food)
	var spawnpos = Vector2(round(get_viewport_rect().size.x * 0.3), round(get_viewport_rect().size.y * 0.5))
	food.movetostartpos(spawnpos.x, spawnpos.y, 0)
	globals.foodLocation = spawnpos
	
# Spawn in the watering hole
func spawnwater():
	var water = waterHolder.instance()
	self.add_child(water)
	var spawnpos = Vector2(round(get_viewport_rect().size.x * 0.6), round(get_viewport_rect().size.y * 0.5))
	water.movetostartpos(spawnpos.x, spawnpos.y, 0)
	globals.waterLocation = spawnpos
	
# Spawn the initial infector
func spawninfector():
	var infector = infectorHolder.instance()
	self.add_child(infector)
	infector.movetostartpos(round(get_viewport_rect().size.x * 0.5), round(get_viewport_rect().size.y * 0.5), 0)
	globals.infected.append(infector)

# Sets the locations for all the walls to go to
func declarewallstarts():
	wallStarts.append(Vector2(0, get_viewport_rect().size.y/2))
	wallStarts.append(Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y/2))
	wallStarts.append(Vector2(get_viewport_rect().size.x/2, 0))
	wallStarts.append(Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y))
	wallRotations = [0, 0, 90, 90]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
