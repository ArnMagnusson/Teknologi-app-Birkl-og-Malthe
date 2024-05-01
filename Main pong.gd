extends Node2D

var p1_score = 0
var p2_score = 0

@onready var p2_paddle = $p2paddle
@onready var p1_paddle = $p1paddle
@onready var heart = $Heart as Heart
@onready var right_edge = $rightedge
@onready var left_edge = $leftedge

#heart start function se heatball script for mere info. print=debug stuff
func _ready():
	heart = $Heart
	if heart:
		_readyheart()
	else:
		print("Heart node not found!")

#mere debug stuff, -heart._readyheart() starter heart movement fra func over
func _readyheart():
	print("Start heart movement initialization")
	heart._readyheart()
	print("Heart movement initialized")

#left goal, despawn+score
func _on_leftedge_p2_scored():
	p2_score += 1
	print("p2score")
	emit_signal("point_scored", "p2") # Emit signal indicating player 2 scored
	_reset_heart_state()  # Reset the heart when player 2 scores

#rightedge despawn+score
func _on_rightedge_p1_scored():
	p1_score += 1
	print("p1scored")
	emit_signal("point_scored", "p1") # Emit signal indicating player 1 scored
	_reset_heart_state()  # Reset the heart when player 1 scores


#reset heart function, reseter posistionen til midten, fart til 0, og 
#starter _readyheart igen
func _reset_heart_state():
	print("Resetting heart state")
	heart.global_position.y = 182
	heart.global_position.x = 572
	heart.current_velocity = Vector2.ZERO
	heart.set_linear_velocity(Vector2.ZERO)
	_readyheart()
