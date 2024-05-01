extends Button




func _on_pressed():
	print("birkbuttonpressed")
	get_tree().change_scene_to_file("res://Min pong.tscn")
