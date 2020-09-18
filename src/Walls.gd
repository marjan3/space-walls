extends Node

signal ball_exited

func _ready():
	pass

func _on_OutOfBoundsWall_body_entered(body) -> void:
	if body.is_in_group("balls"):
#		print("ball exited")
		self.emit_signal("ball_exited")
	pass
