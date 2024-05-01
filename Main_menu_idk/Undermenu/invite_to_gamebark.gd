extends Button





func _on_pressed():
	print("invitetogame")
	get_tree().change_scene_to_file("res://Main pong.tscn")
