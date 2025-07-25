extends Node

var brick_lives : int = 3
@onready var color_brick : int = 3

func _ready() -> void:
    brick_lives = 3

func _process(delta: float) -> void:
    # TODO: ON HIT
    Signals.emit_signal("on_score", 100)
    brick_lives -= 1
    match brick_lives:
        2:  color_brick = 2
        1: color_brick = 1
        _: queue_free()