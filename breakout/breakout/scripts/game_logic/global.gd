extends Node

var ui_manager
var ball_manager
var level_manager : Array
var player : Node
var ball_pos : Vector2 = Vector2(-5.0, 66.0)

func _ready() -> void:
	Signals.connect("on_victory", victory_screen)
	Signals.connect("on_defeat", defeat_screen)
	Signals.connect("on_ball_destroy", retry_game)

	ui_manager = load("res://scenes/ui_scenes/playerui.tscn")
	var uichild = ui_manager.instantiate()
	add_child(uichild)

	ball_manager = load("res://scenes/game_scenes/ball.tscn")
	var ballchild = ui_manager.instantiate()
	add_child(ballchild)
	ballchild.position = ball_pos

	for level_brick in get_tree().get_nodes_in_group("Bricks"):
		Signals.bricks_in_level[level_brick.get_instance_id()] = level_brick

	if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	if Signals.bricks_in_level.is_empty():
		victory_screen()

func victory_screen() -> void:
	get_tree().change_scene_to_file("res://scenes/ui_scenes/victory.tscn")

func defeat_screen() -> void:
	if Input.get_mouse_mode() != Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# TODO: make sure this works with different levels
func retry_game() -> void:
	var ballchild = ui_manager.instantiate()
	add_child(ballchild)
	ballchild.position = ball_pos
