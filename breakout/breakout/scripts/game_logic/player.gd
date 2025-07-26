extends CharacterBody2D

var player_lives : int = 3
var player_score : int = 0
var player_name : String
var mouse_pos

func _ready() -> void:
	Signals.connect("on_score", increment_score)

	player_lives = 3
	player_score = 0

func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	position.x = mouse_pos.x
	var target_pos : Vector2
	if position.x >= 1100.0:
		target_pos = Vector2(1100.0, 585.0)
	if position.x <= 100.0:
		target_pos = Vector2(100.0, 585.0)
	else:
		target_pos = Vector2(position.x, 585.0)
	move_and_collide(target_pos)

func increment_score(score : int) -> void:
	player_score += score
