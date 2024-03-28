@tool
extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer 
@export var next_scene: PackedScene

func _ready():
	$AnimationPlayer.play_backwards("fade_in")

func _on_body_entered(_bbody):
	if get_overlapping_bodies().size()>0 :
		$AnimationPlayer.play("fade_in")
		next_level()
#	teleport()  
	
#func _on_body_exited(_bbody):
#	$AnimationPlayer.play("START")


func _get_configuration_warnings() -> PackedStringArray:
	return ["the next scene can't be empty"] if not next_scene else""

#func teleport() -> void:
#	if body.is_in_group("player"):
#		anim_player.play("fade_in")
#	yield(anim_player, "animation_finished")

func next_level():
	var ERR = get_tree().change_scene_to_packed(next_scene)
	if ERR != OK:
		print("something failed")
