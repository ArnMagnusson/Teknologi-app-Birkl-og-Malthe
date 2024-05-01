extends RigidBody2D

@export var speed = 500
@export var friction = 0.1
func _process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		movement.y = -speed
	elif Input.is_action_pressed("ui_down"):
		movement.y = speed

	# Apply force to the paddle
	apply_central_impulse(movement * delta)
	
	# Apply friction to gradually slow down the paddle
	var friction_force = -linear_velocity * friction
	apply_central_impulse(friction_force * delta)
