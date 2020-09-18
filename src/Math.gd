extends Object

# Called when the node enters the scene tree for the first time.
static func clamped_min(vector: Vector2, speed: float):
	if(abs(vector.x) < speed and vector.x != 0.0):
		var normalized_x = vector.x / abs(vector.x)
		vector.x = speed * normalized_x
	if(abs(vector.y) < speed and vector.y != 0.0):
		var normalized_y = vector.y / abs(vector.y)
		vector.y = speed * normalized_y

