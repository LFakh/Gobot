extends CharacterBody2D

class_name Enemy


const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)

const STATE_WALKING = 0
const STATE_KILLED = 1
const WALK_SPEED = 70 

var linear_velocity = Vector2()
var direction = -1
var anim = ""

# state machine
var state = STATE_WALKING

@onready var DetectFloorLeft = $DetectFloorLeft
@onready var DetectWallLeft = $DetectWallLeft
@onready var DetectFloorRight = $DetectFloorRight
@onready var DetectWallRight = $DetectWallRight
@onready var sprite = $Sprite2D

func _physics_process(delta):
	var new_anim = "idle"

	if state == STATE_WALKING:
		linear_velocity += GRAVITY_VEC * delta
		linear_velocity.x = direction * WALK_SPEED
		set_velocity(linear_velocity)
		set_up_direction(FLOOR_NORMAL)
		move_and_slide()
		linear_velocity = velocity

		if not DetectFloorLeft.is_colliding() or DetectWallLeft.is_colliding():
			direction = 1.0

		if not DetectFloorRight.is_colliding() or DetectWallRight.is_colliding():
			direction = -1.0

		sprite.scale = Vector2(direction, 1.0)
		new_anim = "walk"
	else:
		new_anim = "explode"

	if anim != new_anim:
		anim = new_anim
		($Anim as AnimationPlayer).play(anim)

func hit_by_bullet():
	state = STATE_KILLED



func _on_StompDetector_body_entered(_bbody: PhysicsBody2D) ->void:
	queue_free()
	get_tree().reload_current_scene()
	PlayerData.score = 0

