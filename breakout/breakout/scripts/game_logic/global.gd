extends Node

var ui_manager
var level_manager : Array

func _ready() -> void:
    Signals.connect("on_victory", victory_screen)
    Signals.connect("on_defeat", defeat_screen)

    ui_manager = load("res://scripts/ui_scenes/playerui.tscn").new()
    add_child(ui_manager)

    var player_manager : Resource = load("res://scenes/game_scenes/player.tscn")
    var player : Node = player_manager.instantiate()
    add_child(player)

    var ball_manager : Resource = load("res://scenes/game_scenes/ball.tscn")
    var ball : Node = ball_manager.instantiate()
    add_child(ball)

    if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
    pass

func victory_screen() -> void:
    pass

func defeat_screen() -> void:
    if Input.get_mouse_mode() != Input.MOUSE_MODE_VISIBLE:
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# make sure this works with different levels
func retry_game() -> void:
    get_tree().reload_current_scene()