extends Node2D

var pollingTimer
var actionTimer
var rng = RandomNumberGenerator.new()
var currentFood
var currentWater
var numInList
var infected = false
var closestAgent
var closestAgentDistance = 1000
var closestInfected
var closestInfectedDistance = 1000
var firstRun = true
var priorities
var distanceToFood
var distanceToWater

# Data for this agent in the form [oppisite_agent, oppisite_infected, to_food, to_water, random_direction, stop, score]
var agentData = [50, 50, 50, 50, 50, 50, 0]

onready var globals = get_tree().current_scene.get_node("Global")
onready var AC = get_parent().get_node("Action Controller")

func _ready():
	if globals.randomiseFoodWater == true:
		rng.randomize()
		currentFood = round(rng.randf_range(globals.minFood, globals.maxFood))
		rng.randomize()
		currentWater = round(rng.randf_range(globals.minWater, globals.maxWater))
	else:
		currentFood = globals.maxFood
		currentWater = globals.maxWater
		
	# Setup a timer to check for closest agents
	pollingTimer = get_node("Polling")
	pollingTimer.connect("timeout", self, "find_closest")
	pollingTimer.set_wait_time(globals.pollingTime)
	pollingTimer.set_one_shot(false) # Make sure it loops
	pollingTimer.start()
	# Setup a timer to check for which action to take
	actionTimer = get_node("Action")
	actionTimer.connect("timeout", self, "decide_action")
	actionTimer.set_wait_time(globals.actionTime)
	actionTimer.set_one_shot(false) # Make sure it loops
	actionTimer.start()
	
# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y, feedNumInList, feedData):
	get_parent().set_position(Vector2(x, y))
	numInList = feedNumInList
	agentData = feedData
	
# Infects the current agent ensuring the disease can spread
func infect():
	get_node("../Normal").hide()
	get_node("../Infected").show()
	infected = true
	globals.notInfected.erase(get_parent())
	globals.infected.append(get_parent())
	agentData[globals.scorePosition] = agentData[globals.scorePosition] - 500
	
# Infects any agents in infection range
func infectothers():
	for agent in globals.notInfected:
		var brain = agent.get_node("Brain")
		var distance = get_parent().global_position.distance_to(agent.global_position)
		if distance < globals.infectionDistance and distance > 0:
			brain.infect()

# Finds the closest infected and non infected agents
func find_closest():
	closestAgentDistance = 100000
	closestInfectedDistance = 100000
	for agent in globals.notInfected:
		var distance = get_parent().position.distance_to(agent.position)
		if distance < closestAgentDistance and distance > 0:
			closestAgent = agent
			closestAgentDistance = distance
	for infected in globals.infected:
		var distance = get_parent().position.distance_to(infected.position)
		if distance < closestInfectedDistance and distance > 0:
			closestInfected = infected
			closestInfectedDistance = distance
	distanceToFood = get_parent().position.distance_to(globals.foodLocation)
	distanceToWater = get_parent().position.distance_to(globals.waterLocation)

# Just removes the time taken to get to the frame from the current food and water level of the agent
func food_water(delta):
		# Change food and water down by 1
	if globals.foodEnabled == true:
		currentFood = currentFood - delta
	if globals.waterEnabled == true:
		currentWater = currentWater - delta

func decide_action():
	var awayFromAgentPriority = (((1-(len(globals.infected)/globals.numberOfAgents))*agentData[0]) + ((1-(closestAgentDistance/globals.infectionDistance))*agentData[1])) / 2
	var awayFromInfectedPriority = (1-(closestInfectedDistance/globals.infectionDistance))*agentData[2]
	var towardsFoodPriority = (((1-(globals.infectedInFeed/globals.numberOfAgents))*agentData[3])+(1-(globals.feedDistance/distanceToFood)*agentData[4])+((1-(currentFood/globals.maxFood))*agentData[5]))/3
	var towardsWaterPriority = (((1-(globals.infectedInWater/globals.numberOfAgents))*agentData[6])+(1-(globals.feedDistance/distanceToWater)*agentData[7])+((1-(currentWater/globals.maxWater))*agentData[8]))/3
	var moveInDirectionPriority = (1-(0.5/1))*agentData[9] 
	var stopPriority = (1-(0.5/1))*agentData[10]
	
	priorities = [awayFromAgentPriority, awayFromInfectedPriority, towardsFoodPriority, towardsWaterPriority, moveInDirectionPriority, stopPriority]
	var bestPriority = 0
	var count = 0
	var outputcount = 0
	for priority in priorities:
		if priority > bestPriority:
			bestPriority = priority
			outputcount = count
		count = count + 1
		
	AC.change_state(outputcount, closestAgent, closestInfected)

func _process(delta):
	if infected == false:
		agentData[globals.scorePosition] = agentData[globals.scorePosition] + delta
	if firstRun:
		find_closest()
		decide_action()
		firstRun = false
	food_water(delta)
	if infected == true and globals.agentsCanSpread == true:
		infectothers()
