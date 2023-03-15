extends KinematicBody2D

onready var globals = get_tree().current_scene.get_node("Global")
var rng = RandomNumberGenerator.new()
var SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func movetostartpos(x, y, rotation):
	print("Spawn pos: " + str(x) + "," + str(y))
	self.set_position(Vector2(x, y))
	self.rotation_degrees = rotation

func randommove():
	# Get random directions to move in
	rng.randomize()
	var movementx = rng.randf_range(-100, 100)
	var movementy = rng.randf_range(-100, 100)
	
	return (Vector2(movementx, movementy)).normalized()

func updatetargetposition(x,y):
	return (self.position + Vector2(x, y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var vector = randommove()
	if vector != Vector2(0,0):
		move_and_collide(vector * SPEED * delta)
	
	if globals.epochRun == true:
		for agent in globals.notInfected:
			var brain = agent.get_node("Brain")
			var distance = self.position.distance_to(agent.position)
			if distance < globals.infectionDistance:
				brain.infect()
