extends Node2D

var vector = Vector2(0,0)
var speed
var rng = RandomNumberGenerator.new()
var state
var closestAgent
var closestInfected

onready var globals = get_tree().current_scene.get_node("Global")

func _ready():
	speed = globals.agentSpeed

func move_away_from_closest_agent(var agent):
	if agent in globals.agents:
		vector = -(get_parent().global_position.direction_to(agent.global_position))

func move_away_from_closest_infected(var infected):
	if infected in globals.agents:
		vector = -(get_parent().global_position.direction_to(infected.global_position))

func move_towards_food():
	vector = (get_parent().global_position.direction_to(globals.foodLocation))

func move_towards_water():
	vector = (get_parent().global_position.direction_to(globals.waterLocation))

func move_in_random_direction():
	rng.randomize()
	var movementx = rng.randf_range(-speed, speed)
	var movementy = rng.randf_range(-speed, speed)

func stop_moving():
	vector = Vector2(0, 0)

func change_state(outputcount, feedClosestAgent, feedClosestInfected):
	state = outputcount
	closestAgent = feedClosestAgent
	closestInfected = feedClosestInfected

func _physics_process(delta):
	if state == 0:
		move_away_from_closest_agent(closestAgent)
	elif state == 1:
		move_away_from_closest_infected(closestInfected)
	elif state == 2:
		move_towards_food()
	elif state == 3:
		move_towards_water()
	elif state == 4:
		move_in_random_direction()
	elif state == 5:
		stop_moving()
	get_parent().move_and_collide(vector * speed * delta)