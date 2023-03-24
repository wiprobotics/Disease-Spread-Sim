extends Node2D
# warning-ignore-all:unused_class_variable

# ---------------------------------- Globally Stored Variables ----------------------------------
# All these variables are to be accessed by other scripts in the system

# An array which holds all the agent objects
var agents = []
# An array which holds all the brains belonging to the agents in the same order as above
var agentBrains = []
# An array which holds reference to all the infected agents 
var infected = []
# An array which holds reference to all the non infected agents
var notInfected = []
# Stores the vector location of the food bank object
var foodLocation = Vector2(0,0)
# Stores the vector location of the watering hole object
var waterLocation = Vector2(0,0)
# An array of arrays to store the data values of the agents from the last epoch
var results = []
# A boolean value which tells the system whether an epoch is running or not
var epochRun = true
# A count of how many epochs have been run
var epochsRun = 0
# An array of arrays to store the data values for the next epoch
var heldAgentData = []
# Stores the best score of the last epoch
var bestScore = [0, 0, 0, 0, 0, 0, 0]
# Counts the number of infected agents in the food bank
var infectedInFeed = 0
# Counts the number of infected agents in the water bank
var infectedInWater = 0

# ---------------------------------- Simulation Settings ----------------------------------

# The length of every epoch (in seconds)
var epochLength = 30
# The maximum change the genetic aglorithm can do to the top scoring agents every epoch
var maxMutation = 2
# Enables or disables spawning agents into the environment, basically just for showing environment (Breaks everything if turned off)
var spawnAgents = true

# ---------------------------------- Agent Settings ----------------------------------

# The number of agents to be spawned into the simulation
var numberOfAgents = 50
# The time between agents polling their environment (in seconds)
var pollingTime = 0.25
# The time between agents deciding their actions (in seconds)
var actionTime = 0.25
# Enables or disables the neural net in the agents, bascially just stops agents moving
var neuralNetEnabled = true
# The speed at which agents move
var agentSpeed = 200
# The position in which the score value is in the data array for agents
var scorePosition = 11

# ---------------------------------- Food and Water Settings ----------------------------------

# Enables or disables randomising food and water values inside of agents
var randomiseFoodWater = true
# Enables or disables the food functionality in the environment and agents
var foodEnabled = true
# The maximum amount of food an agent can have, basically = seconds as food goes down with time
var maxFood = 25
# The minimum amount of food an agent can have, basically = seconds as food goes down with time
var minFood = 20 
# Enables or disables the water functionality in the environment and agents
var waterEnabled = true
# The maximum amount of water an agent can have, basically = seconds as water goes down with time
var maxWater = 25
# The minimum amount of water an agent can have, basically = seconds as water goes down with time
var minWater = 20
# The distance at which the agents may feed and water
var feedDistance = 22

# ---------------------------------- Infection Settings ----------------------------------

# Enables or disables the disease system
var infectionEnabled = true
# Enables or disables the spawning of the initial infector pawn
var infectorEnabled = true
# Enables or disables agents spreading disease to eachother 
var agentsCanSpread = true
# The distance at which the disease can spread
var infectionDistance = 25
