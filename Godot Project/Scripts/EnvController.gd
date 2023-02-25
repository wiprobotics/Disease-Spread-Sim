extends Node2D
var agents = []
var agentbrains = []
var agentholder = preload("res://Prefabs/Agent.tscn")
var wallholder = preload("res://Prefabs/Wall.tscn")
var noAgents = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	var gridsize = sqrt(noAgents)
	gridsize = round(gridsize) + 2
	var step = Vector2(round((get_viewport_rect().size.x) / gridsize), round((get_viewport_rect().size.y) / gridsize))
	
	var spawnpos = Vector2(step.x, step.y)
	# instances
	for i in range(noAgents):
		var temp = agentholder.instance()
		var agentbrain = temp.get_node("Brain")
		agents.append(temp)
		agentbrains.append(agentbrain)
		self.add_child(temp)
		agentbrain.movetostartpos(spawnpos.x, spawnpos.y)
		spawnpos.x = spawnpos.x + step.x
		if spawnpos.x > get_viewport_rect().size.x - step.x:
			spawnpos.x = step.x
			spawnpos.y = spawnpos.y + step.y
			
	var wallleft = wallholder.instance()
	self.add_child(wallleft)
	wallleft.position = Vector2(0, get_viewport_rect().size.y / 2)
	
	var wallright = wallholder.instance()
	self.add_child(wallright)
	wallright.position = Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y / 2)
	
	var walltop = wallholder.instance()
	self.add_child(walltop)
	walltop.position = Vector2(get_viewport_rect().size.x / 2, 0)
	walltop.rotation_degrees = 90

	var wallbottom = wallholder.instance()
	self.add_child(wallbottom)
	wallbottom.position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y)
	wallbottom.rotation_degrees = 90
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
