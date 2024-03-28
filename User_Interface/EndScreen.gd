extends Control

@onready var label: Label = get_node("Title")


func _ready() -> void:
	label.text = label.text % [PlayerData.score]
	
