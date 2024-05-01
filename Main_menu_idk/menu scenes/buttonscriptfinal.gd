extends Sprite2D


func _on_birk_buttontest_pressed():
	print("birkbuttonpressed")
	get_tree().change_scene_to_file("res://Main_menu_idk/Undermenu/Barkfriendstats.tscn")

func _on_thecriminal_pressed():
	print("thecriminal")
	get_tree().change_scene_to_file("res://Main_menu_idk/Undermenu/nachofriendstats.tscn")


func _on_sebbutton_pressed():
	print("seb")
	get_tree().change_scene_to_file("res://Main_menu_idk/Undermenu/sebfriendstatsscene.tscn")

func _on_yapperbutton_pressed():
	print("yap")
	get_tree().change_scene_to_file("res://Main_menu_idk/Undermenu/yapfriendstats.tscn")
