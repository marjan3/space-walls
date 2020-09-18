extends KinematicBody2D

const Math = preload("Math.gd")

export var maxSpeed = 500
export var minSpeed = 300

# class member variables go here, for example:
var direction = Vector2(0, -1)
var velocity = Vector2(0, minSpeed)

signal enemy_touched()

onready var animation_player = get_node("AnimationPlayer")

func _ready():
	var idle_animation = animation_player.get_animation("idle")
	idle_animation.set_loop(true)
	animation_player.play("idle")
	set_process(true)

func _process(delta):
	# move
	var collision = move_and_collide(velocity * delta)
	# handle colision
	if collision:
		var collider = collision.collider
		
		if collider.is_in_group("enemies"):
#			print("Collided with the enemies!: " + str(collider))
			handle_enemy_collision(collider, self, delta)
		elif collider.is_in_group("platforms"):
#			print("Collided with the platforms")
			handle_platform_collision(collider, self, delta)
		elif collider.is_in_group("players"):
#			print("Collided with the players!")
			handle_player_collision(collider, self, delta)
		elif collider.is_in_group("falls"):
#			print("Collided with the fall!")
			handle_out_of_bounds_collision(collider, self, delta)
			return
		
		# calculate velocity
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
#
#		# clamp
		velocity = velocity.clamped(maxSpeed)
		Math.clamped_min(velocity, minSpeed)
		
		# move
#		move_and_collide(reflect)

func handle_platform_collision(platform, meteor, delta):
	pass
	
func handle_enemy_collision(enemy: CollisionObject2D, meteor, delta) -> void:
	emit_signal("enemy_touched", enemy)

func handle_player_collision(player, meteor, delta):
	var diff = 0
	
func handle_out_of_bounds_collision(platform, meteor, delta):
#	print("Ball has fallen!")
	pass


