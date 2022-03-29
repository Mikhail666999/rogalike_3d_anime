extends Control



func _on_start_pressed():
	get_tree().change_scene("res://assets/chunks/test/test.scn")
	pass # Replace with function body.


func _on_settings_pressed():
	get_tree().change_scene("res://assets/menu/menu_settings/menu_settings.scn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


