extends UniformBrainArea

var currentpos = Vector2(0,0)
var targetpos = Vector2(0,0)
var SPEED = 100
var vector
var rng = RandomNumberGenerator.new()
var currentfood = 1000
var currentwater = 1000
var numinlist
var infected = false
var closestagents = []
var closestdistances = []
var closestinfected = []
var distancethread
var pollingTimer
var firstrun = true
var outputMoves = []
var synaptic
var result

onready var globals = get_tree().current_scene.get_node("Global")

# Called when the node enters the scene tree for the first time, currently does nothing.
func _ready():
	if globals.randomiseFoodWater == true:
		rng.randomize()
		currentfood = round(rng.randf_range(1000, 2000))
		rng.randomize()
		currentwater = round(rng.randf_range(1000, 2000))
	pollingTimer = get_node("Timer")
	pollingTimer.connect("timeout", self, "find_closest")
	pollingTimer.set_wait_time(globals.pollingTime)
	pollingTimer.set_one_shot(false) # Make sure it loops
	pollingTimer.start()
	for x in range(-10, 10, 1): # x axis
		for y in range(-10, 10, 1): # y axis
			outputMoves.append(Vector2(x, y))
			
# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y, feednuminlist):
	# print("Spawn pos: " + str(x) + "," + str(y))
	get_parent().set_position(Vector2(x, y))
	numinlist = feednuminlist
	
# Gets the current position of the kinematic body and returns it
func getposition():
	currentpos = get_parent().global_position

# Sets a target position for the agent to move towards
func updatetargetposition(x,y):
	return (currentpos + Vector2(x, y))

func infect():
	get_node("../Normal").hide()
	get_node("../Infected").show()
	infected = true
	globals.notInfected.erase(get_parent())
	globals.infected.append(get_parent()) 

func infectothers():
	for agent in globals.notInfected:
		var brain = agent.get_node("Brain")
		var distance = get_parent().global_position.distance_to(agent.global_position)
		if distance < globals.infectionDistance and distance > 0:
			brain.infect()

func randommove():
	# Get random directions to move in
	rng.randomize()
	var movementx = rng.randf_range(-1000, 1000)
	var movementy = rng.randf_range(-1000, 1000)
	
	return (updatetargetposition(movementx, movementy) - currentpos).normalized()

func zombiemove():
	var targetagent = null
	var targetdistance = INF
	if len(globals.notInfected) != 0:
		for agent in globals.notInfected:
			var distance = agent.position.distance_squared_to(get_parent().position)
			if distance < targetdistance:
				targetagent = agent
				targetdistance = distance
			
		return (targetagent.position - currentpos).normalized()
	else:
		return randommove()

func food_water(delta):
		# Change food and water down by 1
	if globals.foodEnabled == true:
		currentfood = currentfood - delta
	if globals.waterEnabled == true:
		currentwater = currentwater - delta

func find_closest():
	closestdistances = [INF, INF, INF]
	closestagents = [null, null, null]
	closestinfected = [false, false, false]
	var ownposition = get_parent().position
	for agent in globals.agents:
		var distance = agent.position.distance_squared_to(ownposition)
		if distance < closestdistances[0]:
			closestdistances[2] = closestdistances[1]
			closestagents[2] = closestagents[1]
			closestinfected[2] = closestinfected[1]
			closestdistances[1] = closestdistances[0]
			closestagents[1] = closestagents[0]
			closestinfected[1] = closestinfected[0]
			closestdistances[0] = distance
			closestagents[0] = agent
			closestinfected[0] = agent.get_node("Brain").infected
		elif distance < closestdistances[1]:
			closestdistances[2] = closestdistances[1]
			closestagents[2] = closestagents[1]
			closestinfected[2] = closestinfected[1]
			closestdistances[1] = distance
			closestagents[1] = agent
			closestinfected[1] = agent.get_node("Brain").infected
		elif distance < closestdistances[2]:
			closestdistances[2] = distance
			closestagents[2] = agent
			closestinfected[2] = agent.get_node("Brain").infected

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if firstrun:
		find_closest()
		firstrun = false
	food_water(delta)
	getposition()
	if infected == true and globals.agentsCanSpread == true:
		infectothers()
		
	var i = 0
	var closest = 10000
	if infected == true and globals.aggresiveInfection == true:
		vector = zombiemove()
	
	elif globals.randomMovement == true:
		vector = randommove()

	if vector != null:
		# Move the kinematic body towards the target
		get_parent().move_and_slide(vector * SPEED * delta)