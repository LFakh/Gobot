@tool
extends Button

@export var next_scene_path: = "" # (String,FILE)

func _on_Play_BTN_button_up():
	get_tree().change_scene_to_file(next_scene_path)
	PlayerData.score = 0

func _get_configuration_warnings()-> PackedStringArray:
	return ["next_scene_is_empty"] if next_scene_path == "" else ""
