extends Node

signal score_updated
#this
signal coin_taken(score: int)
#
var score = 0: set = set_score

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func reset() -> void:
	score = 0

func _on_coin_taken(score: int):
	score += score
	emit_signal("score_updated", score)
