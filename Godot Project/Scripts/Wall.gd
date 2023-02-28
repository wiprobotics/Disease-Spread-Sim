extends KinematicBody2D

# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y, rotation):
	print("Spawn pos: " + str(x) + "," + str(y))
	self.set_position(Vector2(x, y))
	self.rotation_degrees = rotation