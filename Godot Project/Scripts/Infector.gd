extends KinematicBody2D

onready var globals = get_tree().current_scene.get_node("Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func movetostartpos(x, y, rotation):
	print("Spawn pos: " + str(x) + "," + str(y))
	self.set_position(Vector2(x, y))
	self.rotation_degrees = rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	for agent in globals.agents:
		var brain = agent.get_node("Brain")
		var distance = self.position.distance_to(agent.position)
		if distance < 25:
			brain.infect()
