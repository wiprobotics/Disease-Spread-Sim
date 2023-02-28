extends Node2D
var agents = []
var agentbrains = []
var walls = []
var noAgents = 60
var wallstarts = []
var wallrotations = []

var agentholder = preload("res://Prefabs/Agent.tscn")
var wallholder = preload("res://Prefabs/Wall.tscn")
var foodholder = preload("res://Prefabs/Food Bank.tscn")
var waterholder = preload("res://Prefabs/Watering Hole.tscn")
var infectorholder = preload("res://Prefabs/Infector.tscn")

onready var globals = get_tree().current_scene.get_node("Global")

func _ready():
	spawnagents()
	spawnwalls()
	if globals.foodenabled == true:
		spawnfood()
	if globals.waterenabled == true:
		spawnwater()
	if globals.infectorenabled == true:
		spawninfector()

func spawnagents():
	# Map out a grid to spawn the agents into
	var gridsize = sqrt(noAgents)
	gridsize = round(gridsize) + 2
	var step = Vector2(round((get_viewport_rect().size.x) / gridsize), round((get_viewport_rect().size.y) / gridsize))
	
	# Spawn the agents
	var spawnpos = Vector2(step.x, step.y)
	# instances
	for i in range(noAgents):
		var temp = agentholder.instance()
		var agentbrain = temp.get_node("Brain")
		globals.agents.append(temp)
		globals.agentbrains.append(agentbrain)
		self.add_child(temp)
		agentbrain.movetostartpos(spawnpos.x, spawnpos.y, i)
		spawnpos.x = spawnpos.x + step.x
		if spawnpos.x > get_viewport_rect().size.x - step.x:
			spawnpos.x = step.x
			spawnpos.y = spawnpos.y + step.y
			
func spawnwalls():
	# Spawn in the 4 external walls to ensure the Agents cant escape
	declarewallstarts()
	for i in range(4):
		var temp = wallholder.instance()
		self.add_child(temp)
		temp.movetostartpos(wallstarts[i].x, wallstarts[i].y, wallrotations[i])
		
func spawnfood():
	var food = foodholder.instance()
	self.add_child(food)
	food.movetostartpos(round(get_viewport_rect().size.x * 0.3), round(get_viewport_rect().size.y * 0.5), 0)
	
func spawnwater():
	var water = waterholder.instance()
	self.add_child(water)
	water.movetostartpos(round(get_viewport_rect().size.x * 0.6), round(get_viewport_rect().size.y * 0.5), 0)
	
func spawninfector():
	var infector = infectorholder.instance()
	self.add_child(infector)
	infector.movetostartpos(round(get_viewport_rect().size.x * 0.5), round(get_viewport_rect().size.y * 0.5), 0)

# Sets the locations for all the walls to go to
func declarewallstarts():
	wallstarts.append(Vector2(0, get_viewport_rect().size.y/2))
	wallstarts.append(Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y/2))
	wallstarts.append(Vector2(get_viewport_rect().size.x/2, 0))
	wallstarts.append(Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y))
	wallrotations = [0, 0, 90, 90]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
