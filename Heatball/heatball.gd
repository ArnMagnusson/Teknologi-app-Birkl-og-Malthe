extends RigidBody2D

class_name Heart

# So we can change it in the editor without modifying the code
@export var initial_speed_heart: float = 300
@export var speed_multiplier: float = 1.04
@export var friction: float = 0
var current_velocity: Vector2

# Start heart for movement. direction retning
func _ready():
	_readyheart()
		
# ready heart function den der står for at randomize i starten
func _readyheart():
	print("start")
	randomize()
	var direction_x = [-1, 1][randi() % 2]
	var direction_y = [-1, 1][randi() % 2]
	current_velocity = Vector2(direction_x, direction_y).normalized() * initial_speed_heart
	set_linear_velocity(current_velocity)
	print("endrandomize")

#reflect koden aka bounce når den rammer en collisionbox, move and colide(reflect) main der gør det
func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(current_velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		current_velocity = current_velocity.bounce(collision.get_normal())
		set_linear_velocity(current_velocity)
		move_and_collide(reflect)

	# To remove friction so the heart has a constant speed, uden vil heart miste fart efter hver bounce.
	var friction_force = -linear_velocity * friction
	apply_central_impulse(friction_force * delta)
