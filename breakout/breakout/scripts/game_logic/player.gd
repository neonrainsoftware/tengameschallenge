extends Node

var player_lives : int = 3
var player_score : int = 0

func _ready() -> void:
    Signals.connect("on_score", increment_score)

    player_lives = 3
    player_score = 0

func _process(delta: float) -> void:
    pass

func increment_score(score : int) -> void:
    player_score += score