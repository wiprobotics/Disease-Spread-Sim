extends UniformBrainArea

var currentpos = Vector2(0,0)
var targetpos = Vector2(0,0)
var SPEED = 100
var vector
var rng = RandomNumberGenerator.new()
var startposition

# Called when the node enters the scene tree for the first time, currently does nothing.
func _ready():
	pass
	# print("Agent Instantiated")
	
# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y):
	print("Spawn pos: " + str(x) + "," + str(y))
	get_parent().set_position(Vector2(x, y))
	
# Gets the current position of the kinematic body and returns it
func getposition():
	currentpos = get_parent().get_position()

# Sets a target position for the agent to move towards
func updatetargetposition(x,y):
	targetpos = currentpos + Vector2(x, y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get random directions to move in
	rng.randomize()
	var movementx = rng.randf_range(-1000, 1000)
	var movementy = rng.randf_range(-1000, 1000)
	getposition()
	updatetargetposition(movementx, movementy)
	vector = (targetpos - currentpos).normalized()
	# Move the kinematic body towards the target
	get_parent().move_and_collide(vector * SPEED * delta)