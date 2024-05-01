extends RigidBody2D

## Hastig og friction edit i editor/inspector
@export var speed = 500
@export var friction = 0.1

## function for movement scripted, aka motion controller
func _process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		movement.y = -speed
	elif Input.is_action_pressed("move_down"):
		movement.y = speed

	# Apply force to the paddle
	apply_central_impulse(movement * delta)
	
	# Apply friction to gradually slow down the paddle, mere instant slow down
	var friction_force = -linear_velocity * friction
	apply_central_impulse(friction_force * delta)
