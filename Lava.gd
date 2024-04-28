extends Area2D

#class_name Lava


func _on_body_entered(_bbody: PhysicsBody2D)->void:
	get_tree().reload_current_scene()
	PlayerData.score = 0

