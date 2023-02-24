extends Node2D
var agents = []
var agentbrains = []
var agentholder = preload("Agent.tscn")
var noAgents = 20

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
		if spawnpos.x > get_viewport_rect().size.x:
			spawnpos.x = step.x
			spawnpos.y = spawnpos.y + step.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
