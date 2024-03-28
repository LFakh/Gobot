extends Node

signal score_updated

var score = 0: set = set_score

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func reset() -> void:
	score = 0
