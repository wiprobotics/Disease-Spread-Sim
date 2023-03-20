extends PanelContainer

var gameTimer

onready var globals = get_tree().current_scene.get_node("Global")
onready var timerLabel = get_node("GridContainer/Timer/Counter/Label")
onready var agentsLabel = get_node("GridContainer/AgentsCounter/Counter/Label")
onready var infectedLabel = get_node("GridContainer/InfectedCounter/Counter/Label")
onready var epochLabel = get_node("GridContainer/EpochCounter/Counter/Label")
onready var bestAgentLabel = get_node("GridContainer/BestAgent/Counter/Label")
onready var geneticController = get_tree().current_scene.get_node("Genetic Controller")

func _ready():
	gameTimer = get_node("GridContainer/Timer/Counter/Label/Timer")
	gameTimer.connect("timeout", self, "end_epoch")
	gameTimer.set_wait_time(globals.epochLength)
	gameTimer.set_one_shot(true) 
	gameTimer.start()

func end_epoch():
	globals.epochRun = false
	geneticController.end_epoch()
	
func _process(delta):
	timerLabel.text = str(round(gameTimer.time_left))
	agentsLabel.text = (str(len(globals.agents)) + "/" + (str(globals.numberOfAgents)))
	infectedLabel.text = str(len(globals.infected) - 1)
	epochLabel.text = str(globals.epochsRun)
	bestAgentLabel.text = str(globals.bestScore)
