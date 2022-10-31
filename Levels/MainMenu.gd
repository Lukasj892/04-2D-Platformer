extends Control




func _on_Play_pressed():
	var _a = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_HowTo_pressed():
	var _b = get_tree().change_scene("res://Levels/HowToPlay.tscn")


func _on_Quit_pressed():
	get_tree().quit()
