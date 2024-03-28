@tool
extends Button

#export(String,FILE) var next_scene_path: = ""

func _on_Play_BTN_button_up():
	get_tree().change_scene_to_file("res://Screens/MainScreen.tscn")
