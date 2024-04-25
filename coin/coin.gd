extends Area2D

class_name Coin

@export var score: = 1
var taken = false

func _on_coin_body_enter(body):
	if not taken and body is Player:
		($Anim as AnimationPlayer).play("taken")
		taken = true
		PlayerData.score += score
