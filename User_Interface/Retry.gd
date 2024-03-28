@tool
extends Button

#export(String,FILE) var next_scene_path: = ""

func _on_Play_BTN_button_up():
	PlayerData.score = 0
	get_tree().reload_current_scene()
