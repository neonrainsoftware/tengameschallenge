extends Node

# var packedObj = preload("res://scenes/movingobstacle.tscn")
var score : int = 0
var ui_manager 
var	player_manager = preload("res://scenes/player.tscn")

@export var packedObj : PackedScene
@export var obstacle_count : int = 5

func _ready() -> void:
	# global signals
	Globalvars.connect("on_scoring", add_score)
	Globalvars.connect("on_lose", game_over)
	
	# loading UI
	ui_manager = load("res://scripts/ui/gameui.gd").new()
	add_child(ui_manager)

	# adding player
	add_child(player_manager)

func spawn_obstacle() -> void:
	var obs : Node = packedObj.instantiate()
	add_child(obs)
		# var random_scale : float = randf_range(0.5, 2.0)
		# obs.scale  
		# var random_pos = Vector2(randf_range()


func add_score() -> void:
	score += 1
	ui_manager.ui_elements["score"].text = str("Score: ", score)

func game_over() -> void:
	pass
