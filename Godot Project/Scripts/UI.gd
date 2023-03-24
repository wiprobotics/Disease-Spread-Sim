extends PanelContainer

var epochTimer

# Gets all the UI elements which it needs to communicate with
onready var globals = get_tree().current_scene.get_node("Global")
onready var timerLabel = get_node("GridContainer/Timer/Counter/Label")
onready var agentsLabel = get_node("GridContainer/AgentsCounter/Counter/Label")
onready var infectedLabel = get_node("GridContainer/InfectedCounter/Counter/Label")
onready var epochLabel = get_node("GridContainer/EpochCounter/Counter/Label")
onready var bestAgentLabel = get_node("GridContainer/BestAgent/Counter/Label")
onready var geneticController = get_tree().current_scene.get_node("Genetic Controller")

func _ready():
	# The epoch timer for the system
	epochTimer = get_node("GridContainer/Timer/Counter/Label/Timer")
	epochTimer.connect("timeout", self, "end_epoch")
	epochTimer.set_wait_time(globals.epochLength)
	epochTimer.set_one_shot(true) 
	epochTimer.start()

# Runs at the end of the epoch timer to tell the system the epoch has ended
func end_epoch():
	globals.epochRun = false
	geneticController.end_epoch()
	
# Updates all the UI elements to say correct values
func _process(delta):
	timerLabel.text = str(round(epochTimer.time_left))
	agentsLabel.text = (str(len(globals.agents)) + "/" + (str(globals.numberOfAgents)))
	infectedLabel.text = str(len(globals.infected) - 1)
	epochLabel.text = str(globals.epochsRun)
	bestAgentLabel.text = str(globals.bestScore)
