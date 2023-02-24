extends UniformBrainArea

var currentpos = Vector2(0,0)
var targetpos = Vector2(0,0)
var SPEED = 100
var vector
var rng = RandomNumberGenerator.new()
var startposition

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# print("Agent Instantiated")
	
func movetostartpos(x, y):
	print("Spawn pos: " + str(x) + "," + str(y))
	get_parent().set_position(Vector2(x, y))
	
func getposition():
	currentpos = get_parent().get_position()

func updatetargetposition(x,y):
	targetpos.x = currentpos.x + x
	targetpos.y = currentpos.y + y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	var movementx = rng.randf_range(-1000, 1000)
	var movementy = rng.randf_range(-1000, 1000)
	getposition()
	updatetargetposition(movementx, movementy)
	vector = (targetpos - currentpos).normalized()
	get_parent().move_and_collide(vector * SPEED * delta)
	# print(currentpos)