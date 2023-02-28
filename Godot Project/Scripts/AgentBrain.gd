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

onready var globals = get_tree().current_scene.get_node("Global")

# Called when the node enters the scene tree for the first time, currently does nothing.
func _ready():
	rng.randomize()
	currentfood = round(rng.randf_range(1000, 2000))
	rng.randomize()
	currentwater = round(rng.randf_range(1000, 2000))
	# print("Agent Instantiated")
	
# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y, feednuminlist):
	print("Spawn pos: " + str(x) + "," + str(y))
	get_parent().set_position(Vector2(x, y))
	numinlist = feednuminlist
	
# Gets the current position of the kinematic body and returns it
func getposition():
	currentpos = get_parent().global_position

# Sets a target position for the agent to move towards
func updatetargetposition(x,y):
	targetpos = currentpos + Vector2(x, y)
	
func infect():
	get_node("../Normal").hide()
	get_node("../Infected").show()
	infected = true

func infectothers():
	for agent in globals.agents:
		var brain = agent.get_node("Brain")
		if brain.infected == false:
			var distance = get_parent().global_position.distance_to(agent.global_position)
			if distance < 25 and distance > 0:
				brain.infect()

func randommove():
	# Get random directions to move in
	rng.randomize()
	var movementx = rng.randf_range(-1000, 1000)
	var movementy = rng.randf_range(-1000, 1000)
	updatetargetposition(movementx, movementy)
	vector = (targetpos - currentpos).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.foodenabled == true:
		currentfood = currentfood - 1
	if globals.waterenabled == true:
		currentwater = currentwater - 1
		
	if infected == true and globals.agentscanspread == true:
		infectothers()
		
	getposition()
	var i = 0
	var closest = 10000
	var closestagent
	if infected == true and globals.aggresiveinfection == true:
		for agent in globals.agents:
			var brain = agent.get_node("Brain")
			if brain.infected == false:
				var distance = get_parent().global_position.distance_to(agent.global_position)
				if distance < closest:
					closestagent = globals.agents[i]
					closest = distance
					
			i = i+1
			
		if closestagent != null:
			vector = (closestagent.global_position - currentpos).normalized()
		else:
			randommove()
	
	else:
		randommove()
	# Move the kinematic body towards the target
	get_parent().move_and_collide(vector * SPEED * delta)