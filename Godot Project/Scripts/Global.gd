extends Node2D
# warning-ignore-all:unused_class_variable

# ---------------------------------- Globally Stored Variables ----------------------------------

var agents = []
var agentBrains = []
var infected = []
var notInfected = []
var foodLocation = Vector2(0,0)
var waterLocation = Vector2(0,0)
var results = []
var epochRun = true
var epochsRun = 0
var heldAgentData = []
var bestScore = [0, 0, 0, 0, 0, 0, 0]
var infectedInFeed = 0
var infectedInWater = 0

# ---------------------------------- Simulation Settings ----------------------------------

var epochLength = 30
var maxMutation = 2

# ---------------------------------- Agent Settings ----------------------------------

var numberOfAgents = 50
var pollingTime = 1.0
var actionTime = 0.75
var neuralNetEnabled = true
var agentSpeed = 200
var scorePosition = 11

# ---------------------------------- Food and Water Settings ----------------------------------

# Enables or disables randomising food and water values inside of agents
var randomiseFoodWater = true
# Enables or disables the food functionality in the environment and agents
var foodEnabled = true
# The maximum amount of food an agent can have, basically = seconds as food goes down with time
var maxFood = 40 
# The minimum amount of food an agent can have, basically = seconds as food goes down with time
var minFood = 20 
# Enables or disables the water functionality in the environment and agents
var waterEnabled = true
# The maximum amount of water an agent can have, basically = seconds as water goes down with time
var maxWater = 40
# The minimum amount of water an agent can have, basically = seconds as water goes down with time
var minWater = 20
# The distance at which the agents may feed and water
var feedDistance = 22

# ---------------------------------- Infection Settings ----------------------------------

var infectionEnabled = true
var infectorEnabled = true
var agentsCanSpread = true
var aggresiveInfection = true
var infectionDistance = 25
