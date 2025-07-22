extends Node

var packedObs = preload("res://scenes/platforms/movingobstaclev2.tscn")
var score : int = 0
var ui_manager 
var is_lost : bool = false
var time_elapsed : float = 0.0

@export var obstacle_count : int = 0

func _ready() -> void:
	# global signals
	Globalvars.connect("on_scoring", add_score)
	Globalvars.connect("on_lose", game_over)
	Globalvars.connect("on_destroy", decrement_count)
	
	# loading UI
	ui_manager = load("res://scripts/ui/gameui.gd").new()
	add_child(ui_manager)

	# adding player
	var	player_manager : Resource = load("res://scenes/player.tscn")
	var player = player_manager.instantiate()
	add_child(player)

func _process(delta: float) -> void:
	time_elapsed += delta
	if not is_lost and obstacle_count <= 5:
		if time_elapsed >= 1.0:
			spawn_obstacle()
			obstacle_count += 1
			time_elapsed = 0.0

func spawn_obstacle() -> void:
	var obs : Node = packedObs.instantiate()
	add_child(obs)
	obs.position = Vector2(1400.0, 0.0)

func add_score() -> void:
	score += 1
	ui_manager.ui_elements["score"].text = str("Score: ", score)

func game_over() -> void:
	is_lost = true
	pass

func decrement_count():
	obstacle_count -= 1
