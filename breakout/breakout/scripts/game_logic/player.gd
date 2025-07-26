extends Node2D

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

func increment_score(score : int) -> void:
	player_score += score
