extends Node2D
var agents = []
var agentbrains = []
var agentholder = preload("Agent.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(20):
		var temp = agentholder.instance()
		var agentbrain = temp.get_node("Brain")
		agents.append(temp)
		agentbrains.append(agentbrain)
		self.add_child(temp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
