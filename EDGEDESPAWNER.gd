extends Area2D

#signal til main pong til restart af spillet
signal point_scored

#debug til at heart rammer despawn area/goal
func _on_body_entered(body):
	if body is Heart:
		point_scored.emit()
