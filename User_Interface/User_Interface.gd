@tool
extends Control

var paused = false: set = set_paused

@onready var scene_tree: = get_tree()
@onready var pause_overlay: ColorRect =  get_node("PauseOverlay")
@onready var score: Label = get_node("UR_score")
@onready var pause_title: Label = get_node("PauseOverlay/pause")


func _ready() -> void:
	PlayerData.connect("score_updated", Callable(self, "update_interface"))
#	PlayerData.connect("player_died", self, "PlayerData_player_died")
	update_interface()
	paused = false
	scene_tree.paused = false
	pause_overlay.visible = false

func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = "You Died"

func update_interface() -> void:
	score.text = "score %s" %PlayerData.score

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()


func set_paused(value: bool) ->void:
	paused = value 
	scene_tree.paused = value
	pause_overlay.visible = value
